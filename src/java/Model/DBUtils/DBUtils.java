/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hoa Doan
 */
public class DBUtils {
//    Do not change this code

    public static Connection makeConnection() throws Exception {
        Connection cn=null;
        String IP="localhost";
        String instanceName="SAIKYOU";
        String port="1433";
        String uid="sa";
        String pwd="12345";
        String db="CoffeeShop";
        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String url="jdbc:sqlserver://" +IP+"\\"+ instanceName+":"+port
                 +";databasename="+db+";user="+uid+";password="+pwd;
        Class.forName(driver);
        cn=DriverManager.getConnection(url);
        return cn;

//cho cloud

//        Connection cn = null;
//
//        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//        String url = "jdbc:sqlserver://nopcommerce-server.database.windows.net:1433;database=CoffeeShopProject;user=nopadmin@nopcommerce-server;password=abc@1234;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
//        Class.forName(driver);
//        cn = DriverManager.getConnection(url);
//        return cn;
    }
}
