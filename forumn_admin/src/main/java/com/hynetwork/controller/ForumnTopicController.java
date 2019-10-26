package com.hynetwork.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hynetwork.entity.ForumnTopic;
import com.hynetwork.service.IForumnTopicService;
import com.hynetwork.utils.QueryObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/forumntopic")
public class ForumnTopicController {

    @Autowired
    private IForumnTopicService forumnTopicService;

    /**
     * 新增论坛帖子功能
     * @param forumnTopic
     * @param response
     */
    @RequestMapping("/insert")
    public void insert(ForumnTopic forumnTopic, HttpServletResponse response){
        try {
            response.setContentType("text/json; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            String information = "成功";
            Boolean bit = true;
            JSONObject jsonObject = new JSONObject();
            if (forumnTopic==null){
                information="关键信息不能为空";
                bit=false;
            }else  if (StringUtils.isNoneBlank(forumnTopic.getTopicTitle(),forumnTopic.getDrawId()
                    ,forumnTopic.getTopicContent(),forumnTopic.getAuthorId(),forumnTopic.getRelativeModIt())){
                information="关键信息不能为空";
                bit=false;
            }else {
                forumnTopicService.insert(forumnTopic);
            }
            jsonObject.put("information", information);
            jsonObject.put("success", bit);
            response.getWriter().print(jsonObject);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("/allforumntopic")
    public ModelAndView allforumntopic(ModelAndView modelAndView, QueryObject queryObject){
        PageHelper.startPage(queryObject.getPageNum(), queryObject.getPageSize());
        Page<ForumnTopic> forumnTopics=forumnTopicService.allforumntopic();
        PageInfo<ForumnTopic> pageInfo = new PageInfo<>(forumnTopics);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("forumnTopicList");
        return modelAndView;

    }
}
