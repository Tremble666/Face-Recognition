package com.chenjin.smis.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

public class DruidUtils {
	private static Properties pro = new Properties();
	private static DataSource ds = null;

	private DruidUtils() {
	};

	static {
		ClassLoader cl = Thread.currentThread().getContextClassLoader();
		InputStream in = null;
		try {
			in = cl.getResourceAsStream("Druid.properties");
			pro.load(in);
			//ds = BasicDataSourceFactory.createDataSource(pro);
			ds = DruidDataSourceFactory.createDataSource(pro);
		} catch (Exception e1) {
			throw new RuntimeException("读取配置文件出现异常");
		}
	}

	public static Connection getConn() {
		try {
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		throw new RuntimeException("数据库连接异�?");
	}

	public static void close(Connection conn, Statement sta, ResultSet rs) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (sta != null) {
					sta.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
