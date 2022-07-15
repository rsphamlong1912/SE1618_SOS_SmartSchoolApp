
package jobPostAnswer;

/**
 *
 * @author TrinhNgocBao
 */
public class JobPostAnswerDTO {
    private int answerId;
    private int questionId;
    private String userId;
    private int jobId;
    private String answer;
    private String question;

    public JobPostAnswerDTO() {
    }

    public JobPostAnswerDTO(int answerId, int questionId, String userId, int jobId, String answer, String question) {
        this.answerId = answerId;
        this.questionId = questionId;
        this.userId = userId;
        this.jobId = jobId;
        this.answer = answer;
        this.question = question;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
}
