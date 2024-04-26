package com.javaweb.repository.custom.impl;



import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.lang.reflect.Field;
import java.util.List;

@Repository
@Primary
@Transactional
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;


    public static void joinTable(CustomerSearchBuilder customerSearchBuilder, StringBuilder sql) {
        Long staffId = customerSearchBuilder.getStaffId();
        if(staffId != null) {
            sql.append(" INNER JOIN assignmentcustomer a ON a.customerid = h.id ");
        }
    }

    public static void queryNormal(CustomerSearchBuilder customerSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = CustomerSearchBuilder.class.getDeclaredFields();
            for(Field it : fields) {
                it.setAccessible(true);
                String fieldName = it.getName();
                if(!fieldName.equals("staffId")) {
                    Object value = it.get(customerSearchBuilder);
                    if(value != null) {
                        if(it.getType().getName().equals("java.lang.Integer") || it.getType().getName().equals("java.lang.Long") ||
                                it.getType().getName().equals("java.lang.Float")) {
                            where.append(" AND h." + fieldName + " = " + value);
                        }
                        else if(it.getType().getName().equals("java.lang.String")) {
                            where.append(" AND h." + fieldName + " Like '%" + value + "%' ");
                        }
                    }
                }
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void querySpecial(CustomerSearchBuilder customerSearchBuilder, StringBuilder where) {
        Long staffId = customerSearchBuilder.getStaffId();
        if (staffId != null) {
            where.append(" AND a.staffid = " + staffId);
        }
    }


    @Override
    public  List<CustomerEntity> findAll(CustomerSearchBuilder customerSearchBuilder, Pageable pageable) {
        // b.*
        StringBuilder sql = new StringBuilder("Select h.* From customer h ");
        joinTable(customerSearchBuilder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 AND h.is_active = 1");
        queryNormal(customerSearchBuilder, where);
        querySpecial(customerSearchBuilder, where);
        where.append(" GROUP BY h.id");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }




    @Override
    public List<CustomerEntity> findByIdIn(List<Long> id) {
        StringBuilder sb = new StringBuilder();
        for (Long idd : id) {
            sb.append(idd).append(",");
        }
        String joinedIds = sb.deleteCharAt(sb.length() - 1).toString();
        String sql = "SELECT * FROM customer b WHERE b.id IN ( " + joinedIds + " )";
        Query query = entityManager.createNativeQuery(sql, CustomerEntity.class);
        return query.getResultList();
    }


    public void getAlCustomer(Pageable pageable, StringBuilder where) {

        where.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());

    }

    @Override
    public int countTotalItem(List<CustomerSearchResponse> list) {
        int totalCount = 0;
        for (CustomerSearchResponse response : list) {
            String sql = buildQueryFilter(response.getId());
            Query query = entityManager.createNativeQuery(sql);
            totalCount += query.getResultList().size();
        }
        return totalCount;
    }



    private String buildQueryFilter(Long id) {
        String sql = "SELECT * FROM customer b WHERE b.id = "  + id;
        return sql;
    }


}
