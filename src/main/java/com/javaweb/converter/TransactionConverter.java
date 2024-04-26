package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.security.utils.SecurityUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;


@Component
public class TransactionConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CustomerRepository customerRepository;

    public TransactionDTO convertToDto (TransactionEntity entity){
        TransactionDTO trans = modelMapper.map(entity, TransactionDTO.class);
        return trans;
    }



    public TransactionEntity convertToTransactionEntity(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity;
        if (transactionDTO.getId() != null) {
            transactionEntity = transactionRepository.findById(transactionDTO.getId()).orElse(null);
            if (transactionEntity != null) {
                transactionEntity.setNote(transactionDTO.getTransactionDetails());
                transactionEntity.setModifiedDate(new Date());
                String staffId = SecurityUtils.getPrincipal().getUsername();
                transactionEntity.setModifiedBy(staffId);
//                Long staffId = SecurityUtils.getPrincipal().getId();
            }
        } else {
            transactionEntity = new TransactionEntity();
            transactionEntity.setCode(transactionDTO.getCode());
            transactionEntity.setNote(transactionDTO.getTransactionDetails());
        }
        if (transactionDTO.getCustomerId() != null) {
            CustomerEntity customer = customerRepository.findById(transactionDTO.getCustomerId()).get();
            transactionEntity.setCustomers(customer);
        }
        return transactionEntity;
    }



    public TransactionDTO convertTransToDto(TransactionEntity entity){
        TransactionDTO transa = modelMapper.map(entity, TransactionDTO.class);
        return transa;
    }

}
