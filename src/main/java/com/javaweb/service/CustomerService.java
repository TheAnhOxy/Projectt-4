package com.javaweb.service;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
     List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);
     ResponseDTO listStaffs(Long customerId);
     CustomerDTO addOrUpdateCustomer(CustomerDTO customerDTO);
     CustomerDTO addNewCustomer(CustomerDTO customerDTO);
     CustomerDTO findCustomerById(Long id);
     int countTotalItem(List<CustomerSearchResponse> list);
     void deleteCustomer(List<Long> ids);
}
