/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class ReportDTO {
    private int reportId;
    private String postUser;
    private int postId;
    private int reportTypeId;
    private String reportDetail;
    private String title;
    private String categoryName;
    private String reportUser;
    private int type;
    private String reportType;
    private String postDescription;
    private String datePost;

    public ReportDTO() {
    }

    public ReportDTO(int reportId, String postUser, int postId, int reportTypeId, String reportDetail, String title, String categoryName, String reportUser, int type, String reportType, String postDescription, String datePost) {
        this.reportId = reportId;
        this.postUser = postUser;
        this.postId = postId;
        this.reportTypeId = reportTypeId;
        this.reportDetail = reportDetail;
        this.title = title;
        this.categoryName = categoryName;
        this.reportUser = reportUser;
        this.type = type;
        this.reportType = reportType;
        this.postDescription = postDescription;
        this.datePost = datePost;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public String getPostUser() {
        return postUser;
    }

    public void setPostUser(String postUser) {
        this.postUser = postUser;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getReportTypeId() {
        return reportTypeId;
    }

    public void setReportTypeId(int reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    public String getReportDetail() {
        return reportDetail;
    }

    public void setReportDetail(String reportDetail) {
        this.reportDetail = reportDetail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getReportUser() {
        return reportUser;
    }

    public void setReportUser(String reportUser) {
        this.reportUser = reportUser;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }

    public String getPostDescription() {
        return postDescription;
    }

    public void setPostDescription(String postDescription) {
        this.postDescription = postDescription;
    }

    public String getDatePost() {
        return datePost;
    }

    public void setDatePost(String datePost) {
        this.datePost = datePost;
    }

    
    

    

    
    
}
