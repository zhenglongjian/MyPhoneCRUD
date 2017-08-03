package com.atguigu.bean;

public class TableCellPhone {
    private Integer phoneId;

    private String phoneName;

    private Double phonePrice;

    private String phoneColor;

    public Integer getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(Integer phoneId) {
        this.phoneId = phoneId;
    }

    public String getPhoneName() {
        return phoneName;
    }

    public void setPhoneName(String phoneName) {
        this.phoneName = phoneName == null ? null : phoneName.trim();
    }

    public Double getPhonePrice() {
        return phonePrice;
    }

    public void setPhonePrice(Double phonePrice) {
        this.phonePrice = phonePrice;
    }

    public String getPhoneColor() {
        return phoneColor;
    }

    public void setPhoneColor(String phoneColor) {
        this.phoneColor = phoneColor == null ? null : phoneColor.trim();
    }

    @Override
    public String toString() {
        return "TableCellPhone [phoneId=" + phoneId + ", phoneName=" + phoneName + ", phonePrice=" + phonePrice
                + ", phoneColor=" + phoneColor + "]";
    }
    
    
}