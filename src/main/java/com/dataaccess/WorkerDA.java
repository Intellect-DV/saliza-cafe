package com.dataaccess;

import com.helper.QueryHelper;
import com.model.Worker;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class WorkerDA {

    // check username if existed in database
    public static Worker isUsernameExisted(String username) {
        Worker worker = new Worker();

        try {
            String sql = "SELECT id FROM worker WHERE username=?";
            ResultSet rs = QueryHelper.getResultSet(sql, new String[]{username});

            worker.setValid(rs.next()); rs.close();
        } catch (SQLException err) {
            err.printStackTrace();
        }

        return worker;
    }

    public static boolean createWorker(Worker worker, int managerId) {
        boolean succeed = false;

        try {
            String sql = "INSERT INTO worker (username, password, name, email, manager_id) VALUES (?,?,?,?,?)";

            Object[] obj = new Object[] {
                worker.getWorkerUsername(),
                worker.getWorkerPassword(),
                worker.getWorkerName(),
                worker.getWorkerEmail(),
                managerId
            };

            int rowAffected = QueryHelper.insertUpdateQuery(sql,obj) ;
            if(rowAffected == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }

    public static Worker retrieveWorker(String username, String password) {
        Worker worker = new Worker();

        try {
            // COALESCE = NVL in oracle
            String sql = "SELECT id, name, email, COALESCE(manager_id,-1) AS manager_id FROM worker WHERE username=? AND password=?";

            ResultSet rs = QueryHelper.getResultSet(sql, new String[] {username, password});

            if(rs.next()) {
                String name, email, managerId;
                int id = rs.getInt("id");
                name = rs.getString("name");
                email = rs.getString("email");
                managerId = rs.getString("manager_id");

                worker.setWorker(id,username,name,email,managerId); worker.setValid(true);
            } else {
                worker.setValid(false);
            }
            rs.close();
        } catch (SQLException err) {
            err.printStackTrace();
        }

        return worker;
    }

    public static boolean updateWorkerProfile(Worker updateWorker, int id) {
        boolean succeed = false;
        try {
            String sql = "UPDATE worker set username=?, name=?, email=? WHERE id=?";

            int affectedRow  = QueryHelper.insertUpdateQuery(sql,new Object[]{
                    updateWorker.getWorkerUsername(),
                    updateWorker.getWorkerName(),
                    updateWorker.getWorkerEmail(),
                    id
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }

    public static boolean updateWorkerPassword(String newPassword, int id) {
        boolean succeed = false;
        try{
            String sql = "UPDATE worker set password=? WHERE id=?";

            int affectedRow = QueryHelper.insertUpdateQuery(sql, new Object[]{
                newPassword,
                id
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return  succeed;
    }
}
