package com.dataaccess;

import com.connection.Database;
import com.helper.QueryHelper;
import com.model.Menu;

import java.sql.ResultSet;
import java.util.ArrayList;

public abstract class MenuDA {
    public static boolean createMenu(Menu menu) {
        // create menu
        boolean succeed = false;
        try {
            String sql = "INSERT INTO menu(name, price, description, pic_path, type) VALUES (?,?,?,?,?)";

            int affectedRow = QueryHelper.insertUpdateDeleteQuery(sql, new Object[] {
                    menu.getItemName(),
                    menu.getItemPrice(),
                    menu.getItemDescription(),
                    menu.getItemPicUrl(),
                    menu.getItemType()
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
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
        } finally {
            Database.closeConnection();
        }

        return menus;
    }

    public static Menu retrieveMenuById(int id) {
        Menu menu = new Menu();

        try {
            String sql = "SELECT id, name, price, description, pic_path FROM menu WHERE id=?";

            ResultSet rs = QueryHelper.getResultSet(sql,new Integer[]{id});

            if(rs.next()) {
                menu.setItemId(rs.getInt("id"));
                menu.setItemPrice(rs.getDouble("price"));
                menu.setItemName(rs.getString("name"));
                menu.setItemDescription(rs.getString("description"));
                menu.setItemPicUrl(rs.getString("pic_path"));
            }
        } catch (Exception err) {
            err.printStackTrace();
        } finally {
            Database.closeConnection();
        }

        return menu;
    }

    public static boolean updateMenuInfo(int id, String name, double price, String description) {
        // update menu
        boolean succeed = false;

        try {
            String sql = "UPDATE menu SET name=?, price=?, description=? WHERE id=?";

            int affectedRow = QueryHelper.insertUpdateDeleteQuery(sql,new Object[] {
                    name, price, description, id
            });

            if (affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }

    public static boolean deleteMenu(Integer id) {
        // delete menu
        boolean succeed = false;

        try {
            String sql = "DELETE FROM menu WHERE id=?";

            int affectedRow = QueryHelper.insertUpdateDeleteQuery(sql, new Integer[]{
                    id
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }
}
