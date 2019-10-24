package com.hynetwork.entity;

import java.util.Date;

public class Advises {
    private Long id;

    private String memberid;

    private String accPhone;

    private String accQq;

    private String accEmain;

    private Byte accType;

    private String accContent;

    private Date accTime;

    private Byte dealType;

    private String dealContent;

    private String dealAccount;

    private Date dealTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMemberid() {
        return memberid;
    }

    public void setMemberid(String memberid) {
        this.memberid = memberid;
    }

    public String getAccPhone() {
        return accPhone;
    }

    public void setAccPhone(String accPhone) {
        this.accPhone = accPhone;
    }

    public String getAccQq() {
        return accQq;
    }

    public void setAccQq(String accQq) {
        this.accQq = accQq;
    }

    public String getAccEmain() {
        return accEmain;
    }

    public void setAccEmain(String accEmain) {
        this.accEmain = accEmain;
    }

    public Byte getAccType() {
        return accType;
    }

    public void setAccType(Byte accType) {
        this.accType = accType;
    }

    public String getAccContent() {
        return accContent;
    }

    public void setAccContent(String accContent) {
        this.accContent = accContent;
    }

    public Date getAccTime() {
        return accTime;
    }

    public void setAccTime(Date accTime) {
        this.accTime = accTime;
    }

    public Byte getDealType() {
        return dealType;
    }

    public void setDealType(Byte dealType) {
        this.dealType = dealType;
    }

    public String getDealContent() {
        return dealContent;
    }

    public void setDealContent(String dealContent) {
        this.dealContent = dealContent;
    }

    public String getDealAccount() {
        return dealAccount;
    }

    public void setDealAccount(String dealAccount) {
        this.dealAccount = dealAccount;
    }

    public Date getDealTime() {
        return dealTime;
    }

    public void setDealTime(Date dealTime) {
        this.dealTime = dealTime;
    }
}