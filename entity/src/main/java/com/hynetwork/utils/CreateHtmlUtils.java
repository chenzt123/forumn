package com.hynetwork.utils;



import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class CreateHtmlUtils {

    /**
     * 通过freemarker生成静态HTML页面
     * @param           templateName             模版名称
     * @param targetFileName        模版生成后的文件名
     * @param map                           freemarker生成的数据都存储在MAP中，
     * @创建时间：2017年10月22日21:41:06
     */
    public static void createHtml(String templateName, String targetFileName, Map<String, Object> map) throws Exception{
////        创建fm的配置
//        Configuration config = new Configuration();
//        //指定默认编码格式
//        config.setDefaultEncoding("UTF-8");
//        //设置模版文件的路径
//        config.setClassForTemplateLoading(CreateHtmlUtils.class, "classpath:/resource/");
//        System.out.println("============:"+ResourceUtils.CLASSPATH_URL_PREFIX);
//        //获得模版包
//        Template template = config.getTemplate(templateName);

        // 创建配置，有特殊需求要指定版本，细节查看java文档
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_27);

// 指定模板文件地址
        cfg.setDirectoryForTemplateLoading(new File("E:/temp"));
//        cfg.setDirectoryForTemplateLoading(new File("classpath:/resource/"));
//        cfg.setClassForTemplateLoading(CreateHtmlUtils.class,"classpath:/resource/");

// 指定文字编码
        cfg.setDefaultEncoding("UTF-8");

// 错误说明的设置，在网页上则 *development* TemplateExceptionHandler.HTML_DEBUG_HANDLER更好
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);

// 不要设置freemarker内部Log,有错误总会看到的
        cfg.setLogTemplateExceptions(false);

//将不在范围内的exception指定给TemplateException处理
        cfg.setWrapUncheckedExceptions(true);
        Template template = cfg.getTemplate(templateName);




        //从参数文件中获取指定输出路径 ,路径示例：C:/Workspace/shop-test/src/main/webapp/html
        String path = "E:/temp";
        //定义输出流，注意必须指定编码
        Writer writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(path+"/"+targetFileName)),"UTF-8"));
        //生成模版

        template.process(map, writer);
        writer.close();
    }

    public static void main(String [] args) throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("hello", "Hello World!");
        createHtml("test.ftl","111.html" , map);

    }

}
