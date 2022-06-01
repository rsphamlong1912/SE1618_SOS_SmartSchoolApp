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
public class tblReport {
    private int reportId;
    private String userId;
    private int postId;
    private int reportTypeId;
    private String reportDetail;

    public tblReport() {
    }

    public tblReport(int reportId, String userId, int postId, int reportTypeId, String reportDetail) {
        this.reportId = reportId;
        this.userId = userId;
        this.postId = postId;
        this.reportTypeId = reportTypeId;
        this.reportDetail = reportDetail;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
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
    
}
