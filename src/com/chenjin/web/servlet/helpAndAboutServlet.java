package com.chenjin.web.servlet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import net.sf.json.JSONObject;

import com.chenjin.smis.DAO.impl.IUserDAO;
import com.chenjin.smis.DAO.impl.UserDAOImpl;
import com.chenjin.smis.damain.User;
import com.chenjin.smis.query.UserQueryObject;
import com.chenjin.smis.util.fileutil;
import com.chenjin.web.upload.CFile;
import com.chenjin.web.upload.FileUploadUtils;
import com.chenjin.web.upload.LogicException;

@WebServlet("/facerecognition/about")
public class helpAndAboutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IUserDAO dao = new UserDAOImpl();

	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码为utf-8
		req.setCharacterEncoding("utf-8");

		// 接受请求参数，封装成对象
		String cmd = req.getParameter("cmd");

		if ("about".equals(cmd)) {
			try {
				this.about(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("function".equals(cmd)) {
			try {
				this.function(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("handleFunction".equals(cmd)) {
			try {
				this.handleFunction(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("help".equals(cmd)) {
			try {
				this.help(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("learn".equals(cmd)) {
			try {
				this.learn(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 处理帮助的界面
	private void about(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getRequestDispatcher("/WEB-INF/views/about.jsp").forward(req, resp);
	}

	// 处理学习的界面
	private void learn(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getRequestDispatcher("/WEB-INF/views/learn.jsp").forward(req, resp);
	}

	// 处理帮助的界面
	private void help(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		req.getRequestDispatcher("/WEB-INF/views/help.jsp").forward(req, resp);
	}

	// 跳转到功能界面
	private void function(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		// 首先判断用户是否登录
		User user = (User) req.getSession().getAttribute("USER_IN_SESSION");
		if (user != null) {
			if (user.getAuthority() == 1) {
				// 如果该用户已经完整注册
				req.getRequestDispatcher("/WEB-INF/views/function.jsp")
						.forward(req, resp);
			} else {
				req.setAttribute("user", user);
				req.setAttribute("needToPerfect", "true");
				System.out.println("user" + user);
				req.getRequestDispatcher("/WEB-INF/views/judgeGoOn.jsp")
						.forward(req, resp);
			}
		} else {
			// 如果该用户未登录，则需要先登录
			req.getRequestDispatcher("/facerecognition/logon?cmd=logon")
					.forward(req, resp);
		}
	}

	// 跳转到功能界面
	private void handleFunction(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {

		// 规定允许的图片格式
		String ALLOWED_IMAGE_TYPE = "png;jpg;jpeg;gif";

		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if (!isMultipart) {
			return;
		}

		try {
			String filename = "";
			// FileItemFactory对象是对Form表单中表单控件的封装
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// 设置单个文件上传的大小限制为2M
			upload.setFileSizeMax(1024 * 1024 * 20);// 20M

			List<FileItem> items = upload.parseRequest(req);

			for (FileItem item : items) {
				// getFieldName()得到的是表单中name的值，getName()得到的是文件的名称
				String fieldName = item.getFieldName();

				if (item.isFormField()) {

				} else {
					// 判断当前上传文件是否是符合图片后缀名的文件，如果符合，将其写入磁盘；否则传递参数给input.jsp，提示用户.
					String[] allowedImageType = ALLOWED_IMAGE_TYPE.split(";");
					if (!Arrays.asList(allowedImageType).contains(
							FilenameUtils.getExtension(item.getName()))) {
						throw new LogicException(
								"The file's type you input is not the required Img type！");
					}

					String realPath = "/upload/singlePicture" + "/";

					// 采用UUID作为文件名，避免提交相同名的文件产生冲突
					filename = UUID.randomUUID().toString() + "."
							+ FilenameUtils.getExtension(item.getName());

					// 将二进制数据写入哪一个文件中(通常将文件写入该项目所在的文件夹中，这样通过浏览器也可访问)
					item.write(new File(req.getServletContext().getRealPath(
							realPath), filename));

					// 将当前上传文件的路径写入文件
					String realPicPath = req.getServletContext().getRealPath(
							realPath)
							+ "\\" + filename;
					// 将用户上传的路径保存到testFace.txt
					File outFile = new File(req.getServletContext()
							.getRealPath("/upload/singlePicture/testFace.txt"));
					FileWriter out = new FileWriter(outFile);
					out.write(realPicPath);
					out.close();
				}
			}

			// 调用python脚本，找到的结果为txt
			fileutil.runPython("D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\python\\faceRecognize.py");
			// 找到该txt，然后读取里边的信息找到对应的人
			String msg = fileutil
					.readFile("D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\upload\\singlePicture\\rec.txt");
			System.out.println("message:" + msg);
			// 拿到识别信息后新型判断，分为三种情况
			if ("-1".equals(msg)) {
				// 如果未在训练集中找到这个人
				req.setAttribute("notFound",
						"Can't find this person,Please change to another picture");
			} else if ("not a face".equals(msg)) {
				// 如果用户上传的图片没有脸
				req.setAttribute(
						"notFace",
						"Can't detect a completed face in your input picture,Please Please change to another picture");
			} else {
				// 如果找到了这个用户
				String[] person = msg.split(",");
				Long userId = Long.valueOf(person[0]);
				// 通过userId找到这个人
				User user = dao.get(userId);
				// 设置参数并控制界面跳转
				req.setAttribute("user", user);
			}

			req.setAttribute("imgUrl", "/upload/singlePicture" + "/" + filename);
			req.getRequestDispatcher("/WEB-INF/views/function.jsp").forward(
					req, resp);
		} catch (LogicException e) {
			String errorMessage = e.getMessage();
			req.setAttribute("imgError", errorMessage);

			// 当出现异常时，需要对用户的数据进行回显
			req.getRequestDispatcher("/WEB-INF/views/function.jsp").forward(
					req, resp);
		}
	}
}