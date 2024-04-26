package com.javaweb.repository.custom.impl;

        import java.lang.reflect.Field;

        import java.util.Arrays;
        import java.util.Collections;
        import java.util.List;
        import java.util.stream.Collectors;

        import javax.persistence.EntityManager;
        import javax.persistence.PersistenceContext;
        import javax.persistence.Query;
        import javax.persistence.TypedQuery;
        import javax.transaction.Transactional;

        import com.javaweb.entity.BuildingEntity;
        import com.javaweb.entity.UserEntity;
        import com.javaweb.model.response.BuildingSearchResponse;
        import com.javaweb.repository.BuildingRepository;
        import org.springframework.context.annotation.Primary;
        import org.springframework.data.domain.Pageable;
        import org.springframework.data.repository.query.Param;
        import org.springframework.stereotype.Repository;

        import com.javaweb.builder.BuildingSearchBuilder;
        import com.javaweb.repository.custom.BuildingRepositoryCustom;


@Repository
@Primary
@Transactional
public class BuildingRepositoryImpl  implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;


    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if(staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding a ON a.buildingid = b.id ");
        }
//    	   List <String> typeCode = buildingSearchBuilder.getTypeCode();
//    	   if(typeCode != null && typeCode.size() != 0) {
//    		   sql.append(" INNER JOIN buildingrenttype c ON b.id = c.buildingid join renttype k ON c.renttypeid = k.id ");
//    	   }
//    	   String rentAreTo = buildingSearchBuilder.getAreaTo().toString();
//    	   String rentAreFrom = buildingSearchBuilder.getAreaFrom().toString();
//    	   if(StringUtil.checkString(rentAreFrom) == true || StringUtil.checkString(rentAreTo) == true) {
//    		   sql.append(" INNER JOIN rentarea q on b.id = q.buildingid ");
//    	   }
    }

    public static void queryNormal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId")  &&
                        !fieldName.startsWith("area") && !fieldName.equals("type") && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchBuilder);
                    if(value != null) {
                        if(item.getType().getName().equals("java.lang.Integer") || item.getType().getName().equals("java.lang.Long") ||
                                item.getType().getName().equals("java.lang.Float")) {
                            where.append(" AND b." + fieldName + " = " + value);
                        }
                        else if(item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName + " Like '%" + value + "%' ");
                        }
                    }
                }
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if(staffId != null) {
            where.append(" AND a.staffid = " + staffId);
        }
        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea q WHERE b.id = q.buildingid ");
            if(rentAreaFrom != null) {
                where.append(" AND q.value >=" + rentAreaFrom);
            }
            if(rentAreaTo != null) {
                where.append(" AND q.value <=" + rentAreaTo);
            }
            where.append(") ");
        }
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        if(rentPriceFrom != null || rentPriceTo != null) {
            if(rentPriceFrom != null) {
                where.append(" AND b.rentprice >=" + rentPriceFrom);
            }
            if(rentPriceTo != null) {
                where.append(" AND b.rentprice <=" + rentPriceTo);
            }
        }
        // java 7
//    	   if(typeCode != null && typeCode.size() != 0) {
//    		  List<String> code = new ArrayList<>();
//    		  for(String item : typeCode) {
//    			  code.add("'" + item + "'");
//    		  }
//    		  where.append(" AND k.code IN(" + String.join(",", code) + ") ");
//    	   }
            List<String> type = buildingSearchBuilder.getType();
            if (type != null && !type.isEmpty()) {
                where.append(" AND (");
                String sql = type.stream().map(it -> "b.type LIKE '%" + it + "%'").collect(Collectors.joining(" OR "));
                where.append(sql);
                where.append(" ) ");
            }

        // java 8
//    	   if(type != null && type.size() != 0) {
//    		   where.append(" AND (");
//    		   String sql = type.stream().map(it -> "b.code like" + "'%" + it + "%'").collect(Collectors.joining(" OR "));
//    		   where.append(sql);
//    		   where.append(" ) ");
//    	   }
    }

    @Override
    public   List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {
       // b.*
        StringBuilder sql = new StringBuilder("Select b.* From building b ");
//        StringBuilder sql = new StringBuilder(" select b.id, b.name, b.street, b.ward, b.district, b.numberofbasement, b.floorarea, b.direction, b.level, b.rentprice, b.rentpricedescription, b.servicefee," +
//                " b.carfee, b.motofee, b.overtimefee, b.waterfee, b.electricityfee, b.deposit, b.payment, b.renttime, b.decorationtime, b.brokeragefee, b.type, b.note, b.managername, b.managerphone from building b ");
        joinTable(buildingSearchBuilder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);

        where.append(" GROUP BY b.id");
//        getAlBuilding(pageable, where);
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    public void getAlBuilding(Pageable pageable, StringBuilder where) {

        where.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());

    }

    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        int totalCount = 0;
        for (BuildingSearchResponse response : list) {
            String sql = buildQueryFilter(response.getId());
            Query query = entityManager.createNativeQuery(sql);
            totalCount += query.getResultList().size();
        }
        return totalCount;
    }

//    public int countTotalItem(BuildingSearchResponse buildingSearchResponse) {
//        String sql = buildQueryFilter(buildingSearchResponse.getId());
//        Query query = entityManager.createNativeQuery(sql);
//        return query.getResultList().size();
//    }

    private String buildQueryFilter(Long id) {
        String sql = "SELECT * FROM building b WHERE b.id = "  + id;
        return sql;
    }



    @Override
    public List<BuildingEntity> findByIdIn(List<Long> id) {
        StringBuilder sb = new StringBuilder();
        for (Long idd : id) {
            sb.append(idd).append(",");
        }
        String joinedIds = sb.deleteCharAt(sb.length() - 1).toString();
        String sql = "SELECT * FROM building b WHERE b.id IN ( " + joinedIds + " )";
        Query query = entityManager.createNativeQuery(sql, BuildingEntity.class);
        return query.getResultList();
    }






}