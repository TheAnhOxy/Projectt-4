package com.javaweb.repository.custom;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.domain.Pageable;

import java.awt.*;
import java.util.List;

public interface CustomerRepositoryCustom {
    List<CustomerEntity> findAll(CustomerSearchBuilder customerSearchBuilder, Pageable pageable);
    List<CustomerEntity> findByIdIn(List <Long> ids);
    int countTotalItem(List<CustomerSearchResponse> list);
}
