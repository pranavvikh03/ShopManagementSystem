<%-- 
    Document   : billreceipt
    Created on : 30 Dec, 2021, 11:55:38 AM
    Author     : KAUSTUBH
--%>

<%@page import="Model.CartBean"%>
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
        <script>
            function printDiv() {
                var divContents = document.getElementById("printbill").innerHTML;
                var a = window.open('', '', 'height=500, width=500');
                
                a.document.write('<html>');
                a.document.write('<head>');
                a.document.write('<meta charset="UTF-8">');
                a.document.write('<meta name="viewport" content="width=device-width, initial-scale=1.0">');
                a.document.write('<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">');
                a.document.write('<link href="CSS/sidebar.css" rel="stylesheet"/>');
                a.document.write('<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"/>');
                a.document.write(divContents);
                a.document.write('</body></html>');
                a.document.close();
                a.print();
            }
        </script>
    </head>
    <body id="body-pd">
        <%@include file="templates/sidebarPage.html" %>
        <div class="height-100 bg-light">
            <h4>Order Confirmed</h4>
            <br>
            <div class="container">
                
                <div class="row row-content align-items-center" id="printbill">
                    <div class="col-12 col-md-10">
                        <div class="card">
                            <h3 class="card-header bg-primary text-white">Bill Receipt</h3>
                            <div class="card-body">
                                <dl class="row">
                                    <%
                                        List info=ServletUtility.getBillInfo(request);
                                        Iterator it_=info.iterator();
                                        while(it_.hasNext()){
                                        CartBean crt=(CartBean)it_.next();
                                    %>
                                    <dt class="col-6">Bill Id</dt>
                                    <dd class="col-6"><%= crt.getBillid()%></dd>
                                    <dt class="col-6">Customer ID</dt>
                                    <dd class="col-6"><%= crt.getCustid()%></dd>
                                    <dt class="col-6">Billing Date</dt>
                                    <dd class="col-6"><%= crt.getDate()%></dd>
                                    <dt class="col-6">Bill Amount(in &#8377)</dt>
                                    <dd class="col-6">&#8377 <%= crt.getTotalCost()%></dd>
                                    <%}%>
                                </dl>
                            </div>
                            <hr>
                            <div class="offset-md-1 col-sm-10">
                                <table class="table table-bordered table-responsive-sm">
                                    <thead>
                                        <tr>
                                            <th>Sr. No.</th>
                                            <th>Product Name</th>
                                            <th>Quantity</th>
                                            <th>Unit Price</th>
                                            <th>Total Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            int i=1;
                                            List list=ServletUtility.getItems(request);
                                            Iterator it=list.iterator();
                                            while(it.hasNext()){
                                            CartBean crt=(CartBean)it.next();
                                        %>
                                          <tr>
                                            <td><%=i%></td>
                                            <td><%= crt.getPname()%></td>
                                            <td><%= crt.getQuantity()%></td>
                                            <td><%= crt.getTotalCost()/crt.getQuantity()%></td>
                                            <td><%= crt.getTotalCost()%></td>
                                            <% i=i+1;%>
                                          </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                            
                        </div>
                                    
                    </div>
                </div>
        
                <br>
                <div class="row">
                    <div class="col-12"><input type="button" class="btn btn-danger" onclick="printDiv()" value="Print Bill"></div>        
                </div>
                
            </div>
            
        </div>
        
        <%@include file="templates/footer.html" %>
    </body>
</html>
