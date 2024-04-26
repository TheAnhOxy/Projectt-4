package com.javaweb.converter;


import com.javaweb.entity.CustomerEntity;

import com.javaweb.entity.UserEntity;
import com.javaweb.enums.StatusType;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class CustomerDTOConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;

    public CustomerSearchResponse toCustomerDTO(CustomerEntity item) {
        CustomerSearchResponse customer = modelMapper.map(item, CustomerSearchResponse.class);
        if (item.getStatus() != null) {
            try {
                String statusName = StatusType.type().get(item.getStatus());
                customer.setStatus(statusName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return customer;
    }

//    public CustomerEntity convertToCustomerEntity(CustomerDTO customerDTO) {
//        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
//        UserEntity staffId = userRepository.findById()
//        if (staffIds != null && !staffIds.isEmpty()) {
//            List<UserEntity> staffs = userRepository.findAllById(staffIds);
//            customerEntity.setUsers(staffs);
//        }
//        customerRepository.save(customerEntity);
//        return customerEntity;
//    }


    public CustomerEntity convertToCustomerEntity(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = null ;
        if (customerDTO.getId() != null) {
            customerEntity = customerRepository.findById(customerDTO.getId()).get();
            customerEntity.setFullName(customerDTO.getFullName());
            customerEntity.setPhone(customerDTO.getPhone());
            customerEntity.setEmail(customerDTO.getEmail());
            customerEntity.setCompanyName(customerDTO.getCompanyName());
            customerEntity.setDemand(customerDTO.getDemand());
            customerEntity.setStatus(customerDTO.getStatus());
            // keep mqh
            if (customerDTO.getStaffIds() != null && !customerDTO.getStaffIds().isEmpty()) {
                List<UserEntity> staffs = userRepository.findAllById(customerDTO.getStaffIds());
                customerEntity.setUsers(staffs);
            }
        }
        else{
            customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        }

        return customerEntity;
    }





    public CustomerEntity convertToCusEntity(CustomerDTO customerDTO){
        CustomerEntity customerEntity = new CustomerEntity();
        customerEntity.setFullName(customerDTO.getFullName());
        customerEntity.setPhone(customerDTO.getPhone());
        customerEntity.setEmail(customerDTO.getEmail());
        customerEntity.setStatus("CHUA_XU_LY");
//        customerEntity.setCreatedBy(null);
        customerEntity.setDemand(customerDTO.getDemand());
        customerEntity.setActive(true);
        customerRepository.save(customerEntity);
        return customerEntity;
    }






    public CustomerDTO convertToDto (CustomerEntity entity){
        CustomerDTO custmer = modelMapper.map(entity, CustomerDTO.class);
        return custmer;
    }

}
