package com.dataaccess;

import java.sql.*;

import com.connection.Database;
import com.helper.QueryHelper;
import com.model.Customer;

public abstract class CustomerDA {

    // check username if existed in database
    public static Customer isUsernameExisted(String username) {
        Customer cust = new Customer();

        try {
            String sql = "SELECT custid FROM customer WHERE username=?";
            ResultSet rs = QueryHelper.getResultSet(sql, new String[]{username});

            cust.setValid(rs.next()); rs.close();
        } catch (SQLException err) {
            err.printStackTrace();
        } finally {
            Database.closeConnection();
        }

        return cust;
    }

    // add new customer
    public static boolean createCustomer(Customer cust) {
        boolean succeed = false;
        try {
            String sql = "INSERT INTO customer(username, password, custname, custemail) VALUES (?,?,?,?)";

            Object[] obj = new Object[] {
              cust.getCustomerUsername(),
              cust.getCustomerPassword(),
              cust.getCustomerName(),
              cust.getCustomerEmail()
            };

            int rowAffected = QueryHelper.insertUpdateDeleteQuery(sql,obj);
            if(rowAffected == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }

    // get customer
    public static Customer retrieveCustomer(String username, String password) {
        Customer cust = new Customer();

        try {
            String sql = "SELECT custid, custname, custemail FROM customer WHERE username=? AND password=?";

            ResultSet rs = QueryHelper.getResultSet(sql, new String[] {username, password});

            if(rs.next()) {
                String name, email;
                int id = rs.getInt("custid");
                name = rs.getString("custname");
                email = rs.getString("custemail");

                cust.setCustomer(id,username,name,email); cust.setValid(true);
            } else {
                cust.setValid(false);
            }
            rs.close();
        } catch (SQLException err) {
            err.printStackTrace();
        } finally {
            Database.closeConnection();
        }

        return cust;
    }

    // update username, name, email
    public static boolean updateCustomerProfile(Customer updateCust, int id) {
        boolean succeed = false;
        try {
            String sql = "UPDATE customer set username=?, custname=?, custemail=? WHERE custid=?";

            int affectedRow  = QueryHelper.insertUpdateDeleteQuery(sql,new Object[]{
                    updateCust.getCustomerUsername(),
                    updateCust.getCustomerName(),
                    updateCust.getCustomerEmail(),
                    id
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }
}
