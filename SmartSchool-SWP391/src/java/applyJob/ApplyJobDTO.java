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
    private String fullname;
    private String phone;
    private String email;
    private String facebook;

    public ApplyJobDTO() {
    }

    public ApplyJobDTO(int applyJobId, int jobId, String userId, String status, String fullname, String phone, String email, String facebook) {
        this.applyJobId = applyJobId;
        this.jobId = jobId;
        this.userId = userId;
        this.status = status;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.facebook = facebook;
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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }
    
}
