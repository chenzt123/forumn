package com.hynetwork.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hynetwork.entity.ForumnTopic;
import com.hynetwork.entity.ForumnTopicModel;
import com.hynetwork.service.IForumnTopicModelService;
import com.hynetwork.service.IForumnTopicService;
import com.hynetwork.utils.QueryObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/forumntopic")
public class ForumnTopicController {

    @Autowired
    private IForumnTopicService forumnTopicService;

    @Autowired
    private IForumnTopicModelService forumnTopicModelService;


    /**
     * 跳转新增论坛页面
     * @param modelAndView
     * @return
     */
    @RequestMapping("/skipAdd")
    public ModelAndView skipAdd(ModelAndView modelAndView){
        //查询所有帖子系统模块
        List<ForumnTopicModel> forumnTopicModels=forumnTopicModelService.allForumnTopicModel();
        modelAndView.addObject("forumnTopicModels",forumnTopicModels);
        modelAndView.setViewName("add");
        return modelAndView;
    }

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
                forumnTopic.setCreateTime(new Date());
                forumnTopic.setTopicStatus((short)0);
                //还有作者和发布时间没有set进去
                forumnTopicService.insert(forumnTopic);
            }
            jsonObject.put("information", information);
            jsonObject.put("success", bit);
            response.getWriter().print(jsonObject);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 高级查询和分页
     * @param modelAndView
     * @param queryObject
     * @return
     */
    @RequestMapping("/allforumntopic")
    public ModelAndView allforumntopic(ModelAndView modelAndView, QueryObject queryObject){
        PageHelper.startPage(queryObject.getPageNum(), queryObject.getPageSize());
        Page<ForumnTopic> forumnTopics=forumnTopicService.allforumntopic();
        PageInfo<ForumnTopic> pageInfo = new PageInfo<>(forumnTopics);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("forumnTopicList");
        return modelAndView;
    }

    /**
     * 跳转帖子编辑页面和数据回显
     * @param modelAndView
     * @param topicId
     * @return
     */
    @RequestMapping("/skipEdit")
    public ModelAndView skipEdit(ModelAndView modelAndView,Integer topicId){
        //查询所有帖子系统模块
        List<ForumnTopicModel> forumnTopicModels=forumnTopicModelService.allForumnTopicModel();
        modelAndView.addObject("forumnTopicModels",forumnTopicModels);
        //根据帖子id查询对应的帖子
        ForumnTopic forumnTopic=forumnTopicService.skipEdit(topicId);
        modelAndView.addObject("forumnTopic",forumnTopic);
        modelAndView.setViewName("edit");
        return modelAndView;
    }

    @RequestMapping("editorsSave")
    public ModelAndView editorsSave(ForumnTopic forumnTopic){

    }
}
