package com.hynetwork.service.impl;

import com.hynetwork.entity.ForumnTopicModel;
import com.hynetwork.mapper.ForumnTopicModelMapper;
import com.hynetwork.service.IForumnTopicModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumnTopicModelServiceImpl implements IForumnTopicModelService {

    @Autowired
    private ForumnTopicModelMapper forumnTopicModelMapper;

    /**
     * 查询所有帖子系统模块
     * @return
     */
    @Override
    public List<ForumnTopicModel> allForumnTopicModel() {
        return forumnTopicModelMapper.allForumnTopicModel();
    }
}
