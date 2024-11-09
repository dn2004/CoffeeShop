/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DBUtils.DBUtils;
import Model.DTO.OrderDetailDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dat20
 */
public class OrderDetailDAO {

    public ArrayList<OrderDetailDTO> getDetail(int orderID) {
        ArrayList<OrderDetailDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [order_detail_id],[order_id],[name_at_time],[price_at_time],[quantity], [Note] from [dbo].[order_detail] where [order_id] = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, orderID);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new OrderDetailDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(6), rs.getDouble(4), rs.getInt(5)));
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

    public int createDetail(int orderID, String productName, double productPrice, int quantity) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "insert into [dbo].[Order_Item] ([order_id],[name_at_time],[price_at_time],[quantity]) values (?,?,?,?)";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, orderID);
                stm.setString(2, productName);
                stm.setDouble(3, productPrice);
                stm.setInt(4, quantity);
                result = stm.executeUpdate();
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
        return result;
    }
    public int createDetail(int orderID, String productName, double productPrice, int quantity, String note) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "insert into [dbo].[Order_Item] ([order_id],[name_at_time],[price_at_time],[quantity],[Note]) values (?,?,?,?,?)";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, orderID);
                stm.setString(2, productName);
                stm.setDouble(3, productPrice);
                stm.setInt(4, quantity);
                stm.setString(5, note);
                result = stm.executeUpdate();
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
        return result;
    }
}
