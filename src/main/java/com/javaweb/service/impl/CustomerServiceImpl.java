package com.javaweb.service.impl;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.converter.CustomerDTOConverter;
import com.javaweb.converter.CustomerSearchBuilderConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {


    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerDTOConverter customerDTOConverter;

    @Autowired
    private CustomerSearchBuilderConverter customerSearchBuilderConverter;

    @Autowired
    private CustomerRepositoryCustom customerRepositoryCustom;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private UserRepository userRepository;


    @Override
    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        CustomerSearchBuilder customerSearchBuilder = customerSearchBuilderConverter.toCustomerSearchBuilder(customerSearchRequest);
        List <CustomerEntity> customerEntities = customerRepositoryCustom.findAll(customerSearchBuilder, pageable);
        List <CustomerSearchResponse> result = new ArrayList<>();
        for(CustomerEntity item : customerEntities) {
            CustomerSearchResponse customer = customerDTOConverter.toCustomerDTO(item);
            result.add(customer);
        }
        return result;
    }

    @Override
    public int countTotalItem(List<CustomerSearchResponse> list) {
        return customerRepositoryCustom.countTotalItem(list);
    }
    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customer = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customer.getUsers();
        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
        ResponseDTO result = new ResponseDTO();
        for(UserEntity item : staffs){
            StaffResponseDTO staffResponse = new StaffResponseDTO();
            staffResponse.setFullName(item.getFullName());
            staffResponse.setStaffId(item.getId());
            if(staffAssignment.contains(item)){
                staffResponse.setChecked("checked");
            }
            else{
                staffResponse.setChecked("");
            }
            staffResponseDTOs.add(staffResponse);

        }
        result.setData(staffResponseDTOs);
        result.setMessage("Success");
        return result;
    }



    @Transactional
    public CustomerDTO addOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity customerEntity = customerDTOConverter.convertToCustomerEntity(customerDTO);
        customerRepository.save(customerEntity);
        return modelMapper.map(customerEntity, CustomerDTO.class);
    }

    @Transactional
    public CustomerDTO addNewCustomer(CustomerDTO customerDTO) {
        try {
            CustomerEntity customerEntity = customerDTOConverter.convertToCusEntity(customerDTO);
            customerRepository.save(customerEntity);
            return modelMapper.map(customerEntity, CustomerDTO.class);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error");
        }
    }



    @Override
    public CustomerDTO findCustomerById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).orElse(null);
        CustomerDTO  cus = customerDTOConverter.convertToDto(customerEntity);
        return cus;
    }

    @Override
    public void deleteCustomer(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }
        List<CustomerEntity> customers = customerRepository.findAllById(ids);
        for (CustomerEntity customer : customers) {
            if (customer.getActive()) {
                customer.setActive(false);
                customerRepository.save(customer);
            }
        }
    }

}
