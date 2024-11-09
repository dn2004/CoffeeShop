/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DTO;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author dat20
 */
public class DateReportDTO {

    private Date reportDate;
    private int orderQuantity;
    private double revenue;

    public DateReportDTO(Date reportDate, int orderQuantity, double revenue) {
        this.reportDate = reportDate;
        this.orderQuantity = orderQuantity;
        this.revenue = revenue;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

}
