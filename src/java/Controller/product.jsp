`<%-- 
    Document   : product
    Created on : 21 Nov, 2021, 10:53:47 AM
    Author     : KAUSTUBH
--%>

<%@page import="Model.ProductBean"%>
<%@page import="Controller.ServletUtility"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Products</title>
        <%@include file="templates/header.html" %>
    </head>
    <body id="body-pd">
        <%@include file="templates/sidebarPage.html" %>
        <div class="height-100 bg-light">
            <h4>All Products</h4>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 style="color: red;"><%=ServletUtility.getErrorMessage(request)%></h4>
                        <h4 style="color: green;"><%=ServletUtility.getSuccessMessage(request)%></h4>
                        <table class="table table-bordered table-responsive-sm">
                            <thead>
                                <tr>
                                    <th>P. ID</th>
                                    <th>Product Name</th>
                                    <th>Vendor ID</th>
                                    <th>Quantity</th>
                                    <th>Cost Price</th>
                                    <th>Sale Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                List list=ServletUtility.getList(request);
                                Iterator it=list.iterator();
                                while(it.hasNext()){
                                ProductBean prod=(ProductBean)it.next();
                            %>
                              <tr>
                                <td><%=prod.getPid()%></td>
                                <td><%=prod.getPname()%></td>
                                <td><%=prod.getVid()%></td>
                                <td><%=prod.getQuantity()%></td>
                                <td><%=prod.getCprice()%></td>
                                <td><%=prod.getSprice()%></td>
                                <td>
                                    <form action="editproduct.jsp" method="post">
                                        <input type="hidden" name="pid" value="<%= prod.getPid()%>">
                                        <input type="hidden" name="pname" value="<%= prod.getPname()%>">
                                        <input type="hidden" name="quantity" value="<%= prod.getQuantity()%>">
                                        <input type="hidden" name="vid" value="<%= prod.getVid()%>">
                                        <input type="hidden" name="cprice" value="<%= prod.getCprice()%>">
                                        <input type="hidden" name="sprice" value="<%= prod.getSprice()%>">
                                        <input type="submit" class="btn btn-danger" value="Edit">
                                    </form>
                                </td>
                              </tr>
                            <%} %>
                            
                            </tbody>
                        </table>
                        
                    </div>
                </div>
                <a href="addproduct.jsp" class="btn btn-primary" role="button">Add Product</a>
            </div>
            
        </div>
        
        <%@include file="templates/footer.html" %>
    </body>
</html>
