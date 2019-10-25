package com.hynetwork.mapper;

import com.github.pagehelper.Page;
import com.hynetwork.entity.ForumnTopic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface ForumnTopicMapper {
    int deleteByPrimaryKey(Integer topicId);

    int insert(ForumnTopic record);

    int insertSelective(ForumnTopic record);

    ForumnTopic selectByPrimaryKey(Integer topicId);

    int updateByPrimaryKeySelective(ForumnTopic record);

    int updateByPrimaryKeyWithBLOBs(ForumnTopic record);

    int updateByPrimaryKey(ForumnTopic record);

    /**
     * 查询帖子列表
     * @return
     */
    Page<ForumnTopic> allforumntopic();
}