
package jobPost;

/**
 *
 * @author TrinhNgocBao
 */
public class JobPostDTO {
    private int jobId;
    private String userId;
    private int jobCategoryId;
    private String title;
    private String description;
    private float salary;
    private int amount;
    private int timeJob;
    private String process;
    private String date;
    private boolean status;
    private String jobCategoryName;
    private String fullname;
    private String compName;
    private String avatar;
    private int amountFreelancer;

    public JobPostDTO(int jobId, String userId, int jobCategoryId, String title, String description, float salary, int amount, int timeJob, String process, String date, boolean status, String jobCategoryName, String fullname, String compName, String avatar, int amountFreelancer) {
        this.jobId = jobId;
        this.userId = userId;
        this.jobCategoryId = jobCategoryId;
        this.title = title;
        this.description = description;
        this.salary = salary;
        this.amount = amount;
        this.timeJob = timeJob;
        this.process = process;
        this.date = date;
        this.status = status;
        this.jobCategoryName = jobCategoryName;
        this.fullname = fullname;
        this.compName = compName;
        this.avatar = avatar;
        this.amountFreelancer = amountFreelancer;
    }

    public JobPostDTO() {
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

    public int getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(int jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getTimeJob() {
        return timeJob;
    }

    public void setTimeJob(int timeJob) {
        this.timeJob = timeJob;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getJobCategoryName() {
        return jobCategoryName;
    }

    public void setJobCategoryName(String jobCategoryName) {
        this.jobCategoryName = jobCategoryName;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getCompName() {
        return compName;
    }

    public void setCompName(String compName) {
        this.compName = compName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getAmountFreelancer() {
        return amountFreelancer;
    }

    public void setAmountFreelancer(int amountFreelancer) {
        this.amountFreelancer = amountFreelancer;
    }

    
    
    
    
    
    
}
