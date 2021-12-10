package com.model;

import java.util.Date;

public class Order {
    private int order_id;
    private String order_status;
    private Date order_date;
    private double total_price;
    private int quantity;
    private Customer customer;
    private Menu item;

    public Order() {
        this.order_status = null;
        this.order_date = null;
        this.total_price = 0;
        this.quantity = 0;
        this.customer = null;
        this.item = null;
    }

    public Order(String order_status, Date order_date, double total_price, int quantity, Customer customer, Menu item) {
        this.order_status = order_status;
        this.order_date = order_date;
        this.total_price = total_price;
        this.quantity = quantity;
        this.customer = customer;
        this.item = item;
    }

    public Order(Order order) {
        this.order_status = order.order_status;
        this.order_date = order.order_date;
        this.total_price = order.total_price;
        this.quantity = order.quantity;
        this.customer = order.customer;
        this.item = order.item;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getOrder_status() {
        return order_status;
    }

    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Menu getItem() {
        return item;
    }

    public void setItem(Menu item) {
        this.item = item;
    }
}
