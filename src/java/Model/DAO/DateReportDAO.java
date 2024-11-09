/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DBUtils.DBUtils;
import Model.DTO.DateReportDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dat20
 */
public class DateReportDAO {

    public ArrayList<DateReportDTO> showReport(int reportNumber) {
        ArrayList<DateReportDTO> list = new ArrayList<>();

        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select top " + reportNumber + "CONVERT(date, order_datetime) AS [date], count([order_id]) as orderQuantity, sum([total_amount]) as totalAmount from  [dbo].[Order] where [status_id] = 4 group by CONVERT(date, order_datetime) order by [date] desc";

                PreparedStatement stm = con.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
//                        list.add(new DateReportDTO(rs.getDate(1).toLocalDate().plusDays(2), rs.getInt(2), rs.getDouble(3)));
                        list.add(new DateReportDTO(rs.getDate(1), rs.getInt(2), rs.getDouble(3)));
                        System.out.println(rs.getDate(1));
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

    public ArrayList<DateReportDTO> showReportByMonth(int month, int year) {
        ArrayList<DateReportDTO> list = new ArrayList<>();

        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select CONVERT(date, order_datetime) as [date], count([order_id]) as orderQuantity, sum([total_amount]) as totalAmount from  [dbo].[Order]  where month(order_datetime) = ? and year(order_datetime) = ? and [status_id] = 4 group by CONVERT(date, order_datetime) order by [date] desc ";
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, month);
                stm.setInt(2, year);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
//                        list.add(new DateReportDTO(rs.getDate(1).toLocalDate().plusDays(2), rs.getInt(2), rs.getDouble(3)));
                        list.add(new DateReportDTO(rs.getDate(1), rs.getInt(2), rs.getDouble(3)));

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
        System.out.println(list.size());
        return list;
    }
}
