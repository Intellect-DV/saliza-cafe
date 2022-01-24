package com.dataaccess;

import com.helper.QueryHelper;
import com.model.Menu;

import java.sql.ResultSet;
import java.util.ArrayList;

public abstract class MenuDA {
    public static void createMenu() {
        // create menu
    }

    public static ArrayList<Menu> retrieveMenus(String type) {
        // retrieve menu
        ArrayList <Menu> menus = new ArrayList<>();
        try {
            String sql = "SELECT * FROM menu WHERE type=?";

            ResultSet rs = QueryHelper.getResultSet(sql,new String[]{type});

            while(rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String path = rs.getString("pic_path");

                menus.add(new Menu(id, name, price, description, path, type));
            }
        } catch (Exception err) {
            err.printStackTrace();
        }

        return menus;
    }

    public static Menu retrieveMenuById(int id) {
        Menu menu = new Menu();

        try {
            String sql = "SELECT id, name, price, description FROM menu WHERE id=?";

            ResultSet rs = QueryHelper.getResultSet(sql,new Integer[]{id});

            if(rs.next()) {
                menu.setItemId(rs.getInt("id"));
                menu.setItemPrice(rs.getDouble("price"));
                menu.setItemName(rs.getString("name"));
                menu.setItemDescription(rs.getString("description"));
            }
        } catch (Exception err) {
            err.printStackTrace();
        }

        return menu;
    }

    public static void updateMenu() {
        // update menu
    }

    public static void deleteMenu() {
        // delete menu
    }
}
