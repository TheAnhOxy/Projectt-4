package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;


import java.util.List;
import java.util.Map;

public interface  BuildingService {


    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
//    List<BuildingDTO> findByNameContainingAndManagerName(String name, String managerName);
//    List<BuildingDTO> findByManagerNameStartingWith(String managerName);
      BuildingDTO saveBuilding(BuildingDTO buildingDTO);
     BuildingSearchResponse findBuildingById(Long id);
    BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO);
    BuildingDTO findBuidlingById(Long id);
    void deleteBuilding(List<Long> ids);
    public int countTotalItem(List<BuildingSearchResponse> list);



//      BuildingEntity findById(Long id);

}
