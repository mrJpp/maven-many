package com.mr.entity;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = -2185168019858670199L;

	private Integer userId;

    private String userName;

    private String userCode;

    private String userPass;

    private Integer userPassErr;

    private Date userAgoLoginDate;

    private Date userLoginDate;

    private String phoneNumber;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode == null ? null : userCode.trim();
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass == null ? null : userPass.trim();
    }

    public Integer getUserPassErr() {
        return userPassErr;
    }

    public void setUserPassErr(Integer userPassErr) {
        this.userPassErr = userPassErr;
    }

    public Date getUserAgoLoginDate() {
        return userAgoLoginDate;
    }

    public void setUserAgoLoginDate(Date userAgoLoginDate) {
        this.userAgoLoginDate = userAgoLoginDate;
    }

    public Date getUserLoginDate() {
        return userLoginDate;
    }

    public void setUserLoginDate(Date userLoginDate) {
        this.userLoginDate = userLoginDate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }
}