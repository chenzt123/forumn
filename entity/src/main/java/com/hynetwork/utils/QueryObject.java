package com.hynetwork.utils;


public class QueryObject {

    private Integer pageNum= 1;//当前页

    private Integer pageSize=10;//没有最大显示条数.

    //分页的方法
    public Integer getStart(){
        return (pageNum - 1 ) * pageSize ;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
