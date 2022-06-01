/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class tblUser {
    private String userId;
    private String roleId;
    private String password;
    private String fullname;
    private String phone;
    private String email;
    private String facebook;
    private String compName;
    private String compDesc;
    private String compPhone;
    private String compEmail;
    private String compAddress;
    private boolean statusBaned;
    private boolean haveJob;

    public tblUser() {
    }

    public tblUser(String userId, String roleId, String password, String fullname, String phone, String email, String facebook, String compName, String compDesc, String compPhone, String compEmail, String compAddress, boolean statusBaned, boolean haveJob) {
        this.userId = userId;
        this.roleId = roleId;
        this.password = password;
        this.fullname = fullname;
        this.phone = phone;
        this.email = email;
        this.facebook = facebook;
        this.compName = compName;
        this.compDesc = compDesc;
        this.compPhone = compPhone;
        this.compEmail = compEmail;
        this.compAddress = compAddress;
        this.statusBaned = statusBaned;
        this.haveJob = haveJob;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getCompName() {
        return compName;
    }

    public void setCompName(String compName) {
        this.compName = compName;
    }

    public String getCompDesc() {
        return compDesc;
    }

    public void setCompDesc(String compDesc) {
        this.compDesc = compDesc;
    }

    public String getCompPhone() {
        return compPhone;
    }

    public void setCompPhone(String compPhone) {
        this.compPhone = compPhone;
    }

    public String getCompEmail() {
        return compEmail;
    }

    public void setCompEmail(String compEmail) {
        this.compEmail = compEmail;
    }

    public String getCompAddress() {
        return compAddress;
    }

    public void setCompAddress(String compAddress) {
        this.compAddress = compAddress;
    }

    public boolean isStatusBaned() {
        return statusBaned;
    }

    public void setStatusBaned(boolean statusBaned) {
        this.statusBaned = statusBaned;
    }

    public boolean isHaveJob() {
        return haveJob;
    }

    public void setHaveJob(boolean haveJob) {
        this.haveJob = haveJob;
    }
    
    
}
