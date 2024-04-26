package com.javaweb.converter;

import java.util.List;

import java.util.stream.Collectors;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.modelmapper.TypeMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class BuildingDTOConverter {

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private ModelMapper modelMapper;


    public BuildingSearchResponse toBuildingDTO(BuildingEntity item) {
        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);

        if (item.getDistrict() != null) {
            try {
                String districtName = DistrictCode.type().get(item.getDistrict());
                building.setAddress(item.getStreet() + "," + item.getWard() + "," +  districtName);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
        if (rentAreas != null) {
            String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
            building.setRentArea(areaResult);
        }

        return building;
    }





    public BuildingEntity convertToBuildingEntity(BuildingDTO buildingDTO) {
        Long currentId = buildingDTO.getId();
        BuildingEntity buildingEntity = null;
        if (currentId != null) {
            buildingEntity = buildingRepository.findById(currentId).orElse(null);
            if (buildingEntity != null) {
                modelMapper.map(buildingDTO, buildingEntity);
                buildingEntity.setType(String.join(",", buildingDTO.getSelectedTypes()));
            }
        } else {
            buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        }
        return buildingEntity;
    }




    public BuildingEntity toBuldingEntity(BuildingDTO check){
        BuildingEntity result = modelMapper.map(check, BuildingEntity.class);
        return result;
    }

    public BuildingDTO convertToDto (BuildingEntity entity){
        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
        List<RentAreaEntity> rentAreas = entity.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        result.setRentArea(areaResult);
        return result;
    }



//
//    public BuildingDTO toBuldingDTO1 (BuildingEntity entity){
//        BuildingDTO result = modelMapper.map(entity, BuildingDTO.class);
//        return result;
//    }

    //    public BuildingEntity convertToBuildingEntity(BuildingDTO buildingDTO) {
//        Long currentId = buildingDTO.getId();
//        BuildingEntity buildingEntity = null;
//        if (currentId != null) {
//            BuildingEntity buildingEntityCheck = buildingRepository.findById(buildingDTO.getId()).orElse(null);
//            buildingEntity = buildingEntityCheck;
////            List<RentAreaEntity> rentAreas = rentAreaRepository.findByBuilding_Id(buildingDTO.getId());
////            rentAreaRepository.deleteAll(rentAreas);
//            buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
//            buildingEntity.setType(String.join(",", buildingDTO.getSelectedTypes()));
//        } else {
//            buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
//        }
//        return buildingEntity;
//    }


//    public BuildingSearchResponse toBuildingDTO(BuildingEntity item) {
////		BuildingDTO building = new BuildingDTO();
//        BuildingSearchResponse building = modelMapper.map(item, BuildingSearchResponse.class);
////        building.setNumberOfBasement(item.getNumberOfBasement());
////		building.setManagerPhoneNumber(null);
//        try {
//            String districtName = DistrictCode.type().get(item.getDistrict());
//            building.setAddress(item.getStreet() + "," + item.getWard() + "," +  districtName);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        List<RentAreaEntity> rentAreas = item.getRentAreaEntities();
//        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
//        building.setRentArea(areaResult);
//        return building;
//    }

}