package com.hynetwork.ueditor.upload;



import com.hynetwork.ueditor.define.State;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class Uploader {
	private HttpServletRequest request = null;
	private Map<String, Object> conf = null;

	public Uploader(HttpServletRequest request, Map<String, Object> conf) {
		this.request = request;
		this.conf = conf;
	}

	public final State doExec() {
		String filedName = (String) this.conf.get("fieldName");
		State state = null;

//		if ("true".equals(this.conf.get("isBase64"))) {
//			state = Base64Uploader.save(this.request.getParameter(filedName),
//					this.conf);
//		} else {
//			state = BinaryUploader.save(this.request, this.conf);
//		}
		if ("true".equals(this.conf.get("isBase64"))) {
			state = Base64Uploader.save(this.request.getParameter(filedName),
					this.conf);
		} else {//ftp上传判断
			if("true".equals(this.conf.get("useFtpUpload"))){
				state = FtpUploadUtilbaidu.save(request, conf);
			} else{
				state = BinaryUploader.save(this.request, this.conf);//系统默认的上传方法必须带着
			}
		}

		return state;
	}
}
