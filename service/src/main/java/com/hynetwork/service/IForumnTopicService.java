package com.hynetwork.service;

import com.github.pagehelper.Page;
import com.hynetwork.entity.ForumnTopic;

public interface IForumnTopicService {

    /**
     * 新增论坛帖子
     * @param forumnTopic
     */
    void insert(ForumnTopic forumnTopic);

    /**
     * 查询帖子列表
     * @return
     */
    Page<ForumnTopic> allforumntopic();

}
