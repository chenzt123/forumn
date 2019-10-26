package com.hynetwork.ueditor;

public class UEditorResult {
	/**
	 * 上传结果
	 */
	private String state;
	/**
	 * 原图名称
	 */
	private String original;
	/**
	 * 保存名称
	 */
	private String title;
	/**
	 * 文件路径
	 */
	private String url;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getOriginal() {
		return original;
	}

	public void setOriginal(String original) {
		this.original = original;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
