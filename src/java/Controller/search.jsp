<%@page import="Model.CustomerCRUD"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="templates/header.html" %>
        <style>
            #searchul{
                background-color: #ffffff;
                cursor:pointer;
            }
           #searchli{
                padding:12px;
           }
        </style>
    </head>
    <body>
        <%
            String cust_name = request.getParameter("customer_name");
            ResultSet rs = new CustomerCRUD().getCustData(cust_name);
        %>
        <ul class="list-unstyled" id="searchul">
            <%
                while(rs.next())
                { %>
                    <li id="searchli"><%= rs.getString("CustName") %></li>
                <% } 
            %>
        </ul>
    </body>
</html>
