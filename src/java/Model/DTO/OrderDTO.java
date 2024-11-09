/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DTO;

import java.sql.Timestamp;
import java.time.LocalDateTime;


/**
 *
 * @author dat20
 */
public class OrderDTO {
    private int orderId;
    private String customerName;
    private int tableNumber;
    private String customerNumber;
    private Timestamp  orderDatetime;
    private double totalAmount;
    private int statusId;

    public OrderDTO(int orderId, String customerName, int tableNumber, String customerNumber, Timestamp  orderDatetime, double totalAmount, int statusId) {
        this.orderId = orderId;
        this.customerName = customerName;
        this.tableNumber = tableNumber;
        this.customerNumber = customerNumber;
        this.orderDatetime = orderDatetime;
        this.totalAmount = totalAmount;
        this.statusId = statusId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public String getCustomerNumber() {
        return customerNumber;
    }

    public void setCustomerNumber(String customerNumber) {
        this.customerNumber = customerNumber;
    }

    public Timestamp  getOrderDatetime() {
        return orderDatetime;
    }

    public void setOrderDatetime(Timestamp orderDatetime) {
        this.orderDatetime = orderDatetime;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        switch (statusId) {
            case 1:
                return "Pending";
            case 2:
                return "Confirmed";
            case 3:
                return "Shiping";
            case 4:
                return "Completed";
        }
        return "oops";
    }

    public int getStatusId() {
        return statusId;
    }
    

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }
    
}
