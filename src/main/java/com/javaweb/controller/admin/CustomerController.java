package com.javaweb.controller.admin;

import com.javaweb.enums.StatusType;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    private IUserService iUserService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private TransactionService transactionService;

    @GetMapping(value = "/admin/customer-list")
    public ModelAndView getNews(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list");
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            // where userid = ?
            mav.addObject("customer", customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems())));
        }
        else{
            // find all
            mav.addObject("customer", customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems())));
        }
        List<CustomerSearchResponse> customerSearchResponse = customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1, customerSearchRequest.getMaxPageItems()));
        CustomerSearchResponse result = new CustomerSearchResponse();
        result.setListResult(customerSearchResponse);
        result.setTotalItems(customerService.countTotalItem(customerSearchResponse));
        mav.addObject("modelSearch", customerSearchRequest);
        mav.addObject("staffnaps", iUserService.getStaffs());
        mav.addObject("customers", result);
        return mav;
    }


    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView addCustomer(@ModelAttribute("customerEdit") CustomerDTO customerDTO){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO newCus = new CustomerDTO();
        mav.addObject("statusType", StatusType.type());
        mav.addObject("customerEdit", newCus);
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView editCustomer(@PathVariable("id") Long id) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        try {
            CustomerDTO customerDTO = customerService.findCustomerById(id);
            if (customerDTO == null) {
                mav.setViewName("errorPage");
                return mav;
            }
            mav.addObject("customerEdit", customerDTO);
//            List<TransactionDTO> transactions = transactionService.findByCus(transactionDTO.getId());

            // check 2 trans
            List<TransactionDTO> transactionsCSKH = transactionService.findCustomer(id, "CSKH");
            List<TransactionDTO> transactionsDDX = transactionService.findCustomer(id, "DDX");
            // show ra view
            mav.addObject("transactionType", TransactionType.transactionType());
            mav.addObject("transactionsCSKH", transactionsCSKH);
//            mav.addObject("transactions", transactionDTO);
            mav.addObject("transactionsDDX", transactionsDDX);
            mav.addObject("statusType", StatusType.type());
        } catch (Exception e) {
            mav.setViewName("errorPage");
        }
        return mav;
    }


    // sửa
//    @GetMapping(value="/admin/customer-edit-{id}")
//    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request){
//        ModelAndView mav = new ModelAndView("admin/customer/edit");
//        CustomerDTO customerDTO = customerService.findCustomerById(id);
//        mav.addObject("customerEdit", customerDTO);
//        return mav;
//    }

//
//    @GetMapping(value = "/admin/customer-edit-{id}")
//    public ModelAndView addCustomer(@PathVariable("id") Long id){
//        ModelAndView mav = new ModelAndView("admin/customer/edit");
//        CustomerDTO customerDTO = customerService.findCustomerById(id);
//        mav.addObject("transactionType", TransactionType.transactionType());
//        mav.addObject("customerEdit", customerDTO);
//        TransactionDTO transactionDTO = transactionService.findTransactionById(id);
//        List<TransactionDTO> transactionsCSKH = transactionService.findCustomer(id, "CSKH");
//        List<TransactionDTO> transactionsDDX = transactionService.findCustomer(id, "DDX");
//        mav.addObject("statusType", StatusType.type());
//        mav.addObject("transactionsCSKH", transactionsCSKH);
//        mav.addObject("transactionsDDX", transactionsDDX);
//        mav.addObject("transactionsDTO", transactionDTO);
//        // type 1 : CSKH
//        // type 2 : DDX
//        return mav;
//    }




//    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
//    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL)CustomerDTO model, HttpServletRequest request){
//        ModelAndView nav = new ModelAndView("admin/customer/list");
//        nav.addObject("staffnaps", iUserService.getStaffs());
//        return nav;
//    }
}
