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
    public static void addCustomer(Customer cust) {
            try {
                String sql = "INSERT INTO customer(username, password, name, email) VALUES (?,?,?,?)";
                PreparedStatement prepStmt = Postgres.getConnection().prepareStatement(sql);



            } catch (SQLException err) {
                System.out.println(err.getMessage());
            }
    }
}
