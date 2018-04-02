package com.chenjin.web.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.alibaba.druid.support.json.JSONUtils;
import com.chenjin.smis.DAO.impl.IUserDAO;
import com.chenjin.smis.DAO.impl.UserDAOImpl;
import com.chenjin.smis.damain.User;
import com.chenjin.smis.query.UserQueryObject;
import com.chenjin.smis.util.stringutil;

//处理主页请求的servlet
@WebServlet("/facerecognition")
@SuppressWarnings("all")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IUserDAO dao = new UserDAOImpl();

	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码为utf-8
		req.setCharacterEncoding("utf-8");

		try {
			this.list(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 处理主页的请求
	private void list(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		HttpSession session = req.getSession();
		User fullUser = (User) session.getAttribute("fullUser");
		if (fullUser != null) {
			System.out.println(fullUser);
		}

		req.getRequestDispatcher("/WEB-INF/views/index1.jsp")
				.forward(req, resp);
	}

	// 处理登陆的请求，跳转至登陆的界面
	private void logon(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getRequestDispatcher("/WEB-INF/views/logon.jsp").forward(req, resp);
	}

	// 接受登陆的表单信息，跳转界面至主界面
	private void finalLogOn(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {

		req.getRequestDispatcher("/facerecognition").forward(req, resp);
	}
}
