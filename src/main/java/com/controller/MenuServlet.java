package com.controller;

import com.dataaccess.MenuDA;
import com.model.Menu;
import com.model.Worker;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MenuServlet", value = "/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null) return;

        switch (action.toLowerCase()) {
            case "getmenu":
                getMenus(request, response);
                break;
            case "getmenuinfo":
                getMenuInfo(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if(action == null) return;

        switch (action.toLowerCase()) {
            case "updatemenuinfo":
                updateMenuInfo(request, response);
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

    private static void getMenus(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type");
        JSONObject json = new JSONObject();
        if(type == null || type.equals("")) return;

        ArrayList <Menu> menus = MenuDA.retrieveMenus(type);


        if(menus.size() == 0) {
            response.setContentType("application/json");
            json.put("error", "None of menu type food");
            jsonResponse(response, 400, json);
            return;
        }
        request.setAttribute("menus", menus);

        try {
            response.setContentType("text/html");
            request.getRequestDispatcher("/view/edit-menu__generate.jsp").include(request, response);
        } catch (Exception err) {
            err.printStackTrace();
        }
    }

    private static void getMenuInfo(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        String menuIdTemp = request.getParameter("id");

        if(menuIdTemp == null || menuIdTemp.equals("")) {
            json.put("error","Id empty");
            jsonResponse(response, 400, json);
            return;
        }

        int menuId = -1;
        try {
            menuId = Integer.parseInt(menuIdTemp);
        } catch (Exception err) {
            err.printStackTrace();
            json.put("error", "Id must be number");
            jsonResponse(response, 400, json);
        }

        if(menuId == -1) return;

        Menu menu = MenuDA.retrieveMenuById(menuId);

        if(menu.getItemId() == -1) {
            json.put("error", "No menu with id provided");
            jsonResponse(response, 400, json);
            return;
        }

        JSONObject menuJson = new JSONObject();
        menuJson.put("menuId", menu.getItemId());
        menuJson.put("menuName", menu.getItemName());
        menuJson.put("menuPrice", menu.getItemPrice());
        menuJson.put("menuDescription", menu.getItemDescription());

        json.put("content", menuJson);

        jsonResponse(response, 200, json);
    }

    private static void updateMenuInfo(HttpServletRequest request, HttpServletResponse response) {
        JSONObject json = new JSONObject();
        response.setContentType("application/json");

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("workerObj") == null) {
            json.put("error", "Authorization failed! Please login first.");
            jsonResponse(response, 401, json);
            return;
        }

        Worker worker = (Worker) session.getAttribute("workerObj");

        if(worker.getManagerId() != -1) {
            json.put("error", "Authorization failed! Only manager can update menu.");
            return;
        }

        String idTemp, name, priceTemp, description;

        idTemp = request.getParameter("id");
        name = request.getParameter("name");
        priceTemp = request.getParameter("price");
        description = request.getParameter("description");

        if(idTemp == null || name == null || priceTemp == null || description == null
            || idTemp.equals("") || name.equals("") || priceTemp.equals("") || description.equals("")) {
            json.put("error", "Input empty");
            jsonResponse(response, 400, json);
            return;
        }

        int id = -1; double price = -1;
        try {
            id = Integer.parseInt(idTemp);
            price = Double.parseDouble(priceTemp);
        } catch (Exception err) {
            err.printStackTrace();
            json.put("error", "Id must be number / Price must be double");
            jsonResponse(response, 400, json);
        }

        if(id == -1 || price == -1) return;

        boolean succeed = MenuDA.updateMenuInfo(id,name,price,description);

        if(succeed) {
            json.put("message", "Menu has been updated");
            json.put("menuId", id);
        } else {
            json.put("error", "Cannot update menu");
        }

        jsonResponse(response, succeed ? 200 : 400, json);
    }
}
