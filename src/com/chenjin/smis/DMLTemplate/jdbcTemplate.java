package com.chenjin.smis.DMLTemplate;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.chenjin.smis.util.DruidUtils;

public class jdbcTemplate {
	private jdbcTemplate() {
	};

	// 处理增删改的通用模板
	public static int update(String sql, Object... parms) {
		Connection conn = null;  
		PreparedStatement ps = null;
		try {
			conn = DruidUtils.getConn();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < parms.length; i++) {
				ps.setObject(i + 1, parms[i]);
			}
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DruidUtils.close(conn, ps, null);
		}
		return 0;
	}

	// 处理请求单个用户与所有用户的模板
	public static <T>T query(String sql, IResultSetHandler<T> rsh,Object... parms) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DruidUtils.getConn();
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < parms.length; i++) {
				ps.setObject(i + 1, parms[i]);
			}
			rs = ps.executeQuery();
			return rsh.handle(rs);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DruidUtils.close(conn, ps, rs);
		}
		return null;
	}
}
