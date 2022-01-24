package com.controller;

import com.dataaccess.MenuDA;
import com.model.Menu;
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
                getMenu(request, response);
                break;
            case "getmenuinfo":
                getMenuInfo(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

    private static void getMenu(HttpServletRequest request, HttpServletResponse response) {
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
}
