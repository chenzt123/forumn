package com.hynetwork.Controller;

import freemarker.template.Configuration;
import freemarker.template.Template;
import org.junit.Test;

import java.io.FileWriter;
import java.util.HashMap;
import java.util.Map;

public class TestsFreeMarker {
    @Test
    public void test() throws Exception {
        //创建配置对象
        Configuration configuration = new Configuration(Configuration.getVersion());
         //设置默认生成文件编码
        configuration.setDefaultEncoding("utf-8");
        //设置模板路径
        configuration.setClassForTemplateLoading(TestsFreeMarker.class,
                "/ftl");
        //获取模板
        Template template = configuration.getTemplate("wulai.ftl");
        //加载数据
        Map<String, Object> dataModel = new HashMap<>();
        dataModel.put("name", "来爸爸这里");
        dataModel.put("message", "Welcome to the magic world。");
        //创建输出对象
        FileWriter fileWriter = new
                FileWriter("D:\\wulai\\wulai.html");
//渲染模板和数据
        template.process(dataModel, fileWriter);
//关闭输出
        fileWriter.close();
    }
}
