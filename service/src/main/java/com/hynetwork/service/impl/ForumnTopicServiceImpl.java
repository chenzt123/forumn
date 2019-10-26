package com.hynetwork.service.impl;

import com.github.pagehelper.Page;
import com.hynetwork.entity.ForumnTopic;
import com.hynetwork.mapper.ForumnTopicMapper;
import com.hynetwork.service.IForumnTopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForumnTopicServiceImpl implements IForumnTopicService {

    @Autowired
    private ForumnTopicMapper forumnTopicMapper;

    @Override
    public void insert(ForumnTopic forumnTopic) {
        forumnTopicMapper.inserts(forumnTopic);
    }

    /**
     * 查询帖子列表
     * @return
     */
    @Override
    public Page<ForumnTopic> allforumntopic() {
        return forumnTopicMapper.allforumntopic();
    }

    /**
     * 根据帖子id查询对应的帖子
     * @param topicId
     * @return
     */
    @Override
    public ForumnTopic skipEdit(Integer topicId) {
        return forumnTopicMapper.selectByPrimaryKey(topicId);
    }
}
