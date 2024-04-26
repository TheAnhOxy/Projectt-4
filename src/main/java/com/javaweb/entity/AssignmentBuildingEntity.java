//package com.javaweb.entity;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "assignmentbuilding")
//public class AssignmentBuildingEntity{
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @ManyToOne
//    @JoinColumn(name ="buildingid")
//    private BuildingEntity building;
//
//    @ManyToOne
//    @JoinColumn(name ="staffid")
//    private UserEntity staffs;
//
//    public Long getId() {
//        return id;
//    }
//
//    public void setId(Long id) {
//        this.id = id;
//    }
//
////    public Integer getStaffId() {
////        return staffId;
////    }
////
////    public void setStaffId(Integer staffId) {
////        this.staffId = staffId;
////    }
//
//
////    public Integer getBuildingId() {
////        return buildingId;
////    }
////
////    public void setBuildingId(Integer buildingId) {
////        this.buildingId = buildingId;
////    }
//
//
//    public BuildingEntity getBuilding() {
//        return building;
//    }
//
//    public void setBuilding(BuildingEntity building) {
//        this.building = building;
//    }
//
//    public UserEntity getStaffs() {
//        return staffs;
//    }
//
//    public void setStaffs(UserEntity staffs) {
//        this.staffs = staffs;
//    }
//
//
//
//}
