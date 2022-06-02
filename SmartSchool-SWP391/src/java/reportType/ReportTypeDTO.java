/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportType;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class ReportTypeDTO {
    private int reportTypeId;
    private String reportType;

    public ReportTypeDTO() {
    }

    public ReportTypeDTO(int reportTypeId, String reportType) {
        this.reportTypeId = reportTypeId;
        this.reportType = reportType;
    }

    public int getReportTypeId() {
        return reportTypeId;
    }

    public void setReportTypeId(int reportTypeId) {
        this.reportTypeId = reportTypeId;
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType;
    }
    
}
