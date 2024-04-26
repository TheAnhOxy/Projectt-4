package com.javaweb.service;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;

import java.util.List;


public interface TransactionService {
    TransactionEntity saveTransaction(TransactionDTO transactionDTO);
    List<TransactionDTO> findCustomer(Long id, String code);
    TransactionDTO findTransactionById(Long id);
    List<TransactionDTO> findByCus(Long id);
}
