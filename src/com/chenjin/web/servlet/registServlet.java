package com.chenjin.web.servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.security.Provider.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import net.sf.json.JSONObject;

import com.chenjin.smis.DAO.impl.IUserDAO;
import com.chenjin.smis.DAO.impl.UserDAOImpl;
import com.chenjin.smis.damain.User;
import com.chenjin.smis.query.UserQueryObject;
import com.chenjin.smis.util.fileutil;
import com.chenjin.smis.util.stringutil;
import com.chenjin.web.upload.CFile;
import com.chenjin.web.upload.FileUploadUtils;
import com.chenjin.web.upload.LogicException;

@WebServlet("/facerecognition/regist")
// 该servlet处理所有关于注册的请求
public class registServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String ALLOWED_IMAGE_TYPE = "png;jpg;jpeg;gif";
	private IUserDAO userDAO = new UserDAOImpl();

	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码为utf-8
		req.setCharacterEncoding("utf-8");

		// 接受请求参数，封装成对象
		String cmd = req.getParameter("cmd");

		if ("regist".equals(cmd)) {
			try {
				this.regist(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("judgeGoOn".equals(cmd)) {
			try {
				this.judgeGoOn(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("infoRegist".equals(cmd)) {
			try {
				this.infoRegist(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("finalRegist".equals(cmd)) {
			try {
				this.finalRegist(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 接受完善个人信息的表单，跳转回主页
	private void finalRegist(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {

		// 存取用户基本信息的Map
		Map<String, String> infMap = new HashMap<String, String>();
		// 存取用户图片信息的Map
		Map<String, CFile> binaryMap = new HashMap<String, CFile>();
		// 存取用户所有图片信息的Map
		Map<String, String> personPicture = new HashMap<String, String>();
		User user = new User();
		try {
			// 文件上传，封装用户信息及文件信息
			FileUploadUtils.upload(req, infMap, binaryMap,personPicture);
			
			System.out.println(infMap+"a");
			// 完善信息得到的二进制数据
			user.setName(infMap.get("name"));
			user.setEmail(infMap.get("email"));
			user.setPassword(infMap.get("password"));
			user.setRealName(infMap.get("realName"));
			System.out.println(infMap.get("age"));
			user.setAge(Integer.valueOf(infMap.get("age")));
			user.setSex(infMap.get("sex"));
			user.setJob(infMap.get("job"));
			user.setFilePath(binaryMap.get("imgInfo").getImgUrl());
			user.setAuthority(1);
			user.setLogState(1);
			System.out.println(user);
			if(infMap.get("needToPerfect")==null){
				//用户直接注册进来时，是没有这个参数的
				userDAO.save(user);
			}else{
				//如果有这个参数，则说明用户需要使用功能模块
				UserQueryObject uqo = new UserQueryObject();
				uqo.setName(infMap.get("name"));
				List<User> uList = userDAO.query(uqo);	
				user.setUserId(uList.get(0).getUserId());
				userDAO.update(user);
			}
			
			
			//获取该user对象的主键
			UserQueryObject uqo = new UserQueryObject();
			uqo.setName(user.getName());
			List<User> userList = userDAO.query(uqo);
			//System.out.println(personPicture.size()+"hahahahahhah");
			File outFile = new File(req.getServletContext().getRealPath("/upload/uploadPicture/at.txt"));
			FileWriter out = new FileWriter(outFile);
			for (Entry<String, String> entry : personPicture.entrySet()) {
				out.write(entry.getValue()+";"+userList.get(0).getUserId()+"\r\n");
			}
			out.close();
				
			//当用户提交训练照片后，调用py脚本进行训练
			fileutil.runPython("D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\python\\faceGet.py");
			fileutil.runPython("D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\python\\faceTrain.py");
			//fileutil.runPython("C:\\Users\\chenjin\\Desktop\\temp\\faceTrain.py");
			
			req.getRequestDispatcher("/facerecognition/logon?cmd=logon")
			.forward(req, resp);
		} catch (LogicException e) {
			String errorMessage = e.getMessage();
			req.setAttribute("imgError", errorMessage);
			
			//当出现异常时，需要对用户的数据进行回显
			
			user.setRealName(infMap.get("realName"));
			user.setSex(infMap.get("sex"));
			//System.out.println("sex:"+infMap.get("sex"));
			user.setAge(Integer.valueOf(infMap.get("age")));
			user.setJob(infMap.get("job"));
			System.out.println(user);
			req.setAttribute("user", user);		
			req.getRequestDispatcher("/WEB-INF/views/infoRegist.jsp").forward(
					req, resp);
		}
	}

	// 处理完善注册的请求,跳转至完善注册页面
	private void infoRegist(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		String judge = req.getParameter("judge");

		// 接受初次注册传来的三条信息，封装成对象
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		User user = new User();
		if (stringutil.haslength(name)) {
			user.setName(name);
		}
		if (stringutil.haslength(email)) {
			user.setEmail(email);
		}
		if (stringutil.haslength(password)) {
			user.setPassword(password);
		}
		if (stringutil.haslength(judge)) {
			// 如果用户愿意继续完善信息，则将该信息继续传递完善，否则直接在数据库保存已有信息且权限设为0
			if (judge.equals("yes")) {
				req.setAttribute("user", user);
				//System.out.println("needToPerfect:"+req.getParameter("needToPerfect"));
				if(req.getParameter("needToPerfect") != null){
					req.setAttribute("needToPerfect", "true");
				}
				req.getRequestDispatcher("/WEB-INF/views/infoRegist.jsp")
						.forward(req, resp);
			} else {
				user.setAuthority(0);
				user.setLogState(1);
				userDAO.save(user);
				/*
				 * // 获取session对象 HttpSession session = req.getSession();
				 * session.setAttribute("partUser", user);
				 */

				resp.sendRedirect("/facerecognition");
			}
		}

	}

	// 处理是否继续完善注册的请求，跳转至是否愿意继续完善页面
	private void judgeGoOn(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		// 获取注册时的表单项，将已有信息设置到user对象中并传递参数
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String checkPassword = req.getParameter("checkPassword");

		// 判断两次输入的密码是否一致,不一致的话接着跳到初次注册的界面，并且提示两次密码不一致
		if (stringutil.haslength(password)
				&& stringutil.haslength(checkPassword)) {
			if (!password.equals(checkPassword)) {
				req.setAttribute("error",
						"Two input password must be consistent,please check it again!");
				req.setAttribute("name", name);
				req.setAttribute("email", email);
				req.setAttribute("password", password);
				req.setAttribute("checkPassword", checkPassword);
				req.getRequestDispatcher("/WEB-INF/views/regist.jsp").forward(
						req, resp);
				return;
			}
		}

		// 判断用户名和email是否有重复
		UserQueryObject uo = new UserQueryObject();
		System.out.println("name" + name);
		uo.setName(name);
		List<User> list = userDAO.query(uo);
		if (!(list.size() == 0)) {
			// 如果根据用户注册的姓名在数据库进行匹配，如果数据库中有同名的，则不能保存用户信息
			req.setAttribute("nameError",
					"The name you input has already existed!");
			req.setAttribute("name", name);
			req.setAttribute("email", email);
			req.setAttribute("password", password);
			req.setAttribute("checkPassword", checkPassword);
			req.getRequestDispatcher("/WEB-INF/views/regist.jsp").forward(req,
					resp);
		} else {
			UserQueryObject uoByEmail = new UserQueryObject();
			uoByEmail.setEmail(email);
			List<User> listByEmail = userDAO.query(uoByEmail);
			if (!(listByEmail.size() == 0)) {
				// 如果用户注册的email是重复的
				req.setAttribute("emailError",
						"The email you input has already existed!");
				req.setAttribute("name", name);
				req.setAttribute("email", email);
				req.setAttribute("password", password);
				req.setAttribute("checkPassword", checkPassword);
				req.getRequestDispatcher("/WEB-INF/views/regist.jsp").forward(
						req, resp);
			} else {
				// 如果都正常，则将信息传递，跳到判断是否继续前进的界面
				User user = new User();
				if (stringutil.haslength(name)) {
					user.setName(name);
				}
				if (stringutil.haslength(email)) {
					user.setEmail(email);
				}
				if (stringutil.haslength(password)) {
					user.setPassword(password);
				}
				req.setAttribute("user", user);

				req.getRequestDispatcher("/WEB-INF/views/judgeGoOn.jsp")
						.forward(req, resp);
			}
		}
	}

	// 处理注册的请求，跳转至第一次注册的界面
	private void regist(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getRequestDispatcher("/WEB-INF/views/regist.jsp")
				.forward(req, resp);
	}
}
