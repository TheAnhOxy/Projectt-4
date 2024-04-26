package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.constant.SystemConstant;
import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.*;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.RentAreaDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.DistrictCode;
import com.javaweb.utils.UploadFileUtils;
import org.apache.tomcat.util.codec.binary.Base64;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceContext;
import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    private final UploadFileUtils uploadFileUtils;

    @Autowired
    public BuildingServiceImpl(UploadFileUtils uploadFileUtils) {
        this.uploadFileUtils = uploadFileUtils;
    }

    // version2

//    @Autowired
//    private BuildingRepository buildingRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private BuildingDTOConverter buildingDTOConverter;
    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        // tìm tòa nhà
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        // lấy all nhân viên
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        // duyệt danh sách
        List<UserEntity> staffAssignment = building.getUsers();
        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
        ResponseDTO result = new ResponseDTO();
        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            // nếu nhân viên nào nằm trong staffAssignment thì true, ko thì empty
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOs.add(staffResponseDTO);

        }
        result.setData(staffResponseDTOs);
        result.setMessage("Success");
        return result;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List <BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder, pageable);
        List <BuildingSearchResponse> result = new ArrayList<BuildingSearchResponse>();
        for(BuildingEntity item : buildingEntities) {
            BuildingSearchResponse building = buildingDTOConverter.toBuildingDTO(item);
            result.add(building);
        }
        return result;
    }

    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        return buildingRepository.countTotalItem(list);
    }


    @Override
    public BuildingDTO saveBuilding(BuildingDTO buildingDTO) {
        return null;
    }


    @Override
    public BuildingSearchResponse findBuildingById(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        return buildingDTOConverter.toBuildingDTO(building);
    }

    @Transactional
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingDTOConverter.convertToBuildingEntity(buildingDTO);
        saveThumbnail(buildingDTO, buildingEntity);
        saveRentAreas(buildingEntity, buildingDTO.getRentArea());
        buildingRepository.save(buildingEntity);
        return modelMapper.map(buildingEntity, BuildingDTO.class);
    }

    private void saveRentAreas(BuildingEntity buildingEntity, String rentAreaString) {
        if (rentAreaString != null && !rentAreaString.isEmpty()) {
            List<String> rentAreaValues = Arrays.asList(rentAreaString.split(","));
            List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();
            rentAreaEntities.clear();
            for (String rentAreaValue : rentAreaValues) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuilding(buildingEntity);
                rentAreaEntity.setValue(Long.parseLong(rentAreaValue));
                rentAreaEntities.add(rentAreaEntity);
            }
        }
    }







    @Override
    public void deleteBuilding(List<Long> ids) {
        if (ids == null || ids.isEmpty()) {
            return;
        }
        List<BuildingEntity> buildings = buildingRepository.findByIdIn(ids);
        buildingRepository.deleteAll(buildings);
    }



    @Override
    public BuildingDTO findBuidlingById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).orElse(null);
        BuildingDTO buildingDTO = null;
        if (buildingEntity != null) {
            buildingDTO = buildingDTOConverter.convertToDto(buildingEntity);
            String typeCodesString = buildingEntity.getType();
            if (typeCodesString != null && !typeCodesString.isEmpty()) {
                String[] allTypeCodes = typeCodesString.split(",");
                buildingDTO.setSelectedTypes(allTypeCodes);
            }
        }
        return buildingDTO;
    }

     private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getAvatar()) {
                if (!path.equals(buildingEntity.getAvatar())) {
                    File file = new File("C://home/office" + buildingEntity.getAvatar());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setAvatar(path);
        }
    }






//    @Override
//    public void deleteBuilding(List<Long> ids) {
//        if (ids == null || ids.isEmpty()) {
//            return;
//        }
//        for (Long id : ids) {
//            List<RentAreaEntity> rentAreas = rentAreaRepository.findByBuilding_Id(id);
//            List<AssignmentBuildingEntity> assignmentBuildingEntities  = assignmentbuildingRepository.findByBuilding_Id(id);
////            if (!rentAreas.isEmpty()) {
////                rentAreaRepository.deleteAll(rentAreas);
////            }
//            for (RentAreaEntity rentArea : rentAreas) {
//                if (rentArea.getBuilding().getId().equals(id)) {
//                    rentAreaRepository.delete(rentArea);
//                }
//            }
////            if(!assignmentBuildingEntities.isEmpty()){
////                assignmentbuildingRepository.deleteById(id);
////            }
//            for (AssignmentBuildingEntity assignmentBuilding : assignmentBuildingEntities) {
//                if (assignmentBuilding.getBuilding().getId().equals(id)) {
//                    assignmentbuildingRepository.delete(assignmentBuilding);
//                }
//            }
//        }
//        List<BuildingEntity> buildings = buildingRepository.findByIdIn(ids);
//        if (!buildings.isEmpty()) {
//            buildingRepository.deleteAll(buildings);
//        }
//    }

}
