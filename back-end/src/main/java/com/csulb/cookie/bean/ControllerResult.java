package com.csulb.cookie.bean;

import java.util.LinkedHashMap;
import java.util.Map;

public class ControllerResult {

    private static final String RESULT_CODE = "code";
    private static final String RESULT_MSG = "msg";
    private static final String RESULT_DATA = "data";

    public static final int SUCCESS = 200;
    public static final int BAD_REQUEST = 400;
    public static final int UNLOGIN = 401;
    public static final int FORBIDDEN = 403;
    public static final int NOT_FOUND = 404;
    public static final int TIMEOUT = 408;

    private Integer code;
    private String msg;
    private Object data;

    public ControllerResult() {
        this.code = SUCCESS;
    }

    public ControllerResult(Integer code,Object data) {
        this.code = code;
        this.data = data;
    }

    public ControllerResult(Integer code,Object data,String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
    }

    public Map<String,Object> toJsonMap() {
        Map<String,Object> map = new LinkedHashMap<>(3);
        map.put(RESULT_CODE,this.code);
        map.put(RESULT_MSG,this.msg);
        map.put(RESULT_DATA,this.data);
        return map;
    }
    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
