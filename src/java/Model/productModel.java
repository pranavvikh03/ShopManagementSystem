/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author KAUSTUBH
 */

public class productModel {
    
    public static int addProduct(ProductBean prod)
    {
        int i = 0;
        try
        {
           Connection con = new dbConn().getConnection();
           PreparedStatement stmt=con.prepareStatement("insert into product values(?,?,?,?,?,?)");
           stmt.setInt(1, prod.getPid());
           stmt.setString(2,prod.getPname());
           stmt.setInt(3, prod.getVid());
           stmt.setInt(4, prod.getQuantity());
           stmt.setInt(5, prod.getCprice());
           stmt.setInt(6, prod.getSprice());
           i = stmt.executeUpdate();
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        
        return i;
    }
    
    public static int updateProduct(ProductBean prod)
    {
        int i = 0;
        try
        {
           Connection con = new dbConn().getConnection();
           PreparedStatement stmt=con.prepareStatement("update product set vid=?,quantity=?,cprice=?,sprice=? where pid=?");
           
           stmt.setInt(1, prod.getVid());
           stmt.setInt(2, prod.getQuantity());
           stmt.setInt(3, prod.getCprice());
           stmt.setInt(4, prod.getSprice());
           stmt.setInt(5, prod.getPid());
           i = stmt.executeUpdate();
        }
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        
        return i;
    }
    
    
    public static List list() 
    {
        ArrayList list=new ArrayList();   
        try 
        {
            Connection con = new dbConn().getConnection();
            Statement stmt=con.createStatement();
            ResultSet rs= stmt.executeQuery("select * from product");
            
            while (rs.next()) 
            {
                ProductBean prod=new ProductBean();
                prod.setPid(rs.getInt("pid"));
                prod.setPname(rs.getString("pname"));
                prod.setVid(rs.getInt("vid"));
                prod.setQuantity(rs.getInt("quantity"));
                prod.setCprice(rs.getInt("cprice"));
                prod.setSprice(rs.getInt("sprice"));
                list.add(prod);
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<String> productNameList(String query) 
    {
	query = query.toLowerCase();
	List<String> matched = new ArrayList<String>();
        
	try 
        {
            Connection con = new dbConn().getConnection();
            Statement stmt=con.createStatement();
            ResultSet rs= stmt.executeQuery("select pname from product where lower(pname) like '"+query+"%'");
            
            while (rs.next()) 
            {
                ProductBean prod=new ProductBean();
                matched.add(rs.getString("pname"));
            }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
        
	return matched;
    }
    
}
