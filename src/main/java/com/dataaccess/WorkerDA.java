package com.dataaccess;

import com.connection.Database;
import com.helper.QueryHelper;
import com.model.Worker;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class WorkerDA {

    // check username if existed in database
    public static Worker isUsernameExisted(String username) {
        Worker worker = new Worker();

        try {
            String sql = "SELECT workerid FROM worker WHERE username=?";
            ResultSet rs = QueryHelper.getResultSet(sql, new String[]{username});

            worker.setValid(rs.next()); rs.close();
        } catch (SQLException err) {
            err.printStackTrace();
        } finally {
            Database.closeConnection();
        }

        return worker;
    }

    public static boolean createWorker(Worker worker, int managerId) {
        boolean succeed = false;

        try {
            String sql = "INSERT INTO worker (username, password, workername, workeremail, managerid) VALUES (?,?,?,?,?)";

            Object[] obj = new Object[] {
                worker.getWorkerUsername(),
                worker.getWorkerPassword(),
                worker.getWorkerName(),
                worker.getWorkerEmail(),
                managerId
            };

            int rowAffected = QueryHelper.insertUpdateDeleteQuery(sql,obj) ;
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
            String sql = "SELECT workerid, workername, workeremail, COALESCE(managerid,-1) AS managerid FROM worker WHERE username=? AND password=?";

            if(Database.getType().equals("oracle")) {
                sql = "SELECT workerid, workername, workeremail, NVL(to_char(managerid),-1) AS managerid FROM worker WHERE username=? AND password=?";
            }

            ResultSet rs = QueryHelper.getResultSet(sql, new String[] {username, password});

            if(rs.next()) {
                String name, email;
                int id, managerId;
                id = rs.getInt("workerid");
                name = rs.getString("workername");
                email = rs.getString("workeremail");
                managerId = rs.getInt("managerid");

                worker.setWorker(id,username,name,email,managerId); worker.setValid(true);
            } else {
                worker.setValid(false);
            }
            rs.close();
        } catch (SQLException err) {
            err.printStackTrace();
        } finally {
            Database.closeConnection();
        }

        return worker;
    }

    public static ArrayList<Worker> retrieveAllWorkerBelowManager(int id) {
        ArrayList<Worker> workers = new ArrayList<>();

        try {
            String sql = "SELECT workerid, username, workername, workeremail FROM worker WHERE managerid=? ORDER BY workerid ASC";

            ResultSet rs = QueryHelper.getResultSet(sql,new Integer[]{
                    id
            });

            if(rs != null) {
                while(rs.next()) {
                    Worker temp = new Worker();
                    temp.setWorkerId(rs.getInt("workerid"));
                    temp.setWorkerUsername(rs.getString("username"));
                    temp.setWorkerName(rs.getString("workername"));
                    temp.setWorkerEmail(rs.getString("workeremail"));

                    workers.add(temp);
                }
            }
        } catch (Exception err) {
            err.printStackTrace();
        } finally {
            Database.closeConnection();
        }

        return workers;
    }

    public static boolean updateWorkerProfile(Worker updateWorker, int id) {
        boolean succeed = false;
        try {
            String sql = "UPDATE worker set username=?, workername=?, workeremail=? WHERE workerid=?";

            int affectedRow  = QueryHelper.insertUpdateDeleteQuery(sql,new Object[]{
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
            String sql = "UPDATE worker set password=? WHERE workerid=?";

            int affectedRow = QueryHelper.insertUpdateDeleteQuery(sql, new Object[]{
                newPassword,
                id
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return  succeed;
    }

    public static boolean deleteWorker(int id) {
        boolean succeed = false;
        try{
            String sql = "DELETE FROM worker WHERE workerid=?";

            int affectedRow = QueryHelper.insertUpdateDeleteQuery(sql, new Integer[] {
                    id
            });

            if(affectedRow == 1) succeed = true;
        } catch (Exception err) {
            err.printStackTrace();
        }

        return succeed;
    }
}
