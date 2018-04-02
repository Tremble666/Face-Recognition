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

@WebServlet("/facerecognition/circleFace")
public class circleFaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IUserDAO dao = new UserDAOImpl();

	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 设置编码为utf-8
		req.setCharacterEncoding("utf-8");

		// 接受请求参数，封装成对象
		String cmd = req.getParameter("cmd");

		if ("useSub".equals(cmd)) {
			try {
				this.useSub(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("handleSub".equals(cmd)) {
			try {
				this.handleSub(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 跳到到使用小功能的地方
	private void useSub(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		// 首先判断用户是否登录
		User user = (User) req.getSession().getAttribute("USER_IN_SESSION");
		// 如果用户未登录
		if (user == null) {
			// 如果该用户未登录，则需要先登录
			req.getRequestDispatcher("/facerecognition/logon?cmd=logon")
					.forward(req, resp);
		} else {
			req.getRequestDispatcher("/WEB-INF/views/sub-function.jsp")
					.forward(req, resp);
		}
	}

	// 处理小功能的提交
	private void handleSub(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		String ALLOWED_IMAGE_TYPE = "png;jpg;jpeg;gif";
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

					String realPath = "/circleFace" + "/";

					/*// 采用UUID作为文件名，避免提交相同名的文件产生冲突
					filename = UUID.randomUUID().toString() + "."
							+ FilenameUtils.getExtension(item.getName());*/

					// 将二进制数据写入哪一个文件中(通常将文件写入该项目所在的文件夹中，这样通过浏览器也可访问)
					item.write(new File(req.getServletContext().getRealPath(
							realPath), "1.jpg"));
				}
			}
			
			//运行python脚本将脸圈出来
			fileutil.runPython("D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\python\\faceFind.py");
			
			//找到该txt，然后读取里边的信息找到对应的人
			String msg = fileutil.readFile("D:\\APP_Project\\java_4_ee_kepler\\FaceRecognize\\webapp\\circleFace\\face.txt");
			//拿到识别信息后新型判断，分为两种情况
			if("not a face".equals(msg)){
				//如果用户上传的图片没有脸
				req.setAttribute("notFace", "Can't detect a completed face in your input picture,Please Please change to another picture");
			}else{
				req.setAttribute("resultUrl", "/circleFace/result/result.jpg");
				req.setAttribute("faceNum", Integer.valueOf(msg));
			}
			
			req.setAttribute("imgUrl", "/circleFace" + "/" + "1.jpg");
			req.getRequestDispatcher("/WEB-INF/views/sub-function.jsp")
					.forward(req, resp);
		} catch (LogicException e) {
			String errorMessage = e.getMessage();
			req.setAttribute("imgError", errorMessage);

			// 当出现异常时，需要对用户的数据进行回显
			req.getRequestDispatcher("/WEB-INF/views/sub-function.jsp")
					.forward(req, resp);
		}
	}
}