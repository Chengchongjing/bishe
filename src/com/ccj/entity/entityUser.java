package com.ccj.entity;

public class entityUser {
	
	
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getVal() {
		return val;
	}
	public void setVal(int val) {
		this.val = val;
	}
   
	private String id;
	  private String name;
	  private String phone;
	  private String card_id;
	  private String birthdate;
	  private String time;
	  private int val;
	  private String typ;
	 public String getTyp() {
		return typ;
	}
	public void setTyp(String typ) {
		this.typ = typ;
	}
	public entityUser(String id,String name,String phone,String card_id,
			 				String birthdate,String time,int val,String typ){
		 super();
		 this.id=id;
		 this.name=name;
		 this.phone=phone;
		 this.card_id=card_id;
		 this.birthdate=birthdate;
		 this.val=val;
		 this.time=time;
		 this.typ=typ;
	 }
  
  
  
}
