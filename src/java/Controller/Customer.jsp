<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer</title>
        <%@include file="templates/header.html" %>
    </head>
    <body id="body-pd">
        <%@include file="templates/sidebarPage.html" %>
        <!--Container Main start-->
        <div class="height-100 bg-light">
            <%
                if(request.getAttribute("insStatus")!=null)
                {
                    if((String)request.getAttribute("insStatus")=="1")
                    {
                        out.println("<script>alert('Customer Added Successfully!!');</script>");
                    }
                    else
                    {
                        out.println("<script>alert('Error in Insertion');</script>");
                    }
                }
            %>
            <h4>All Customers</h4>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#NCustomer">Add New</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="table-responsive-sm">
                            <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Mobile No.</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet rs = (ResultSet)request.getAttribute("AllCustDataObj");
                                    int i = 0;
                                    while(rs.next())
                                    {
                                        i++;
                                %>
                                <tr>
                                    <td><%= i %></td>
                                    <td><%= rs.getString("CustName") %></td>
                                    <td><%= rs.getString("Address") %></td>
                                    <td><%= rs.getString("Mobile_No") %></td>
                                    <td><%= rs.getString("Email") %></td>
                                    <td>
                                        
                                        <form action="deleteCustomer" method="post">
                                            <input type="hidden" name="custid" value="<%=rs.getString("CustId")%>"/>
                                            <input type="submit" name="submit" value="D" class="btn btn-sm btn-primary"/>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
                            <div class="modal fade" id="NCustomer" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Add Customer</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="Customer" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="name" placeholder="Enter Name" name="custname">
                            <label for="name">Name:</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="Email" class="form-control" id="email" placeholder="Enter Email" name="custemail">
                            <label for="email">Email:</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="mobile" placeholder="Enter Mobile" name="custmobileno">
                            <label for="mobile">Mobile No.:</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="Address" placeholder="Enter Address" name="custaddress">
                            <label for="Address">Address:</label>
                        </div>
                        <input type="submit" value="Submit" name="submit" class="btn btn-success"/>
                    </form>
                </div>
              </div>
            </div>
        </div>
        </div>
        <%@include file="templates/footer.html" %>
        
    </body>
</html>