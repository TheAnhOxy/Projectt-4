package com.javaweb.repository;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Long> {
    List<TransactionEntity> findByCodeAndCustomers(String code, Long customerId);
    List<TransactionEntity> findByCustomers_IdAndCode(Long customerId, String Code);
    List<TransactionEntity> findByCustomers_Id(Long customerId);
}
