/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DBUtils.DBUtils;
import Model.DTO.ManagerAccountDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author dat20
 */
public class ManagerAccountDAO {

    public ManagerAccountDTO login(String username, String password) {
        ManagerAccountDTO account = null;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [account_id],[username],[password],[email],[gender],[phone],[image],[created_at],[status] from [dbo].[Manager_Account] where [username] = ? and [password] = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                ResultSet rs = stm.executeQuery();
                if (rs != null) 
                    if (rs.next()) {
                        account = new ManagerAccountDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getTimestamp(8), rs.getInt(9));
                    }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != con) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return account;
    }
}
