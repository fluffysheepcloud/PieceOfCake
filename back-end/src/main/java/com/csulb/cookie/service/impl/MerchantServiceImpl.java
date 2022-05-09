package com.csulb.cookie.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.Capability;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.*;
import com.csulb.cookie.service.*;
import com.csulb.cookie.mapper.MerchantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MerchantServiceImpl extends ServiceImpl<MerchantMapper, Merchant>  implements MerchantService {

    AddressService addressService;

    CakeBaseService cakeBaseService;
    BaseFlavorService baseFlavorService;
    BaseColorService baseColorService;
    FrostingService frostingService;
    FrostingFlavorService frostingFlavorService;
    ToppingsService toppingsService;


    @Override
    public Map<String, Object> merchantLogin(String username, String password) {
        if (username == null || password == null) {
            return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad reqeust").toJsonMap();
        }

        QueryWrapper<Merchant> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        Merchant m = getBaseMapper().selectOne(wrapper);
        if (m != null && m.getPassword() != null) {
            if (m.getPassword().equals(password)) {
                setAddress(m);
                return new ControllerResult(ControllerResult.SUCCESS, m, "success").toJsonMap();
            }
            else
                return new ControllerResult(ControllerResult.UNLOGIN, null, "fail").toJsonMap();

        }

        return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();
    }

    @Override
    public Map<String, Object> merchantRegister(Merchant merchant) {

        System.out.println(merchant.toString());

    // make sure all attributes are not null
        if (merchant.getUsername() == null ||
                merchant.getPassword() == null ||
                merchant.getEmail() == null ||
                merchant.getPhone() == null ||
                merchant.getShopName() == null ||
                merchant.getDescription() == null ||
                merchant.getBusinessHour() == null ||
                merchant.getStreet() == null ||
                merchant.getCity() == null ||
                merchant.getState() == null ||
                merchant.getZip() == null
        ) {
            return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad request").toJsonMap();
        }

        // Save merchant into database
        boolean res = save(merchant);
        // Get the address info of the merchant
        Address address = new Address();
        address.setMerchantId(merchant.getId());
        address.setStreet(merchant.getStreet());
        address.setCity(merchant.getCity());
        address.setState(merchant.getState());
        address.setZip(merchant.getZip());
        // Save the address info into database
        boolean addressRes = addressService.save(address);

        return (res && addressRes) ?
                new ControllerResult(ControllerResult.SUCCESS, merchant, "success").toJsonMap() :
                new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }

    @Override
    public Map<String, Object> getMerchantById(int id) {
        Merchant m = getById(id);
        if (m == null) {
            return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();
        }
        else {
            setAddress(m);
            return new ControllerResult(ControllerResult.SUCCESS, m, "success").toJsonMap();
        }
    }

    @Override
    public Map<String, Object> updateMerchantById(Merchant m) {
        MerchantMapper mapper = getBaseMapper();
        int row = mapper.updateMerchantById(m);
        if (row >= 1) {
            m = mapper.selectById(m.getId());
            setAddress(m);
            return new ControllerResult(ControllerResult.SUCCESS, m, "success").toJsonMap();
        }
        else {
            return new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
        }

    }

    @Override
    public Map<String, Object> getMerchantCapability(int id) {

        Merchant m = getById(id);
        if (m == null) {
            return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();
        }

        // Cake Base Size
        QueryWrapper<CakeBase> cakeBaseQueryWrapper = new QueryWrapper<>();
        cakeBaseQueryWrapper.eq("m_id", id);
        List<CakeBase> cakeBases = cakeBaseService.list(cakeBaseQueryWrapper);

        // Cake Base Color
        QueryWrapper<BaseColor> baseColorQueryWrapper = new QueryWrapper<>();
        baseColorQueryWrapper.eq("m_id", id);
        List<BaseColor> baseColors = baseColorService.list(baseColorQueryWrapper);

        // Cake Base Flavor
        QueryWrapper<BaseFlavor> baseFlavorQueryWrapper = new QueryWrapper<>();
        baseFlavorQueryWrapper.eq("m_id", id);
        List<BaseFlavor> baseFlavors = baseFlavorService.list(baseFlavorQueryWrapper);

        // Cake Base Frosting
        QueryWrapper<Frosting> frostingQueryWrapper = new QueryWrapper<>();
        frostingQueryWrapper.eq("m_id", id);
        List<Frosting> frostings = frostingService.list(frostingQueryWrapper);

        // Cake Base Flavor
        QueryWrapper<FrostingFlavor> frostingFlavorQueryWrapper = new QueryWrapper<>();
        frostingFlavorQueryWrapper.eq("m_id", id);
        List<FrostingFlavor> frostingFlavors = frostingFlavorService.list(frostingFlavorQueryWrapper);

        // Cake Base Toppings
        QueryWrapper<Toppings> toppingsQueryWrapper = new QueryWrapper<>();
        toppingsQueryWrapper.eq("m_id", id);
        List<Toppings> toppings = toppingsService.list(toppingsQueryWrapper);

        Capability c = new Capability(cakeBases, baseColors, baseFlavors, frostings, frostingFlavors, toppings);

        return new ControllerResult(ControllerResult.SUCCESS, c, "success").toJsonMap();
    }



    private void setAddress(Merchant m) {
        QueryWrapper<Address> qw = new QueryWrapper<>();
        qw.eq("merchant_id", m.getId());
        Address address = addressService.getOne(qw);
        m.setStreet(address.getStreet());
        m.setCity(address.getCity());
        m.setState(address.getState());
        m.setZip(address.getZip());
    }

    @Autowired
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }
    @Autowired
    public void setCakeBaseService(CakeBaseService cakeBaseService) {this.cakeBaseService = cakeBaseService;}
    @Autowired
    public void setBaseFlavorService(BaseFlavorService baseFlavorService) {this.baseFlavorService = baseFlavorService;}
    @Autowired
    public void setFrostingService(FrostingService frostingService) {this.frostingService = frostingService;}
    @Autowired
    public void setFrostingFlavorService(FrostingFlavorService frostingFlavorService) {this.frostingFlavorService = frostingFlavorService;}
    @Autowired
    public void setBaseColorService(BaseColorService baseColorService) {this.baseColorService = baseColorService;}
    @Autowired
    public void setToppingsService(ToppingsService toppingsService) {this.toppingsService = toppingsService;}

}




