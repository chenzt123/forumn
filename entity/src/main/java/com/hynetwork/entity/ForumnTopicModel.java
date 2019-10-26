package com.hynetwork.entity;

import java.util.Date;

/**
 * 帖子系统模块
 */
public class ForumnTopicModel {
    private Integer modelId;

    private String modelTitle;

    private String modelType;

    private Short modelStatus;

    private Short modelIndex;

    private Date modelCreateTime;

    private String modelContent;

    public Integer getModelId() {
        return modelId;
    }

    public void setModelId(Integer modelId) {
        this.modelId = modelId;
    }

    public String getModelTitle() {
        return modelTitle;
    }

    public void setModelTitle(String modelTitle) {
        this.modelTitle = modelTitle;
    }

    public String getModelType() {
        return modelType;
    }

    public void setModelType(String modelType) {
        this.modelType = modelType;
    }

    public Short getModelStatus() {
        return modelStatus;
    }

    public void setModelStatus(Short modelStatus) {
        this.modelStatus = modelStatus;
    }

    public Short getModelIndex() {
        return modelIndex;
    }

    public void setModelIndex(Short modelIndex) {
        this.modelIndex = modelIndex;
    }

    public Date getModelCreateTime() {
        return modelCreateTime;
    }

    public void setModelCreateTime(Date modelCreateTime) {
        this.modelCreateTime = modelCreateTime;
    }

    public String getModelContent() {
        return modelContent;
    }

    public void setModelContent(String modelContent) {
        this.modelContent = modelContent;
    }
}