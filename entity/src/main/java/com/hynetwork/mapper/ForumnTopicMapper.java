package com.hynetwork.mapper;

import com.hynetwork.entity.ForumnTopic;

public interface ForumnTopicMapper {
    int deleteByPrimaryKey(Integer topicId);

    int insert(ForumnTopic record);

    int insertSelective(ForumnTopic record);

    ForumnTopic selectByPrimaryKey(Integer topicId);

    int updateByPrimaryKeySelective(ForumnTopic record);

    int updateByPrimaryKeyWithBLOBs(ForumnTopic record);

    int updateByPrimaryKey(ForumnTopic record);
}