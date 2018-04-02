package com.chenjin.smis.query;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter@Setter
//封装商品查询信息对象
public class UserQueryObject extends QueryObject{
	private Long userId;
	private String name;
	private String email;
	private String password;
	private String realName;
	private Integer age;
	private String sex;
	private String job;
	private Integer authority;
	private Integer logState;
	
	//自己定制自己的查询条件及查询参数（覆盖父类的方法）
	protected void customizedQuery(){
		if(userId!=null){
			this.addQuery("userId = ?", userId);
		}
		if(haslength(name)){
			this.addQuery("name = ?", name);
		}
		if(haslength(email)){
			this.addQuery("email = ?", email);
		}
		if(haslength(password)){
			this.addQuery("password = ?", password);
		}
		if(haslength(realName)){
			this.addQuery("realName = ?", realName);
		}
		if(age!=null){
			this.addQuery("age = ?", age);
		}
		if(haslength(sex)){
			this.addQuery("sex = ?", sex);
		}
		if(haslength(job)){
			this.addQuery("job = ?", job);
		}
		if(authority!=null){
			this.addQuery("authority = ?", authority);
		}
		if(logState!=null){
			this.addQuery("logState = ?", logState);
		}
		setOrder("userId",orderBy.ASC);
	}
}
