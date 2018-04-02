package com.chenjin.smis.damain;

import lombok.Data;

@Data
public class User {
	private Long userId;
	private String name;
	private String email;
	private String password;
	private String realName;
	private int age;
	private String sex;
	private String job;
	private String filePath;
	private int authority;
	private int logState;
}
