package com.chenjin.smis.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

public class fileutil {
	// 创建文件夹
	public static boolean mkDirectory(String path) {
		File file = null;
		try {
			file = new File(path);
			if (!file.exists()) {
				return file.mkdirs();
			} else {
				return false;
			}
		} catch (Exception e) {
		} finally {
			file = null;
		}
		return false;
	}

	// 从文件中读取内容
	public static String readFile(String path) throws Exception {
		String msg = "";

		File inFile = new File(path);
		BufferedReader in = new BufferedReader(new FileReader(inFile));
		String line = "";
		while ((line = in.readLine()) != null) {
			msg += line;
		}
		in.close();
		return msg;
	}

	// 将内容写出到文件中
	public static void writeFile(String path, String msg) throws Exception {
		File outFile = new File(path);
		FileWriter out = new FileWriter(outFile);
		out.write(msg);
		out.close();
	}
	public static void runPython(String path){
		try {
			Runtime rt = Runtime.getRuntime();
			System.out.println("start");
			Process proc = Runtime.getRuntime().exec(
					"python "+path);
			proc.waitFor();
			System.out.println("end");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		runPython("C:\\Users\\chenjin\\Desktop\\temp\\face.py");
	}
}
