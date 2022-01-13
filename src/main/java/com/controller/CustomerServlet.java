package com.controller;

import com.dataacess.CustomerDA;
import com.model.Customer;
import org.json.JSONObject;

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
            case("update"):
                updateProfile(request, response);
                break;
            default:
                // other
                break;
        }
    }

    private static void jsonResponse(HttpServletResponse response, int statusCode, JSONObject json) {
        try {
            response.setContentType("application/json");
            response.setStatus(statusCode);
            response.getWriter().println(json);
        } catch (IOException err) {
            err.printStackTrace();
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response){
        JSONObject json = new JSONObject();
        // set data
        String username, password, name, email;
        username = request.getParameter("username");
        password = request.getParameter("password");
        name = request.getParameter("name");
        email = request.getParameter("email");

        if((username == null || password == null || name == null || email == null) ||
                (username.equals("") || password.equals("") || name.equals("") || email.equals("") )){
            System.out.println("Input empty");
            json.put("error", "Input empty");
            jsonResponse(response,400, json);
            return;
        }

        Customer cust = CustomerDA.isUsernameExisted(username);
        boolean succeed = false;

        if(!cust.isValid()) {
            cust.setCustomer(username, password, name, email);

            // add new customer
            if(CustomerDA.createCustomer(cust)) {
                // todo - message , etc
                System.out.println("New User added");
                json.put("message", "New user added");
                succeed = true;
            }
        } else {
            // todo - (use another username)
            System.out.println("Cannot add user: username duplicated");
            json.put("error", "Username duplicated");
        }

        jsonResponse(response,succeed ? 201 : 400, json);
    }

    private void login(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        String username, password;
        username = request.getParameter("username");
        password = request.getParameter("password");

        if(username == null || password == null || username.equals("") || password.equals("")) {
            System.out.println("Input empty");
            json.put("error", "input empty");
            jsonResponse(response,400, json);
            return;
        }

        Customer cust = CustomerDA.retrieveCustomer(username, password);
        boolean succeed = false;

        if(cust.isValid()) {
            // make session
            HttpSession session = request.getSession();
            session.setAttribute("customerObj", cust);
            session.setMaxInactiveInterval(60*20); // 20 min timeout after inactivity

            System.out.println("Session created");
            json.put("message", "Login success!");
            succeed = true;
            // todo - redirect page
        } else {
            // todo - wrong username / password
            System.out.println("Wrong username or password");
            json.put("error", "Wrong username  or password!");
        }

        jsonResponse(response, succeed ? 200 : 400 , json);
    }

    private void updateProfile(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        String username, name, email, password;

        username = request.getParameter("username");
        name = request.getParameter("name");
        email = request.getParameter("email");
        password = request.getParameter("password");

        if((username == null || name == null|| email == null || password == null) ||
                (username.equals("") || name.equals("") ||email.equals("") || password.equals("")) ) {
            System.out.println("Input is empty");
            json.put("error", "Input empty");
            jsonResponse(response, 400, json);
            return;
        }

        // get from session - if none do not create session
        HttpSession session = request.getSession(false);

        if(session == null) {
            System.out.println("Invalid login session: need to login to store session");
            json.put("error", "Authorization failed!");
            jsonResponse(response, 401, json);
            return;
        }
        Customer currentCust = (Customer) session.getAttribute("customerObj");
        System.out.println("Customer ID: " + currentCust.getCustomerId());
        System.out.println("Customer username: " + currentCust.getCustomerUsername());
        System.out.println("Customer name: " + currentCust.getCustomerName());
        System.out.println("Customer email: " + currentCust.getCustomerEmail());

        // check username is existed
        if(!currentCust.getCustomerUsername().equals(username) && CustomerDA.isUsernameExisted(username).isValid()) {
            System.out.println("invalid: username already taken");
            json.put("error", "Username already taken");
            jsonResponse(response, 403, json);
            return;
        }

        boolean succeed = false;
        if(CustomerDA.retrieveCustomer(currentCust.getCustomerUsername(), password).isValid()){
            // update customer info
            Customer tempCust = new Customer();
            System.out.println("here to update customer info");

            tempCust.setCustomerUsername(username);
            tempCust.setCustomerName(name);
            tempCust.setCustomerEmail(email);

            if(CustomerDA.updateCustomerProfile(tempCust, currentCust.getCustomerId())) {
                // update session
                currentCust.setCustomerUsername(username);
                currentCust.setCustomerName(name);
                currentCust.setCustomerEmail(email);

                json.put("message", "Profile updated");
                succeed = true;
            } else {
                json.put("error", "Cannot update profile");
            }
        } else {
            System.out.println("wrong password");
            json.put("error", "Wrong password");
        }

        jsonResponse(response, succeed ? 200 : 401, json);
    }
}
