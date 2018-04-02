package com.chenjin.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.chenjin.smis.DAO.impl.IUserDAO;
import com.chenjin.smis.DAO.impl.UserDAOImpl;
import com.chenjin.smis.damain.User;
import com.chenjin.smis.query.UserQueryObject;
import com.chenjin.smis.util.fileutil;

@WebServlet("/facerecognition/logon")
public class logonServlet extends HttpServlet {
	private static final long serialVersionUID =  1L;
	private IUserDAO dao = new UserDAOImpl();

	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码为utf-8
		req.setCharacterEncoding("utf-8");

		// 接受请求参数，封装成对象
		String cmd = req.getParameter("cmd");
		
		//fileutil.runPython("C:\\Users\\chenjin\\Desktop\\temp\\face.py");
		
		if ("logon".equals(cmd)) {
			try {
				this.logon(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("finalLogon".equals(cmd)) {
			try {
				this.finalLogOn(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	// 处理登陆的请求，跳转至登陆的界面
	private void logon(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getRequestDispatcher("/WEB-INF/views/logon.jsp").forward(req, resp);
	}

	// 接受登陆的表单信息，跳转界面至主界面
	private void finalLogOn(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		// 接受请求参数，封装成对象
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		// 对登录的用户信息进行检测
		UserQueryObject uo = new UserQueryObject();
		uo.setEmail(email);
		uo.setPassword(password);
		List<User> listByEmailAndPassword = dao.query(uo);
		if (listByEmailAndPassword.size() > 0) {
			// 如果用户的两个信息均存在与数据库且信息匹配,将其设为session对象
			User user = listByEmailAndPassword.get(0);
			req.getSession().setAttribute("USER_IN_SESSION", user);
			resp.sendRedirect("/facerecognition");
		} else {
			//如果信息不匹配，将错误信息反馈，控制界面仍然是登陆界面
			req.setAttribute("errorLog", "Logon failed,please try it again!");
			req.setAttribute("email", email);
			req.setAttribute("password", password);
			req.getRequestDispatcher("/WEB-INF/views/logon.jsp").forward(req, resp);
		}
	}
}
