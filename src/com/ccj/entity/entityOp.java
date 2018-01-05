package com.ccj.entity;

import java.sql.Timestamp;
import java.util.Date;

public class entityOp {
  public String getOpid() {
		return opid;
	}
	public void setOpid(String opid) {
		this.opid = opid;
	}
	public Timestamp getOptime() {
		return optime;
	}
	public void setOptime(Timestamp optime) {
		this.optime = optime;
	}
	public String getOpuser() {
		return opuser;
	}
	public void setOpuser(String opuser) {
		this.opuser = opuser;
	}
	public String getOppet() {
		return oppet;
	}
	public void setOppet(String oppet) {
		this.oppet = oppet;
	}
	 public String getDocid() {
			return docid;
		}
		public void setDocid(String docid) {
			this.docid = docid;
		}
		public String getPettype() {
			return pettype;
		}
		public void setPettype(String pettype) {
			this.pettype = pettype;
		}
		
  private String opid;
  private Timestamp optime;
  public String getTruetime() {
	return truetime;
}
public void setTruetime(String truetime) {
	this.truetime = truetime;
}

private String opuser;
  private String oppet;
  private String docid;
  private String pettype;
  private String handleop;
  private String truetime;


public String getHandleop() {
	return handleop;
}
public void setHandleop(String handleop) {
	this.handleop = handleop;
}
public entityOp(String opid,Timestamp optime,String opuser,String oppet,String docid,
									String pettype,String handleop,String truetime){
	  super();
	  this.opid=opid;
	  this.optime = optime;
	  this.oppet=oppet; 
	  this.opuser=opuser;
	  this.docid=docid;
	  this.pettype=pettype;
	  this.handleop=handleop;
	  this.truetime=truetime;
  }
  
}
