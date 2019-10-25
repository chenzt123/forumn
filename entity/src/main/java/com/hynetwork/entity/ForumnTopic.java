package com.hynetwork.entity;



import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 论坛帖子表
 */
public class ForumnTopic {
    private Integer topicId;

    private String topicTitle;

    private String drawId;

    private Short topicStatus;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date publishTime;

    private String authorId;

    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    private String relativeModIt;

    private String topicContent;

    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    public String getTopicTitle() {
        return topicTitle;
    }

    public void setTopicTitle(String topicTitle) {
        this.topicTitle = topicTitle;
    }

    public String getDrawId() {
        return drawId;
    }

    public void setDrawId(String drawId) {
        this.drawId = drawId;
    }

    public Short getTopicStatus() {
        return topicStatus;
    }

    public void setTopicStatus(Short topicStatus) {
        this.topicStatus = topicStatus;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getRelativeModIt() {
        return relativeModIt;
    }

    public void setRelativeModIt(String relativeModIt) {
        this.relativeModIt = relativeModIt;
    }

    public String getTopicContent() {
        return topicContent;
    }

    public void setTopicContent(String topicContent) {
        this.topicContent = topicContent;
    }
}