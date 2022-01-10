package com.dataacess;

import java.sql.*;
import com.connection.Postgres;
import com.helper.QueryHelper;
import com.model.Customer;

public abstract class CustomerDA {

    // check username if existed in database
    public static Customer isUsernameExisted(String username) {
        Customer cust = new Customer();

        try {
            String sql = "SELECT id FROM customer WHERE username=?";

            ResultSet rs = QueryHelper.getResultSet(sql, new String[]{username});

            if(rs.next()) cust.setValid(true);
            else cust.setValid(false);

            rs.close();
        } catch (SQLException err) {
            System.out.println(err.getMessage());
            cust.setValid(false);
        } finally {
            Postgres.closeConnection();
        }

        return cust;
    }

    // add new customer
    public static boolean addCustomer(Customer cust) {
        boolean succeed = false;
        try {
            String sql = "INSERT INTO customer(username, password, name, email) VALUES (?,?,?,?)";

            Object[] obj = new Object[] {
              cust.getCustomerUsername(),
              cust.getCustomerPassword(),
              cust.getCustomerName(),
              cust.getCustomerEmail()
            };

            int rowAffected = QueryHelper.insertQuery(sql,obj) ;

            if(rowAffected == 1) {
                succeed = true;
            }
        } catch (Exception err) {
            System.out.println(err.getMessage());
        }

        return succeed;
    }
}
