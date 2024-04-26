package com.javaweb.service.impl;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssigmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AssigmentServiceImpl implements AssigmentService {


    @Autowired
    private UserRepository userRepository;
    @Autowired
    BuildingRepository buildingRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void updateAssigmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        Long buildingId = assignmentBuildingDTO.getBuildingId();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        BuildingEntity building = buildingRepository.findById(buildingId).orElse(null);
        if (building == null) {
            return;
        }
        building.getUsers().clear();
        for (Long staffId : staffIds) {
            UserEntity staff = userRepository.findById(staffId).orElse(null);
            if (staff != null) {
                building.getUsers().add(staff);
            }
        }
        buildingRepository.save(building);
    }

    @Override
    public void updateAssigmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        Long customerId = assignmentCustomerDTO.getCustomerId();
        List<Long> staffIds = assignmentCustomerDTO.getStaffs();
        CustomerEntity customer = customerRepository.findById(customerId).orElse(null);
        if (customer == null) {
            return;
        }
        customer.getUsers().clear();
        for (Long staffId : staffIds) {
            UserEntity staff = userRepository.findById(staffId).orElse(null);
            if (staff != null) {
                customer.getUsers().add(staff);
            }
        }
        customerRepository.save(customer);
    }

//    public void updateAssigmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
//       Long buildingId = assignmentBuildingDTO.getBuildingId();
//       List<Long> staffIds = assignmentBuildingDTO.getStaffs();
//       BuildingEntity building = buildingRepository.findById(buildingId).orElse(null);
//       if(building == null){
//           return ;
//       }
//        assignmentbuildingRepository.deleteByBuilding(building);
//        for (Long staffId : staffIds) {
//            UserEntity staff = userRepository.findById(staffId).orElse(null);
//            // check nhan vien có or not
//            if(staff != null){
//                AssignmentBuildingEntity assignmentBuilding = new AssignmentBuildingEntity();
//                assignmentBuilding.setBuilding(building);
//                assignmentBuilding.setStaffs(staff);
//                assignmentbuildingRepository.save(assignmentBuilding);
//            }
//        }
//    }
//}
}
