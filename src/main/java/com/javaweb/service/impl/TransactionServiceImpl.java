package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private TransactionConverter transactionConverter;


    @Override
    public TransactionEntity saveTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionConverter.convertToTransactionEntity(transactionDTO);
        return transactionRepository.save(transactionEntity);
    }


    @Override
    public TransactionDTO findTransactionById(Long id) {
        TransactionEntity transactionEntity = transactionRepository.findById(id).orElse(null);
        TransactionDTO  transsa = transactionConverter.convertTransToDto(transactionEntity);
        return transsa;
    }

    @Override
    public List<TransactionDTO> findByCus(Long id) {
        return transactionRepository.findByCustomers_Id(id).stream()
                .map(transactionConverter::convertTransToDto)
                .collect(Collectors.toList());
//        TransactionEntity transactionEntity = transactionRepository.findById(id).orElse(null);
//        TransactionDTO  transsa = transactionConverter.convertTransToDto(transactionEntity);
//        return transsa;
    }


    @Override
    public List<TransactionDTO> findCustomer(Long customerId, String type) {
        return transactionRepository.findByCustomers_IdAndCode(customerId, type).stream()
                .map(transactionConverter::convertToDto)
                .collect(Collectors.toList());
    }

}
