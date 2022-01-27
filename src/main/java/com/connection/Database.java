package com.connection;

import java.net.URI;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class Database {
    // add static variable
    private static Connection conn = null;
    private static String type = "postgres";

    private static void initPostgres() {
        // initialize conn
        try {
            Class.forName("org.postgresql.Driver"); // use postgres driver

            URI dbURI = null;
            if(System.getenv("DATABASE_URL") != null)
                dbURI = new URI(System.getenv("DATABASE_URL")); // get value from system environment
            else
                dbURI = new URI("postgres://postgres:system@localhost:5432/salizacafe");

            String username, password, dbURL;

            username = dbURI.getUserInfo().split(":")[0];
            password = dbURI.getUserInfo().split(":")[1];
            dbURL = "jdbc:postgresql://" + dbURI.getHost() + ":" + dbURI.getPort() + dbURI.getPath();

            conn = DriverManager.getConnection(dbURL, username, password); // assign to static variable
        } catch (Exception err) {
            err.printStackTrace();
        }
    }

    private static void initOracle() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            String username, password, dbURL;

            dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
            username = "SALIZACAFE";
            password = "system";

            conn = DriverManager.getConnection(dbURL,username,password);
        } catch (Exception err) {
            err.printStackTrace();
        }
    }

    public static String getType() {
        return type;
    }

    // return connection
    public static Connection getConnection() {
        // check if conn is null
        try {
            if(conn == null || conn.isClosed()) {
                if(type.equals("postgres")) initPostgres(); // initialize the database
                else if(type.equals("oracle")) initOracle();
            }
        } catch (SQLException err) {
            err.printStackTrace();
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
