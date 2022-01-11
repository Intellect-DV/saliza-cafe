package com.controller;

import com.dataacess.CustomerDA;
import com.model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) return;

        switch(action.toLowerCase()){
            case("signup"):
                signUp(request,response);
                break;
            case("login"):
                login(request, response);
                break;

            default:
                // other
                break;
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response){
        // set data
        String username, password, name, email;
        username = request.getParameter("username");
        password = request.getParameter("password");
        name = request.getParameter("name");
        email = request.getParameter("email");

        if(username == null || password == null || name == null || email == null){
            System.out.println("Input empty");
            return;
        }

        Customer cust = CustomerDA.isUsernameExisted(username);

        if(!cust.isValid()) {
            cust.setCustomer(username, password, name, email);

            // add new customer
            boolean succeed = CustomerDA.addCustomer(cust);

            if(succeed) {
                // todo - message , etc
                System.out.println("New User added");
            }
        } else {
            // todo - (use another username)
            System.out.println("Cannot add user: username duplicated");
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        String username, password;
        username = request.getParameter("username");
        password = request.getParameter("password");

        if(username == null || password == null) {
            System.out.println("Input empty");
            return;
        }

        Customer cust = CustomerDA.getCustomer(username, password);

        if(cust.isValid()) {
            // todo - make session
            System.out.println("Make a session");
        } else {
            // todo - wrong username / password
            System.out.println("Wrong username or password");
        }
    }
}
