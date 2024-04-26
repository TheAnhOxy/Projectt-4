package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum StatusType {

    DANG_XU_LY("Đang xử lý"),
    DA_XY_LY("Đã xử lý"),
    XU_LY_XONG("Xử lý xong"),
    CHUA_XU_LY("Chưa xử lý"),
    LOADING("Loading..."),
    WAIT_A_MINUTE("Wait a minute");

    private final String statusType;
    StatusType(String statusType) {
        this.statusType = statusType;
    }

    public String getStatusType() {
        return statusType;
    }

    public static Map<String,String> type(){
        Map<String,String> status = new TreeMap<>();
        for(StatusType item : StatusType.values()){
            status.put(item.toString() , item.statusType);
        }
        return status;
    }

}
