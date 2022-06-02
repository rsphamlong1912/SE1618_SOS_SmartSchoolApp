/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedbackSystem;

import java.sql.Date;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class FeedbackSystemDTO {
    private int feedbackId;
    private String userId;
    private String feedbackDesc;
    private byte[] feedbackImg;
    private Date dateFeedback;

    public FeedbackSystemDTO() {
    }

    public FeedbackSystemDTO(int feedbackId, String userId, String feedbackDesc, byte[] feedbackImg, Date dateFeedback) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.feedbackDesc = feedbackDesc;
        this.feedbackImg = feedbackImg;
        this.dateFeedback = dateFeedback;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFeedbackDesc() {
        return feedbackDesc;
    }

    public void setFeedbackDesc(String feedbackDesc) {
        this.feedbackDesc = feedbackDesc;
    }

    public byte[] getFeedbackImg() {
        return feedbackImg;
    }

    public void setFeedbackImg(byte[] feedbackImg) {
        this.feedbackImg = feedbackImg;
    }

    public Date getDateFeedback() {
        return dateFeedback;
    }

    public void setDateFeedback(Date dateFeedback) {
        this.dateFeedback = dateFeedback;
    }

    
}
