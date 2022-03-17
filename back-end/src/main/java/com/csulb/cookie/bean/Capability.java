package com.csulb.cookie.bean;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@AllArgsConstructor
@Data
public class Capability {

    private List baseSizes;
    private List baseColors;
    private List baseFlavors;
    private List frostingColors;
    private List frostingFlavors;
    private List toppings;

}
