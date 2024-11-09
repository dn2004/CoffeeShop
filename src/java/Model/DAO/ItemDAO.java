/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DTO.ItemDTO;
import java.util.ArrayList;
import Model.DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author dat20
 */
public class ItemDAO {

    public ArrayList<ItemDTO> findAllItems() {
        ArrayList<ItemDTO> list = new ArrayList<>();
            Connection con = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item]";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            ItemDTO item = null;
            if (rs != null) {
                while (rs.next()) {
                    item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
                    list.add(item);
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

    public ArrayList<ItemDTO> findItems(int kindId, boolean isAvailable) {
        ArrayList<ItemDTO> list = new ArrayList<>();
            Connection con = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item] where [kind_id] = ? and [available] = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, kindId);
            stm.setBoolean(2, isAvailable);
            ResultSet rs = stm.executeQuery();
            ItemDTO item = null;
            if (rs != null) {
                while (rs.next()) {
                    item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
                    list.add(item);
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

    public ArrayList<ItemDTO> findItems(String search,int kindId, boolean isAvailable) {
        ArrayList<ItemDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item] where  [name] like ? and [available] = ? and [kind_id] = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + search + "%");
            stm.setBoolean(2, isAvailable);
            stm.setInt(3, kindId);
            ResultSet rs = stm.executeQuery();
            ItemDTO item = null;
            if (rs != null) {
                while (rs.next()) {
                    item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
                    list.add(item);
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

    public ArrayList<ItemDTO> findItems(boolean isAvailable) {
        ArrayList<ItemDTO> list = new ArrayList<>();
            Connection con = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item] where [available] = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setBoolean(1, isAvailable);
            ResultSet rs = stm.executeQuery();
            ItemDTO item = null;
            if (rs != null) {
                while (rs.next()) {
                    item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
                    list.add(item);
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

    public ArrayList<ItemDTO> findItems(int kindId) {
        ArrayList<ItemDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item] where [kind_id] = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, kindId);
            ResultSet rs = stm.executeQuery();
            ItemDTO item = null;
            if (rs != null) {
                while (rs.next()) {
                    item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
                    list.add(item);
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

    public ItemDTO findItem(int id) {
        Connection con = null;
        ItemDTO item = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item] where  [id] = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    if (rs.next()) {
                        item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
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
        return item;
    }
    
    public ItemDTO findItem(int id, boolean isAvailable) {
        Connection con = null;
        ItemDTO item = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select [id], [name], [image], [price], [available], [kind_id] from [dbo].[Item] where  [id] = ? and [available] = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.setBoolean(2, isAvailable);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    if (rs.next()) {
                        item = new ItemDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
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
        return item;
    }

    public int updateItemServlet(String name, double price, int kindID, boolean isAvailable, String image, int itemID) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "update [dbo].[Item] set [name] = ?, [image] = ?, [price] = ?, [available] = ?, [kind_id] = ?  where id = ?";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, image);
                stm.setDouble(3, price);
                stm.setBoolean(4, isAvailable);
                stm.setInt(5, kindID);
                stm.setInt(6, itemID);
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

    public int addItem(String name, String image, double price, boolean status, int kindId) {
        int result = 0;
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "insert into Item ([name],[image],[price],[available],[kind_id]) values (?, ?, ?, ?, ?)";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, image);
                stm.setDouble(3, price);
                stm.setBoolean(4, status);
                stm.setInt(5, kindId);
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
