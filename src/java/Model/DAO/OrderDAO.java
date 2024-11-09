/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DBUtils.DBUtils;
import Model.DTO.Detail;
import Model.DTO.ItemDTO;
import Model.DTO.OrderDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author dat20
 */
public class OrderDAO {
    
    public int insertOrder(String customerName, int tableNumber, String customerNumber, double totalAmount, HashMap<ItemDTO, Detail> cart) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                con.setAutoCommit(false);
                con = DBUtils.makeConnection();
                String sql = "insert into [dbo].[Order] ([customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id]) values (?,?,?,?,?,?)";
                PreparedStatement stm = con.prepareStatement(sql);
                Timestamp orderDate = Timestamp.from(Instant.now());
                stm.setString(1, customerName);
                stm.setInt(2, tableNumber);
                stm.setString(3, customerNumber);
                stm.setTimestamp(4, orderDate);
                stm.setDouble(5, totalAmount);
                stm.setInt(6, 1);
                result = stm.executeUpdate();
                if (result > 0) {
                    // lay order id vua chen o tren
                    sql = "select top 1 [order_id] from [dbo].[Order] order by [order_id] desc";
                    stm = con.prepareStatement(sql);
                    ResultSet table = stm.executeQuery();
                    if (table != null && table.next()) {
                        int orderid = table.getInt("order_id");
                        for (ItemDTO it : cart.keySet()) {
                            String itemName = it.getName();
                            int quantity = cart.get(it).getQuantity();
                            String note = cart.get(it).getNote();
                            sql = "insert [dbo].[order_detail] ([order_id], [name_at_time], [price_at_time], [quantity], [note]) values (?,?,?,?,?)";
                            stm = con.prepareStatement(sql);
                            stm.setInt(1, orderid);
                            stm.setString(2, itemName);
                            stm.setDouble(3, quantity * it.getPrice());
                            stm.setInt(4, quantity);
                            stm.setString(5, note);
                            if (stm.executeUpdate() > 0) {
                                result = orderid; //Nếu stm.executeUpdate() > 0 -> cho result là giá trị OrderID
                            }
                        }
                    }
                }
                if (result > 0) {
                    con.commit();
                }
                con.setAutoCommit(true);
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

    public ArrayList<OrderDTO> showOrderByPhone(String phoneNumber, boolean isReversedOrder) {
        ArrayList<OrderDTO> list = new ArrayList<>();
        String sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where [customer_number] = ?";

        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                if (isReversedOrder == true) {
                    sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where [customer_number] = ? order by [order_id] desc";
                }
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, phoneNumber);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6), rs.getInt(7)));
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

    public OrderDTO findOrder(int id) {
        OrderDTO order = null;
        
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where [order_id] = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        order = new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5), rs.getDouble(6), rs.getInt(7));
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
        return order;
    }

    public ArrayList<OrderDTO> completedOrders(Date orederDate) {
        ArrayList<OrderDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where cast([order_datetime] as date) = ? and [status_id] = 4";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setDate(1, orederDate);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5), rs.getDouble(6), rs.getInt(7)));
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

    public ArrayList<OrderDTO> incompletedOrders(Date orederDate) {
        ArrayList<OrderDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where cast([order_datetime] as date) = ? and [status_id] != 4 order by [status_id]";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setDate(1, orederDate);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5), rs.getDouble(6), rs.getInt(7)));
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

    public ArrayList<OrderDTO> manageOrders(Date orederDate, int statusID) {
        ArrayList<OrderDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where CONVERT(date, order_datetime) = ? and [status_id] = ? order by [order_id]";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setDate(1, orederDate);
                stm.setInt(2, statusID);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5), rs.getDouble(6), rs.getInt(7)));
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

    public ArrayList<OrderDTO> showOrder(int statusID) {
        ArrayList<OrderDTO> list = new ArrayList<>();

        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [order_id],[customer_name],[table_number],[customer_number],[order_datetime],[total_amount],[status_id] from [dbo].[Order] where [status_id] = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, statusID);
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new OrderDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getTimestamp(5), rs.getInt(6), rs.getInt(7)));
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

    public int updateStatusId(int statusID, int orderID) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "update [Order] set status_id = ? where order_id = ? ";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, statusID);
                stm.setInt(2, orderID);
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
