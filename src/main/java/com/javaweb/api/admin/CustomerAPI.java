package com.javaweb.api.admin;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssigmentService;
import com.javaweb.service.CustomerService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "CustomerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {

    @Autowired
    private CustomerService customerService;

    @Autowired
    AssigmentService assigmentService;

    @Autowired
    private TransactionService transactionService;






//    @PostMapping("/newCustomer")
//    public ResponseEntity<CustomerDTO> addNewCustomers(@RequestBody CustomerDTO customerDTO){
//        CustomerDTO result = customerService.addNewCustomer(customerDTO);
//        return ResponseEntity.ok().body(result);
//    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @PostMapping("/assigment")
    public void updateAssigmentCusmer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        assigmentService.updateAssigmentCustomer(assignmentCustomerDTO);
    }



    @PostMapping
    public ResponseEntity<CustomerDTO> addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
            CustomerDTO result = customerService.addOrUpdateCustomer(customerDTO);
            return ResponseEntity.ok().body(result);
    }

    @PostMapping("/delete/{ids}")
    public void deleteCustomer(@PathVariable List<Long> ids) {
        if (ids.isEmpty()) {
            return;
        }
        customerService.deleteCustomer(ids);
    }

    @PostMapping("/transaction")
    public ResponseEntity<TransactionEntity> addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO) {
        TransactionEntity savedTransaction = transactionService.saveTransaction(transactionDTO);
        return ResponseEntity.ok(savedTransaction);
    }


    @PostMapping("/newCustomer")
    public ResponseEntity<CustomerDTO> addNewCustomer(@RequestBody CustomerDTO customerDTO){
        CustomerDTO result = customerService.addNewCustomer(customerDTO);
        return ResponseEntity.ok(result);
    }



}
