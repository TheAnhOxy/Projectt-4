package com.javaweb.controller.admin;



import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.BuildingType;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Security;
import java.util.List;
import java.util.Map;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;
    @Autowired
    private BuildingService buildingService;
    // @ModelAttreibute : nhận requesst vào
    @GetMapping(value="/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);
        DisplayTagUtils.of(request, buildingSearchRequest);
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            buildingSearchRequest.setStaffId(staffId);
            // where userid = ?
            mav.addObject("buildings", buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems())));
        }
        else{
            // find all
            mav.addObject("buildings", buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems())));
        }
        List<BuildingSearchResponse> buildingSearchResponse = buildingService.findAll(buildingSearchRequest, PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        BuildingSearchResponse result = new BuildingSearchResponse();
        result.setListResult(buildingSearchResponse);
        result.setTotalItems(buildingService.countTotalItem(buildingSearchResponse));
        mav.addObject("buildingList", result);

        // dán dữu liệu lên forrm
        mav.addObject("ListStaffs", userService.getStaffs());
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("typeCodes", BuildingType.type());
        return mav;
    }

    // tesst
//    @GetMapping(value="/admin/building-list")
//    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
//        ModelAndView mav = new ModelAndView("admin/building/list");
//        mav.addObject("modelSearch", buildingSearchRequest);
//        // xuống DB lấy data OK // Service
//        List<BuildingSearchResponse> responseList = new ArrayList<>();
//        BuildingSearchResponse it1 = new BuildingSearchResponse();
//        it1.setId(3L);
//        it1.setName("Kevin Building");
//        it1.setAddress("130 Quang Trung, Phạm Ngũ Lão, Quận 1");
//        it1.setNumberOfBasement(1L);
//        it1.setManagerName("Anh Long");
//        it1.setManagerPhone("12222");
//        it1.setFloorArea(300L);
//        it1.setEmptyArea("10");
//        it1.setRentPrice(250L);
//        it1.setRentArea("100, 200, 300");
//        it1.setBrokerageFee(1.2);
//        it1.setServiceFee("10");
//        BuildingSearchResponse it2 = new BuildingSearchResponse();
//        it2.setId(4L);
//        it2.setName("Ronadol Building");
//        it2.setAddress("130 Nguyễn Huệ, Phạm Ngũ Lão, Quận 1");
//        it2.setNumberOfBasement(2L);
//        it2.setManagerName("Bullet");
//        it2.setManagerPhone("133333");
//        responseList.add(it1);
//        responseList.add(it2);
//        mav.addObject("buildingList", responseList);
//        mav.addObject("ListStaffs", userService.getStaffs());
//        mav.addObject("districts", DistrictCode.type()) ;
//        mav.addObject("typeCodes", BuildingType.type());
//        return mav;
//    }

// thêm mới
    @GetMapping(value="/admin/building-edit")
    // thêm mới nhập forrm :  form hiện
    public ModelAndView buildingAdd(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO newBuilding = new BuildingDTO();
        mav.addObject("buildingEdit", newBuilding);
        mav.addObject("districts", DistrictCode.type()) ;
        mav.addObject("typeCodes", BuildingType.type());
        return mav;
    }
    // sửa
        @GetMapping(value="/admin/building-edit-{id}")
        public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
            ModelAndView mav = new ModelAndView("admin/building/edit");
            // xuống DB tìm building theo ID , findByBuildingID  cầm qua dán ra list
            // khi lấy dc rồi trả ra view  edit
            BuildingDTO buildingDTO = buildingService.findBuidlingById(id);
    //        BuildingDTO buildingDTO = new BuildingDTO();
    //        buildingDTO.setId(id);
            mav.addObject("buildingEdit", buildingDTO);
            mav.addObject("districts", DistrictCode.type()) ;
            mav.addObject("typeCodes", BuildingType.type());
            return mav;
        }


}
