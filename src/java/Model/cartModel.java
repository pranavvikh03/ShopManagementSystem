/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author KAUSTUBH
 */

public class cartModel {
    
    public static int addItem(CartBean crt, int quantity, int pid)
    {
        int i = 0;
        int billid = 0;
        try
        {
           Connection con = new dbConn().getConnection();
           
           Statement pstmt=con.createStatement();
           ResultSet rs= pstmt.executeQuery("select auto_increment from information_schema.tables where table_name = 'transaction' and table_schema = 'shopmanagementsystem'");
           while(rs.next())
           {
               billid = rs.getInt("auto_increment");
           }
           PreparedStatement ustmt=con.prepareStatement("update product set quantity = ? where pid = ?");
           ustmt.setInt(1, quantity);
           ustmt.setInt(2, pid);
           ustmt.executeUpdate();
           
           PreparedStatement stmt=con.prepareStatement("insert into cart(billid,custid,pname,quantity,totalcost) values(?,?,?,?,?)");
           stmt.setInt(1, billid);
           stmt.setInt(2, crt.getCustid());
           stmt.setString(3,crt.getPname());
           stmt.setInt(4, crt.getQuantity());
           stmt.setInt(5, crt.getTotalCost());
           //stmt.setInt(6,session.getAttribute("usname"));
           i = stmt.executeUpdate();
           
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return billid;
    }
    
    public static int addTransaction(int custid, int amount,int userid)
    {
        int i = 0;
        try
        {
           Connection con = new dbConn().getConnection();
           
           PreparedStatement qstmt=con.prepareStatement("insert into transaction(custid,billdate,amount,us_id) values(?,?,?,?)");
           qstmt.setInt(1,custid);
           qstmt.setString(2,new Date().toString());
           qstmt.setInt(3,amount);
           qstmt.setInt(4,userid);
           qstmt.executeUpdate();
           
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
           
        return i;
    }
    
    public List list(int billid) 
    {
        ArrayList list=new ArrayList();   
        try 
        {
            Connection con = new dbConn().getConnection();
            Statement stmt=con.createStatement();
            ResultSet rs= stmt.executeQuery("select * from cart where billid="+billid);
            
            while (rs.next()) 
            {
                CartBean crt=new CartBean();
                crt.setBillid(rs.getInt("billid"));
                crt.setCustid(rs.getInt("custid"));
                crt.setPname(rs.getString("pname"));
                crt.setQuantity(rs.getInt("quantity"));
                crt.setTotalCost(rs.getInt("totalcost"));
                list.add(crt);
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public List billInfo(int billid) 
    {
        ArrayList list=new ArrayList();   
        try 
        {
            Connection con = new dbConn().getConnection();
            Statement stmt=con.createStatement();
            ResultSet rs= stmt.executeQuery("select * from transaction where billid="+billid);
            
            while (rs.next()) 
            {
                CartBean crt=new CartBean();
                crt.setBillid(rs.getInt("billid"));
                crt.setCustid(rs.getInt("custid"));
                crt.setDate(rs.getString("billdate"));
                crt.setTotalCost(rs.getInt("amount"));
                list.add(crt);
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
}
