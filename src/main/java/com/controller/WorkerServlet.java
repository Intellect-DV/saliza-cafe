package com.controller;

import com.dataacess.WorkerDA;
import com.model.Worker;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "WorkerServlet", value = "/worker")
public class WorkerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null) return;

        switch (action.toLowerCase()) {
            case "add":
                addWorker(request, response);
                break;
            case "delete":
                deleteWorker(request, response);
                break;
            case "login":
                loginWorker(request, response);
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

    // add worker
    private static void addWorker(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        System.out.println("addWorker");
        String username, password, name ,email; int managerId;

        username = request.getParameter("username");
        password = request.getParameter("password");
        name = request.getParameter("name");
        email = request.getParameter("email");

        if((username == null || password == null || name == null || email == null)
                || (username.equals("") || password.equals("") || name.equals("") || email.equals("")) ) {
            System.out.println("Input empty");
            json.put("error", "Input empty");
            jsonResponse(response, 400, json);
            return;
        }

        // get manager session
        HttpSession session = request.getSession(false);

        if(session == null) {
            System.out.println("Login first before add worker");
            json.put("error", "Authorization failed!");
            jsonResponse(response, 401, json);
            return;
        }

        // check existed username

        // add worker into database

        json.put("message", "addWorker");
        jsonResponse(response, 200, json);
    }

    private static void deleteWorker(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        System.out.println("deleteWorker");
        json.put("message", "deleteWorker");
        jsonResponse(response, 200, json);
    }

    private static void loginWorker(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        String username, password;

        username = request.getParameter("username");
        password = request.getParameter("password");

        if(username == null || password == null || username.equals("") || password.equals("")) {
            System.out.println("Input empty");
            json.put("error", "Input empty");
            jsonResponse(response, 400, json);
            return;
        }

        Worker worker = WorkerDA.retrieveWorker(username, password);
        boolean succeed = false;

        if(worker.isValid()) {
            // make session
            HttpSession session = request.getSession();
            session.setAttribute("workerObj", worker);
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

        jsonResponse(response, succeed ? 200 : 400, json);
    }
}
