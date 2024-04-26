package com.javaweb.converter;

import com.javaweb.builder.CustomerSearchBuilder;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

@Component
public class CustomerSearchBuilderConverter {
    public CustomerSearchBuilder toCustomerSearchBuilder(CustomerSearchRequest customerSearchRequest) {
        CustomerSearchBuilder customerSearchBuilder = new CustomerSearchBuilder.Builder()
                .setFullName(MapUtils.getObject(customerSearchRequest.getFullName(), String.class))
                .setPhone(MapUtils.getObject(customerSearchRequest.getPhone(), String.class))
                .setEmail(MapUtils.getObject(customerSearchRequest.getEmail(), String.class))
                .setStaffId(MapUtils.getObject(customerSearchRequest.getStaffId(), Long.class))
                .build();
        return customerSearchBuilder;
    }
}
