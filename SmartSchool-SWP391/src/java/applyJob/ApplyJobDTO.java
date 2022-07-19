/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package applyJob;

/**
 *
 * @author TrinhNgocBao
 */
public class ApplyJobDTO {

    private int applyJobId;
    private int jobId;
    private String userId;
    private String status;

    public ApplyJobDTO() {
    }

    public ApplyJobDTO(int applyJobId, int jobId, String userId, String status) {
        this.applyJobId = applyJobId;
        this.jobId = jobId;
        this.userId = userId;
        this.status = status;
    }

    public int getApplyJobId() {
        return applyJobId;
    }

    public void setApplyJobId(int applyJobId) {
        this.applyJobId = applyJobId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
