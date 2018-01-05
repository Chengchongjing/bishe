package com.ccj.entity;

import java.sql.Timestamp;

public class entityDd {
  private String id;
  private String userid;
  private String petname;
  private Timestamp suretime;
  private String project;
  public String getProject() {
	return project;
}
public void setProject(String project) {
	this.project = project;
}
public String getId() {
	  return id;
  }
  public void setId(String id) {
	this.id = id;
  }
  public String getUserid() {
	return userid;
  }
  public void setUserid(String userid) {
	  this.userid = userid;
  }
  public String getPetname() {
	return petname;
	}
  public void setPetname(String petname) {
	this.petname = petname;
  }
  public Timestamp getSuretime() {
	return suretime;
  }
  public void setSuretime(Timestamp suretime) {
	this.suretime = suretime;
  }

  	public entityDd(String id,String userid,String petname,Timestamp suretime,String project){
  			super();
  				this.id=id;
  				this.userid=userid;
  				this.petname=petname;
  				this.suretime=suretime;
  				this.project=project;
  		}
	}
