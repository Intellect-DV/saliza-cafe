package com.dataacess;

import com.helper.QueryHelper;
import com.model.Worker;

public abstract class WorkerDA {

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

    public static void retrieveWorker() {

    }

    public static void updateWorker() {

    }
}
