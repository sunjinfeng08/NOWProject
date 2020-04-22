package com.dat.now.bean;

public class User {
	private String id;
	private String name;
	private String email;
	private String userpw;
	private String createtime;
	private Integer id1;
	private boolean rememberMe;
	
	
	public User() {
		
	}
	
	public User(String id, String name, String email, String userpw,
			String createtime, Integer id1, boolean rememberMe) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.userpw = userpw;
		this.createtime = createtime;
		this.id1 = id1;
		this.rememberMe = rememberMe;
	}

	public boolean isRememberMe() {
		return rememberMe;
	}
	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}
	public Integer getId1() {
		return id1;
	}
	public void setId1(Integer id1) {
		this.id1 = id1;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email
				+ ", userpw=" + userpw + ", createtime=" + createtime
				+ ", id1=" + id1 + ", rememberMe=" + rememberMe + "]";
	}
	
	
	
	

}
