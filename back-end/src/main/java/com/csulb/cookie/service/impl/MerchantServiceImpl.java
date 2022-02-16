package com.csulb.cookie.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.csulb.cookie.bean.ControllerResult;
import com.csulb.cookie.domain.Address;
import com.csulb.cookie.domain.Customer;
import com.csulb.cookie.domain.Merchant;
import com.csulb.cookie.service.AddressService;
import com.csulb.cookie.service.MerchantService;
import com.csulb.cookie.mapper.MerchantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class MerchantServiceImpl extends ServiceImpl<MerchantMapper, Merchant>  implements MerchantService {

    AddressService addressService;

    @Override
    public Map<String, Object> merchantLogin(String username, String password) {
        if (username == null || password == null) {
            return new ControllerResult(ControllerResult.BAD_REQUEST, null, "bad reqeust").toJsonMap();
        }

        QueryWrapper<Merchant> wrapper = new QueryWrapper<>();
        wrapper.eq("username", username);
        Merchant c = getBaseMapper().selectOne(wrapper);
        if (c != null && c.getPassword() != null) {
            if (c.getPassword().equals(password))
                return new ControllerResult(ControllerResult.SUCCESS, c, "success").toJsonMap();
            else
                return new ControllerResult(ControllerResult.UNLOGIN, null, "fail").toJsonMap();

        }

        return new ControllerResult(ControllerResult.NOT_FOUND, null, "not found").toJsonMap();
    }

    @Override
    public Map<String, Object> merchantRegister(Merchant merchant) {
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
            return new ControllerResult(ControllerResult.SUCCESS, getById(id), "success").toJsonMap();
        }
    }

    @Override
    public Map<String, Object> updateMerchantById(Merchant m) {
        boolean res = updateById(m);

        return res ?
                new ControllerResult(ControllerResult.SUCCESS, m, "success").toJsonMap() :
                new ControllerResult(ControllerResult.ERROR, null, "error").toJsonMap();
    }

    @Autowired
    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

}




