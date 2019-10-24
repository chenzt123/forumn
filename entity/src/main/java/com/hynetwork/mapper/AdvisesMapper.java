package com.hynetwork.mapper;

import com.hynetwork.entity.Advises;

public interface AdvisesMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Advises record);

    int insertSelective(Advises record);

    Advises selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Advises record);

    int updateByPrimaryKey(Advises record);
}