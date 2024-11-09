/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DBUtils.DBUtils;
import Model.DTO.StatusDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dat20
 */
public class StatusDAO {

    public ArrayList<StatusDTO> findAllStatus() {
        ArrayList<StatusDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [status_id],[status_name] from [dbo].[Status]";
                PreparedStatement stm = con.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new StatusDTO(rs.getInt(1), rs.getString(2)));
                    }
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
        return list;
    }

    public StatusDTO findStatus(int statusID) {
        StatusDTO status = null;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [status_id],[status_name] from [dbo].[Status] where status_id = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, statusID);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    if (rs.next()) {
                        status = new StatusDTO(rs.getInt(1), rs.getString(2));
                    }
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
        return status;
    }
}
