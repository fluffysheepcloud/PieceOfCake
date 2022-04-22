package com.csulb.cookie.bean;

import lombok.Data;

import java.util.Map;

@Data
public class NoteData {
    private String subject;
    private String content;
    private Map<String, String> data;
    private String image;
}
