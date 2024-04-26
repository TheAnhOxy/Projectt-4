package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long>{
    //    void deleteByBuildingIn(List<Long> buildingIds);
    List<RentAreaEntity> findAllByBuildingIn(List<Long> buildingIds);
    void deleteByBuilding(BuildingEntity building);
    List<RentAreaEntity> findByBuilding_Id(Long buildingId);
    void deleteByBuilding_Id(Long buildingId);
    void deleteAllByBuilding_IdIn(List<Long> buildingIds);


}
