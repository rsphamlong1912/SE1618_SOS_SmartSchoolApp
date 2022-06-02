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
public class postDTO {
    private int postId;
    private String userId;
    private int categoryId;
    private byte[] postImg;
    private String description;
    private Date date;
    private String type;
    private String title;
    private String statusPost;

    public postDTO() {
    }

    public postDTO(int postId, String userId, int categoryId, byte[] postImg, String description, Date date, String type, String title, String statusPost) {
        this.postId = postId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.postImg = postImg;
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

    public byte[] getPostImg() {
        return postImg;
    }

    public void setPostImg(byte[] postImg) {
        this.postImg = postImg;
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
