package com.hynetwork.ueditor.upload;

import com.hynetwork.ueditor.PathFormat;
import com.hynetwork.ueditor.define.AppInfo;
import com.hynetwork.ueditor.define.BaseState;
import com.hynetwork.ueditor.define.FileType;
import com.hynetwork.ueditor.define.State;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class FtpUploadUtilbaidu {


    public static final State save(HttpServletRequest request,
                                   Map<String, Object> conf) {
         FileItemStream fileStream = null;
        // boolean isAjaxUpload = request.getHeader( "X_Requested_With" ) != null;

        if (!ServletFileUpload.isMultipartContent(request)) {
            return new BaseState(false, AppInfo.NOT_MULTIPART_CONTENT);
        }

        // ServletFileUpload upload = new ServletFileUpload(
        //  new DiskFileItemFactory());
        //
        // if ( isAjaxUpload ) {
        //     upload.setHeaderEncoding( "UTF-8" );
        // }

        try {
            // FileItemIterator iterator = upload.getItemIterator(request);
            //
            // while (iterator.hasNext()) {
            //  fileStream = iterator.next();
            //
            //  if (!fileStream.isFormField())
            //      break;
            //  fileStream = null;
            // }
            //
            // if (fileStream == null) {
            //  return new BaseState(false, AppInfo.NOTFOUND_UPLOAD_DATA);
            // }
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile(conf.get("fieldName").toString());
            if(multipartFile==null){
                return new BaseState(false, AppInfo.NOTFOUND_UPLOAD_DATA);
            }

            String savePath = (String) conf.get("savePath");
            //String originFileName = fileStream.getName();
            String originFileName = multipartFile.getOriginalFilename();
            String suffix = FileType.getSuffixByFilename(originFileName);

            originFileName = originFileName.substring(0,
                    originFileName.length() - suffix.length());
            savePath = savePath + suffix;

            long maxSize = ((Long) conf.get("maxSize")).longValue();

            if (!validType(suffix, (String[]) conf.get("allowFiles"))) {
                return new BaseState(false, AppInfo.NOT_ALLOW_FILE_TYPE);
            }

            savePath = PathFormat.parse(savePath, originFileName);

            String basePath=(String) conf.get("basePath");

            String remoteDir = "";
            String filename = savePath;

            int pos = savePath.lastIndexOf("/");
            if(pos > -1){
                remoteDir = savePath.substring(0,pos + 1);
                filename = savePath.substring(pos+1);
            }
            String physicalPath = (String)conf.get("rootPath") + savePath;

            //是否上传后保留本地服务器文件,里面的配置
            boolean keepLocalFile = "false".equals(conf.get("keepLocalFile")) ? false : true;
            InputStream is = multipartFile.getInputStream();
            State storageState = StorageManager.saveFtpFileByInputStream(is, remoteDir, physicalPath, maxSize, keepLocalFile, filename);
            is.close();

            if (storageState.isSuccess()) {
                storageState.putInfo("url", PathFormat.format(savePath));
                storageState.putInfo("type", suffix);
                storageState.putInfo("original", originFileName + suffix);
                storageState.putInfo("title", filename);
            }

            return storageState;
            // } catch (FileUploadException e) {
            //  return new BaseState(false, AppInfo.PARSE_REQUEST_ERROR);
        } catch (IOException e) {
        }
        return new BaseState(false, AppInfo.IO_ERROR);
    }

    private static boolean validType(String type, String[] allowTypes) {
        List<String> list = Arrays.asList(allowTypes);

        return list.contains(type);
    }
}
