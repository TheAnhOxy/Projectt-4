package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findByIdIn(List <Long> ids);
    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);
//    List<BuildingEntity> findBuildingIdAtRentArea(Long id);
//    List<BuildingEntity> findBuildingIdAtAssignment(Long id);
//    void deleteByIdIn(List<Long> ids);
     int countTotalItem(List<BuildingSearchResponse> list);

}
