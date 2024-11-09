/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model.DAO;

import Model.DBUtils.DBUtils;
import Model.DTO.MonthReportDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author dat20
 */
public class MonthReportDAO {

    public ArrayList<MonthReportDTO> showReport(int reportNumber) {
        ArrayList<MonthReportDTO> list = new ArrayList<>();
        Connection con = null;
        try {
            con = DBUtils.makeConnection();
            if (con != null) {
                String sql = "select  top "+ reportNumber +" month([order_datetime]) as [Month], year([order_datetime]) as [Year], count([order_id]) as orderQuantity, sum([total_amount]) as totalAmount from [dbo].[Order] where [status_id] = 4 group by month([order_datetime]) , year([order_datetime]) order by year([order_datetime]) desc,month([order_datetime]) desc";
                PreparedStatement stm = con.prepareStatement(sql);
                ResultSet rs = stm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        list.add(new MonthReportDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4)));
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
    
}
