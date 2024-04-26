//package com.javaweb.repository;
//
//import com.javaweb.entity.AssignmentBuildingEntity;
//import com.javaweb.entity.BuildingEntity;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.List;
//
//public interface AssignmentbuildingRepository extends JpaRepository<AssignmentBuildingEntity, Long> {
//    //    void deleteByBuildingidIn(List<Long> buildingIds);
//    List<AssignmentBuildingEntity> findByBuilding_Id(Long buildingId);
//    void deleteByBuilding(Long buildingId);
//    @Transactional
//    void deleteByBuilding(BuildingEntity building);
//    void deleteAllByBuilding_IdIn(List<Long> buildingIds);
//
//
//}
