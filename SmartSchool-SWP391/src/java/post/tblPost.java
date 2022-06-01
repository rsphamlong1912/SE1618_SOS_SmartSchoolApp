/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package post;

import java.sql.Date;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class tblPost {
    private int postId;
    private String userId;
    private int categoryId;
    private String picture;
    private String description;
    private Date date;
    private String type;
    private String title;
    private String statusPost;

    public tblPost() {
    }

    public tblPost(int postId, String userId, int categoryId, String picture, String description, Date date, String type, String title, String statusPost) {
        this.postId = postId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.picture = picture;
        this.description = description;
        this.date = date;
        this.type = type;
        this.title = title;
        this.statusPost = statusPost;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatusPost() {
        return statusPost;
    }

    public void setStatusPost(String statusPost) {
        this.statusPost = statusPost;
    }
    
}
