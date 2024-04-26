package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="building")
public class BuildingEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "floorarea")
    private Long floorArea;

    @Column(name = "ward")
    private String ward;

    @Column(name = "street")
    private String street;

    @Column(name = "numberofbasement")
    private Long numberOfBasement;

    @Column(name = "direction")
    private String direction;

    @Column(name = "level")
    private String level;

    @Column(name = "rentprice")
    private Long rentPrice;

    @Column(name = "managername")
    private String managerName;

    @Column(name = "managerphone")
    private String managerPhone;

    @Column(name = "rentpricedescription")
    private String rentPriceDiscription;

    @Column(name = "servicefee")
    private String serviceFee;

    @Column(name = "district")
    private String district;

    @Column(name = "type")
    private String type;

    @Column(name="brokeragefee")
    private Double brokerageFee;

    @Column(name = "motofee")
    private String motoFee;
////
    @Column(name = "waterfee")
    private String waterFee;
//
    @Column(name = "electricityfee")
    private String electricityFee;
////
    @Column(name = "deposit")
    private String deposit;

    @Column(name = "payment")
    private String payment;

    @Column(name = "renttime")
    private String rentTime;

    @Column(name = "decorationtime")
    private String decorationtime;

    @Column(name = "note")
    private String note;

    @Column(name = "overtimefee")
    private String overtimeFree;

//    @Column(name = "linkofbuilding")
//    private String linkOfBuilding;
//
//    @Column(name = "map")
//    private String map;
//
    @Column(name = "avatar")
    private String avatar;

//    @Column(name = "modifiedby")
//    private String modifiedBy;
//


    public String getOvertimeFree() {
        return overtimeFree;
    }

    public void setOvertimeFree(String overtimeFree) {
        this.overtimeFree = overtimeFree;
    }

    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE}, orphanRemoval = true)
    private List<RentAreaEntity> rentAreaEntities = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "assignmentbuilding",
            joinColumns = @JoinColumn(name = "buildingid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> users = new ArrayList<>();

//    @OneToMany(mappedBy = "building", fetch = FetchType.LAZY)
//    private List<AssignmentBuildingEntity> assignmentBuildings = new ArrayList<>();

    public String getRentPriceDiscription() {
        return rentPriceDiscription;
    }

    public void setRentPriceDiscription(String rentPriceDiscription) {
        this.rentPriceDiscription = rentPriceDiscription;
    }

//    public String getMotorbikeFee() {
//        return motorbikeFee;
//    }
//


    public List<UserEntity> getUsers() {
        return users;
    }

    public void setUsers(List<UserEntity> users) {
        this.users = users;
    }

    public String getWaterFee() {
        return waterFee;
    }

    public void setWaterFee(String waterFee) {
        this.waterFee = waterFee;
    }

    public String getElectricityFee() {
        return electricityFee;
    }

    public void setElectricityFee(String electricityFee) {
        this.electricityFee = electricityFee;
    }

    public String getMotoFee() {
        return motoFee;
    }

    public void setMotoFee(String motoFee) {
        this.motoFee = motoFee;
    }

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getRentTime() {
        return rentTime;
    }

    public void setRentTime(String rentTime) {
        this.rentTime = rentTime;
    }

    public String getDecorationtime() {
        return decorationtime;
    }

    public void setDecorationtime(String decorationtime) {
        this.decorationtime = decorationtime;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    //    public void setMotorbikeFee(String motorbikeFee) {
//        this.motorbikeFee = motorbikeFee;
//    }
//
//    public String getWaterFee() {
//        return waterFee;
//    }
//
//    public void setWaterFee(String waterFee) {
//        this.waterFee = waterFee;
//    }
//
//    public String getElectricityFee() {
//        return electricityFee;
//    }
//
//    public void setElectricityFee(String electricityFee) {
//        this.electricityFee = electricityFee;
//    }
//
//    public String getDeposit() {
//        return deposit;
//    }
//
//    public void setDeposit(String deposit) {
//        this.deposit = deposit;
//    }
//
//    public String getPayment() {
//        return payment;
//    }
//
//    public void setPayment(String payment) {
//        this.payment = payment;
//    }
//
//    public String getRentTime() {
//        return rentTime;
//    }
//
//    public void setRentTime(String rentTime) {
//        this.rentTime = rentTime;
//    }
//
//    public String getDecorationtime() {
//        return decorationtime;
//    }
//
//    public void setDecorationtime(String decorationtime) {
//        this.decorationtime = decorationtime;
//    }
//
//    public String getNote() {
//        return note;
//    }
//
//    public void setNote(String note) {
//        this.note = note;
//    }
//
//    public String getLinkOfBuilding() {
//        return linkOfBuilding;
//    }
//
//    public void setLinkOfBuilding(String linkOfBuilding) {
//        this.linkOfBuilding = linkOfBuilding;
//    }
//
//    public String getMap() {
//        return map;
//    }
//
//    public void setMap(String map) {
//        this.map = map;
//    }
//
//    public String getImage() {
//        return image;
//    }
//
//    public void setImage(String image) {
//        this.image = image;
//    }

    public String getServiceFee() {
        return serviceFee;
    }
    public void setServiceFee(String serviceFee) {
        this.serviceFee = serviceFee;
    }
    public Double getBrokerageFee() {
        return brokerageFee;
    }
    public void setBrokerageFee(Double brokerageFee) {
        this.brokerageFee = brokerageFee;
    }
    public List<RentAreaEntity> getRentAreaEntities() {
        return rentAreaEntities;
    }
    public void setRentAreaEntities(List<RentAreaEntity> rentAreaEntities) {
        this.rentAreaEntities = rentAreaEntities;
    }

    public Long getRentPrice() {
        return rentPrice;
    }
    public void setRentPrice(Long rentPrice) {
        this.rentPrice = rentPrice;
    }
    public String getName() {
        return name;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Long getFloorArea() {
        return floorArea;
    }
    public void setFloorArea(Long floorArea) {
        this.floorArea = floorArea;
    }
    public String getWard() {
        return ward;
    }
    public void setWard(String ward) {
        this.ward = ward;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public Long getNumberOfBasement() {
        return numberOfBasement;
    }
    public void setNumberOfBasement(Long numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }
    public String getDirection() {
        return direction;
    }
    public void setDirection(String direction) {
        this.direction = direction;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public String getManagerName() {
        return managerName;
    }
    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }
    public String getManagerPhone() {
        return managerPhone;
    }
    public void setManagerPhone(String managerPhone) {
        this.managerPhone = managerPhone;
    }
    public String getDistrict() {
        return district;
    }
    public void setDistrict(String district) {
        this.district = district;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }


    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
