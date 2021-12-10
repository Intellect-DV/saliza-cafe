package com.model;

import java.util.Date;

public class Payment {
    private int paymentId;
    private Date paymentDate;
    private String paymentStatus;
    private int orderId;

    public Payment() {
        this.paymentDate = null;
        this.paymentStatus = null;
        this.orderId = 0;
    }

    public Payment(Date paymentDate, String paymentStatus, int orderId) {
        this.paymentDate = paymentDate;
        this.paymentStatus = paymentStatus;
        this.orderId = orderId;
    }

    public Payment(Payment payment) {
        this.paymentId = payment.paymentId;
        this.paymentDate = payment.paymentDate;
        this.paymentStatus = payment.paymentStatus;
        this.orderId = payment.orderId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
}
