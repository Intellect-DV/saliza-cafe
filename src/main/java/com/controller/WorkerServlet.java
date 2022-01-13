package com.controller;

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
        System.out.println("loginWorker");
        json.put("message", "loginWorker");
        jsonResponse(response, 200, json);
    }
}
