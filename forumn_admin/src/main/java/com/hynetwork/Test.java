package com.hynetwork;

import com.hynetwork.utils.CreateHtmlUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Test {

    @RequestMapping("/test")
    public void test() throws Exception{
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("hello", "Hello World!");
        CreateHtmlUtils.createHtml("test.ftl","111.html" , map);
    }
}
