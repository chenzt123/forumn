//package com.hynetwork.controller;
//import com.alibaba.fastjson.JSONArray;
//import com.alibaba.fastjson.JSONObject;
//import com.hynetwork.ueditor.UEditorResult;
//import com.hynetwork.utils.HttpClientUtils;
//import org.springframework.http.MediaType;
//import org.springframework.stereotype.Controller;
//import org.springframework.util.MultiValueMap;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Set;
//
//
//@Controller
//@RequestMapping(value = "/ueditor")
//public class UeditorController {
//
//    @Value("${file.url}")
//    private String fileUrl;
//
//    @GetMapping(value = "/config", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String config(@RequestParam(required = false) String action) throws Exception {
//        return "redirect:../resource/js/ueditor/jsp/config.json";
//    }
//
//    @PostMapping(value = "/config")
//    @ResponseBody
//    public UEditorResult uploadimage(@RequestParam(required = false) String action, MultipartFile upfile, HttpServletRequest request) {
//        final UEditorResult uEditorResult = new UEditorResult();
//        if (upfile == null || upfile.getSize() <= 0) {
//
//            uEditorResult.setState("error");
//            return uEditorResult;
//        }
//        String s = HttpClientUtils.upload1(fileUrl, upfile);
//        // 输出文件的绝对路径
//        System.out.println(s);
//        JSONObject json = JSONObject.parseObject(s);
//
////        System.out.println("WWWWWWWW");
//        if(json.get("code").equals("0000")){
//            uEditorResult.setState("SUCCESS");
//        }else{
//            uEditorResult.setState("FALSE");
//        }
//        JSONArray list = (JSONArray)json.get("data");
//        uEditorResult.setUrl(list.get(0).toString());
//        uEditorResult.setTitle(upfile.getOriginalFilename());
//        uEditorResult.setOriginal(upfile.getOriginalFilename());
//        return uEditorResult;
//    }
//
//
//    @PostMapping(value = "/uploadImgs")
//    @ResponseBody
//    public UEditorResult uploadImgs(@RequestParam(required = false) String action,  HttpServletRequest request) {
//        MultipartFile upfile =null;
//        final UEditorResult uEditorResult = new UEditorResult();
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//        MultiValueMap<String, MultipartFile> multipartFiles = multipartRequest.getMultiFileMap();
//        if(multipartFiles == null || multipartFiles.size() == 0) {
//
//        }
//        Set<String> fileNames = multipartFiles.keySet();
//        for (String fileName : fileNames) {
//            List<MultipartFile> fileList = multipartFiles.get(fileName);
//            upfile = fileList.get(0);
//        }
//
//        String s = HttpClientUtils.upload1(fileUrl, upfile);
//        // 输出文件的绝对路径
//        System.out.println(s);
//        JSONObject json = JSONObject.parseObject(s);
//
////        System.out.println("WWWWWWWW");
//        if(json.get("code").equals("0000")){
//            uEditorResult.setState("SUCCESS");
//        }else{
//            uEditorResult.setState("FALSE");
//        }
//        JSONArray list = (JSONArray)json.get("data");
//        uEditorResult.setUrl(list.get(0).toString());
//        uEditorResult.setTitle(upfile.getOriginalFilename());
//        uEditorResult.setOriginal(upfile.getOriginalFilename());
//        return uEditorResult;
//    }
//
//
//
//       @RequestMapping(value = "/uploadVideo",method = RequestMethod.POST)
//      @ResponseBody
//      public Map uploadVideo( HttpServletRequest request, HttpServletResponse response){
////                 log.info("进入wph的layui视频上传接口》》》》》》》》》》》》》》》");
//                 Map<String,Object> map= new HashMap<>();
//                 Map<String,Object> map2=new HashMap<>();
////                 KitFileUtil kitFileUtil=new KitFileUtil();
////                 map = kitFileUtil.kitFileUtil(layuiFile, request, response);
//                 String error = map.get("error").toString();
//                 if("101".equals(error)){
//                         map2.put("error",101);
//                         map2.put("message",map.get("message"));
//                         return map;
//                     }
//                 map2.put("error",0);
//                 String url[]=(String[])map.get("url");
//                 map2.put("url",url[0]);
//                 return map2;
//             }
//}
