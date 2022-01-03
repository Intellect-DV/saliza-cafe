package com.connection;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class Postgres {
    // add static variable
    private static Connection conn = null;

    private static void init() {
        // initialize conn
        try {
            Class.forName("org.postgresql.Driver"); // use postgres driver

            // get value from system environment
            URI dbURI = new URI(System.getenv("DATABASE_URL"));

            String username, password, dbURL;

            username = dbURI.getUserInfo().split(":")[0];
            password = dbURI.getUserInfo().split(":")[1];
            dbURL = "jdbc:postgresql://" + dbURI.getHost() + ":" + dbURI.getPort() + dbURI.getPath();

            conn = DriverManager.getConnection(dbURL, username, password); // assign to static variable
        } catch (Exception err) {
            err.printStackTrace();
        }
    }

    // return connection
    public static Connection getConnection() {
        // check if conn is null
        if(conn == null) {
            init(); // initialize the database
        }
        return conn;
    }

    // close connection
    public static void closeConnection() {
        try {
            if(!conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException err) {
            err.printStackTrace();
        }
    }
}
