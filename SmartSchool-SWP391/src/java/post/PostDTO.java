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
public class PostDTO {
    private int postId;
    private String userId;
    private int categoryId;
    private byte[] postImg;
    private String description;
    private Date date;
    private boolean type;
    private String title;
    private String postStatus;
    private String categoryName;

    

    public PostDTO() {
    }

    public PostDTO(int postId, String userId, int categoryId, byte[] postImg, String description, Date date, boolean type, String title, String postStatus, String categoryName) {
        this.postId = postId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.postImg = postImg;
        this.description = description;
        this.date = date;
        this.type = type;
        this.title = title;
        this.postStatus = postStatus;
        this.categoryName = categoryName;
    }



//    public PostDTO(int postId, String userId, int categoryId, byte[] postImg, String description, Date date, boolean type, String title, String postStatus) {
//        this.postId = postId;
//        this.userId = userId;
//        this.categoryId = categoryId;
//        this.postImg = postImg;
//        this.description = description;
//        this.date = date;
//        this.type = type;
//        this.title = title;
//        this.postStatus = postStatus;
//    }

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

    public boolean getType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(String postStatus) {
        this.postStatus = postStatus;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    
    


    
}
