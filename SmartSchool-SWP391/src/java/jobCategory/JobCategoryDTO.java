package jobCategory;

/**
 *
 * @author TrinhNgocBao
 */
public class JobCategoryDTO {

    private int jobCategoryId;
    private String jobCategoryName;
    private boolean statusCategory;
    private String jobImage;
    private String jobDescription;

    public JobCategoryDTO() {
    }

    public JobCategoryDTO(int jobCategoryId, String jobCategoryName, boolean statusCategory, String jobImage, String jobDescription) {
        this.jobCategoryId = jobCategoryId;
        this.jobCategoryName = jobCategoryName;
        this.statusCategory = statusCategory;
        this.jobImage = jobImage;
        this.jobDescription = jobDescription;
    }

    public int getJobCategoryId() {
        return jobCategoryId;
    }

    public void setJobCategoryId(int jobCategoryId) {
        this.jobCategoryId = jobCategoryId;
    }

    public String getJobCategoryName() {
        return jobCategoryName;
    }

    public void setJobCategoryName(String jobCategoryName) {
        this.jobCategoryName = jobCategoryName;
    }

    public boolean isStatusCategory() {
        return statusCategory;
    }

    public void setStatusCategory(boolean statusCategory) {
        this.statusCategory = statusCategory;
    }

    public String getJobImage() {
        return jobImage;
    }

    public void setJobImage(String jobImage) {
        this.jobImage = jobImage;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

}
