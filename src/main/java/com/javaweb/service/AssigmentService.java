package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;

import java.util.List;

public interface AssigmentService {
//    void updateAssigmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
        void updateAssigmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
        void updateAssigmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
}
