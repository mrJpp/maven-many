package com.mr.util;

import java.io.Serializable;

public class Json implements Serializable{
	private static final long serialVersionUID = -4274911820768862062L;
	//返回的信息
	private String msg = "";
	//请求是否成功
	private Boolean success = true;
	//返回的对象
	private Object object;
	//返回状态
	private String state = "";
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Boolean getSuccess() {
		return success;
	}
	public void setSuccess(Boolean success) {
		this.success = success;
	}
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}

	@Override
	public String toString() {
		return "Json [msg=" + msg + ", success=" + success + ", object="
				+ object + ", state=" + state + "]";
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}
