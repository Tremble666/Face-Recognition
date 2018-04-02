package com.chenjin.web.upload;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.chenjin.smis.DAO.impl.IUserDAO;
import com.chenjin.smis.DAO.impl.UserDAOImpl;
import com.chenjin.smis.util.fileutil;

public class FileUploadUtils {
	private static String ALLOWED_IMAGE_TYPE = "png;jpg;jpeg;gif";
	private IUserDAO userDAO = new UserDAOImpl();

	public static void upload(HttpServletRequest req,
			Map<String, String> infMap, Map<String, CFile> binaryMap,Map<String, String> personPicture)
			throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 检查表单请求是否符合规范，是否为post请求，并且编码类型是否为multipart/form-data
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if (!isMultipart) {
			return;
		}
		try {
			// 1.创建FileItemFactory对象，用来创建FileItem对象
			// FileItemFactory对象是对Form表单中表单控件的封装
			FileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// 设置单个文件上传的大小限制为2M
			upload.setFileSizeMax(1024 * 1024 * 20);// 20M

			// 设置一次请求中上传文件的大小限制为3M
			// upload.setSizeMax(1024 * 1024 * 3);//3M

			// Parse the request
			List<FileItem> items = upload.parseRequest(req);
			String realPath = "";
			String personInf = "";
			for (FileItem item : items) {
				// getFieldName()得到的是表单中name的值，getName()得到的是文件的名称
				String fieldName = item.getFieldName();

				// 判断当前控件
				if (item.isFormField()) {
					// 普通表单控件
					String value = item.getString("utf-8");

					// 如果读取的是用户名，则将其保存
					if ("name".equals(fieldName)) {

						// 利用用户名创建该用户的文件夹
						realPath = "/upload/uploadPicture" + "/" + value+"/";
						fileutil.mkDirectory(req.getServletContext().getRealPath(realPath));

					}
					// System.out.println(fieldName+","+value+",asdasdasdasdasdas");
					infMap.put(fieldName, value);
				} else {
					// 判断当前上传文件是否是符合图片后缀名的文件，如果符合，将其写入磁盘；否则传递参数给input.jsp，提示用户.
					String[] allowedImageType = ALLOWED_IMAGE_TYPE.split(";");
					if (!Arrays.asList(allowedImageType).contains(
							FilenameUtils.getExtension(item.getName()))) {
						throw new LogicException(
								"The file's type you input is not 'Img'！");
					}

					// 表单上传控件
					System.out.println(fieldName + ":" + item.getName());

					// 采用UUID作为文件名，避免提交相同名的文件产生冲突
					String filename = UUID.randomUUID().toString() + "."
							+ FilenameUtils.getExtension(item.getName());

					// 将二进制数据写入哪一个文件中(通常将文件写入该项目所在的文件夹中，这样通过浏览器也可访问)
					item.write(new File(req.getServletContext().getRealPath(realPath), filename));
					
					//将个人图片信息进行保存
					personInf=realPath;
					personInf+=filename;
					personPicture.put(filename, req.getServletContext().getRealPath(personInf));
					
					// 封装文件信息，保存至map中
					CFile cf = new CFile();
					cf.setImgName(FilenameUtils.getName(item.getName()));
					cf.setImgUrl(realPath+filename);
					binaryMap.put("imgInfo", cf);
				}
			}
		} catch (FileSizeLimitExceededException e) {
			throw new LogicException("亲,单个文件上传的大小限制为2M", e);
		} catch (SizeLimitExceededException e) {
			throw new LogicException("亲,一次请求中文件上传的大小限制为3M", e);
		} catch (LogicException e) {
			// 继续抛出文件类型不是图片的异常类型
			throw e;
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
