package Model;

import java.sql.*;

public class CustomerCRUD {
    
    public ResultSet fetchCustomers() throws SQLException
    {
        return new dbConn().getConnection().createStatement().executeQuery("select * from customers");
    }
    public boolean addCustomers(String name, String email, String mobile_no, String address) throws SQLException
    {
        Connection con = new dbConn().getConnection();
        PreparedStatement pd = con.prepareStatement("insert into customers (CustName, Address, Mobile_No, Email) values(?,?,?,?)");
        pd.setString(1, name);
        pd.setString(2, address);
        pd.setString(3, mobile_no);
        pd.setString(4, email);
        if(pd.executeUpdate()>0)
        {
            return true;
        }
        return false;
    }
    public ResultSet getCustData(String cust_name) throws SQLException
    {
        return new dbConn().getConnection().createStatement().executeQuery("select distinct CustName from customers where CustName LIKE '%"+cust_name+"%'");
    }
}
