
package jobPostQuestion;

/**
 *
 * @author TrinhNgocBao
 */
public class JobPostQuestionDTO {
    private int questionId;
    private int jobId;
    private String question;

    public JobPostQuestionDTO() {
    }

    public JobPostQuestionDTO(int questionId, int jobId, String question) {
        this.questionId = questionId;
        this.jobId = jobId;
        this.question = question;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
    
    
}
