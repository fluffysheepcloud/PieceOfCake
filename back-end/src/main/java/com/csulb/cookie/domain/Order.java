package com.csulb.cookie.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

@TableName(value ="order")
@Data
public class Order implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private Integer customerId;

    private Integer merchantId;

    private String placedDate;

    private String status;

    private String pickupDate;

    private Double subtotal;

    private Double tab;

    private Double total;

    private String note;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Order other = (Order) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getCustomerId() == null ? other.getCustomerId() == null : this.getCustomerId().equals(other.getCustomerId()))
            && (this.getMerchantId() == null ? other.getMerchantId() == null : this.getMerchantId().equals(other.getMerchantId()))
            && (this.getPlacedDate() == null ? other.getPlacedDate() == null : this.getPlacedDate().equals(other.getPlacedDate()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getPickupDate() == null ? other.getPickupDate() == null : this.getPickupDate().equals(other.getPickupDate()))
            && (this.getSubtotal() == null ? other.getSubtotal() == null : this.getSubtotal().equals(other.getSubtotal()))
            && (this.getTab() == null ? other.getTab() == null : this.getTab().equals(other.getTab()))
            && (this.getTotal() == null ? other.getTotal() == null : this.getTotal().equals(other.getTotal()))
            && (this.getNote() == null ? other.getNote() == null : this.getNote().equals(other.getNote()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getCustomerId() == null) ? 0 : getCustomerId().hashCode());
        result = prime * result + ((getMerchantId() == null) ? 0 : getMerchantId().hashCode());
        result = prime * result + ((getPlacedDate() == null) ? 0 : getPlacedDate().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getPickupDate() == null) ? 0 : getPickupDate().hashCode());
        result = prime * result + ((getSubtotal() == null) ? 0 : getSubtotal().hashCode());
        result = prime * result + ((getTab() == null) ? 0 : getTab().hashCode());
        result = prime * result + ((getTotal() == null) ? 0 : getTotal().hashCode());
        result = prime * result + ((getNote() == null) ? 0 : getNote().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", customerId=").append(customerId);
        sb.append(", merchantId=").append(merchantId);
        sb.append(", placedDate=").append(placedDate);
        sb.append(", status=").append(status);
        sb.append(", pickupDate=").append(pickupDate);
        sb.append(", subtotal=").append(subtotal);
        sb.append(", tab=").append(tab);
        sb.append(", total=").append(total);
        sb.append(", note=").append(note);
        sb.append("]");
        return sb.toString();
    }
}