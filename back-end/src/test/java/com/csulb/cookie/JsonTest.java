package com.csulb.cookie;

import com.alibaba.fastjson.JSONObject;
import com.csulb.cookie.bean.Capability;
import org.junit.jupiter.api.Test;

import java.util.List;

public class JsonTest {

    @Test
    void strToJsonObj() {


        String str = "{\n" +
                "    \"baseSizes\": {\n" +
                "      \"12\": 10.0,\n" +
                "      \"14\": 12.5,\n" +
                "      \"16\": 15.0,\n" +
                "      \"18\": 18.0\n" +
                "    },\n" +
                "    \"baseColors\": {\n" +
                "      \"Red\": 1.0,\n" +
                "      \"Pink\": 1.0,\n" +
                "      \"White\": 1.0,\n" +
                "      \"Blue\": 1.0,\n" +
                "      \"Green\": 1.0\n" +
                "    },\n" +
                "    \"baseFlavors\": {\n" +
                "      \"Red Velvet\": 3.0,\n" +
                "      \"Vanilla\": 4.0,\n" +
                "      \"Chocolate\": 2.5,\n" +
                "      \"Lemon\": 2.0\n" +
                "    },\n" +
                "    \"frostingFlavors\": {\n" +
                "      \"Pink\": 1.0,\n" +
                "      \"White\": 1.0,\n" +
                "      \"Yellow\": 1.0,\n" +
                "      \"Orange\": 1.0\n" +
                "    },\n" +
                "    \"frostingColors\": {\n" +
                "      \"Buttercream \": 2.5,\n" +
                "      \"Peppermint\": 3.0,\n" +
                "      \"Coconut \": 3.0,\n" +
                "      \"Strawberry \": 4.0,\n" +
                "      \"Chocolate \": 2.0,\n" +
                "      \"Lemon \": 3.0\n" +
                "    },\n" +
                "    \"toppings\": {\n" +
                "      \"Cookie\": 2.5,\n" +
                "      \"Nuts\": 3.0,\n" +
                "      \"Berries\": 2.5,\n" +
                "      \"M&M\": 2.0,\n" +
                "      \"Oreo\": 1.5,\n" +
                "      \"Chocolate\": 1.0,\n" +
                "      \"Skittles\": 2.0\n" +
                "    }\n" +
                "  }";

        Capability capabilities = JSONObject.parseObject(str, Capability.class);
        System.out.println(capabilities);

    }
}
