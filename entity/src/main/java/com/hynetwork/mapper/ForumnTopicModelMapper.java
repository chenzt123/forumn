package com.hynetwork.mapper;

import com.hynetwork.entity.ForumnTopicModel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface ForumnTopicModelMapper {
    int deleteByPrimaryKey(Integer modelId);

    int insert(ForumnTopicModel record);

    int insertSelective(ForumnTopicModel record);

    ForumnTopicModel selectByPrimaryKey(Integer modelId);

    int updateByPrimaryKeySelective(ForumnTopicModel record);

    int updateByPrimaryKeyWithBLOBs(ForumnTopicModel record);

    int updateByPrimaryKey(ForumnTopicModel record);

    /**
     * 查询所有帖子系统模块
     * @return
     */
    List<ForumnTopicModel> allForumnTopicModel();
}