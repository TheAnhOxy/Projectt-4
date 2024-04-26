package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.AssigmentService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;


@RestController(value="BuildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {

    @Autowired
    private  BuildingService buildingService;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    AssigmentService assigmentService;



    @DeleteMapping("/delete/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids) {
        if (ids.isEmpty()) {
            return;
        }
        buildingService.deleteBuilding(ids);
    }

//    @PostMapping
//    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
//        BuildingDTO result = buildingService.saveBuilding(buildingDTO);
//        return ResponseEntity.ok().body(result);
//    }

    @PostMapping
    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        try {
            BuildingDTO result = buildingService.addOrUpdateBuilding(buildingDTO);
            return ResponseEntity.ok().body(result);
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }


    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }
    /*
    * Note : cách thủ công update ( sửa or update ) : Xóa dữ liệu cũ ( liên quan xong add lại )
             Update nên gửi Body
             Gửi về Building ID và danh sách nhân viên
             Thêm dưới database : sử dụng dataSpring Jpa
             Xuống db lấy data
             Update vao bang assigment
    **/
    @PostMapping("/assigment")
    public void updateAssigmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assigmentService.updateAssigmentBuilding(assignmentBuildingDTO);
    }

}
