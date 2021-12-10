package com.model;

public class Customer {
   private int cust_id; // generated by database
   private String username;
   private String password;
   private String cust_name;
   private String cust_email;

    public Customer() {
        this.username = null;
        this.password = null;
        this.cust_name = null;
        this.cust_email = null;
    }

    public Customer(String username, String password, String cust_name, String cust_email) {
        this.username = username;
        this.password = password;
        this.cust_name = cust_name;
        this.cust_email = cust_email;
    }

    public Customer(Customer cust) {
        this.username = cust.getUsername();
        this.cust_name = cust.getCust_name();
        this.cust_email = cust.getCust_email();
    }

    public int getCust_id() {
        return cust_id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getCust_name() {
        return cust_name;
    }

    public String getCust_email() {
        return cust_email;
    }

    public void setCust_id(int cust_id) {
        this.cust_id = cust_id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public void setCust_email(String cust_email) {
        this.cust_email = cust_email;
    }
}
