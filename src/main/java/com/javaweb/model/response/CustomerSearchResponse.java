package com.javaweb.model.response;

import com.javaweb.model.dto.AbstractDTO;

import java.util.Date;

public class CustomerSearchResponse extends AbstractDTO {

    private String fullName;
    private String phone;
    private String email;
    private String demand;
    private String status;

//    private Date createdDate;
//    private String createdBy;
//    private Date modifiedDate;
//    private String modifiedBy;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

//    @Override
//    public Date getCreatedDate() {
//        return createdDate;
//    }

//    @Override
//    public void setCreatedDate(Date createdDate) {
//        this.createdDate = createdDate;
//    }
//
//    @Override
//    public String getCreatedBy() {
//        return createdBy;
//    }
//
//    @Override
//    public void setCreatedBy(String createdBy) {
//        this.createdBy = createdBy;
//    }
//
//    @Override
//    public Date getModifiedDate() {
//        return modifiedDate;
//    }
//
//    @Override
//    public void setModifiedDate(Date modifiedDate) {
//        this.modifiedDate = modifiedDate;
//    }
//
//    @Override
//    public String getModifiedBy() {
//        return modifiedBy;
//    }
//
//    @Override
//    public void setModifiedBy(String modifiedBy) {
//        this.modifiedBy = modifiedBy;
//    }
}
