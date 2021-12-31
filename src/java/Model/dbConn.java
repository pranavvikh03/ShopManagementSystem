/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.*;

public class dbConn {
    public Connection getConnection()
    {
        Connection con=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopmanagementsystem?characterEncoding=latin1&useConfigs=maxPerformance","root","");
        }
        catch(SQLException se)
        {
            System.out.println("SQL Exception:"+se);
        }
        catch(Exception e)
        {
            System.out.println("Exception Occured:"+e);
        }
        return con;
    }
}
