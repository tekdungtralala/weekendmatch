package com.wiwit.eplweb.util;

public enum UserNetworkType {

	GOOGLE("google"),
	FACEBOOK("facebook"),
	TWITTER("twitter");
	
	private UserNetworkType(String value) {
		this.value = value;
	}
	
	private final String value;
	
	public String getValue() {
		return value;
	}
}
