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
        // perform sign up
        String username = request.getParameter("username");

        Customer cust = CustomerDA.isUsernameExisted(username);

        if(cust.isValid()) {
            // set data
            String password, name, email;
            password = request.getParameter("password");
            name = request.getParameter("name");
            email = request.getParameter("email");

            cust.setCustomer(username, password, name, email);

            // add new customer
            boolean succeed = CustomerDA.addCustomer(cust);

            if(succeed) {
                // todo - message , etc
                return;
            }
        } else {
            // todo - (use another username)
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        // perform login
    }
}
