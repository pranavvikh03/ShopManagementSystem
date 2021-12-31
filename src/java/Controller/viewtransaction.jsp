<%-- 
    Document   : viewtransaction
    Created on : 31 Dec, 2021, 6:55:02 AM
    Author     : KAUSTUBH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Model.dbConn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>New Order</title>
        <%@include file="templates/header.html" %>
        <style>
            tr,th{
                vertical-align: middle;
                text-align: center;
            };
        </style>
    </head>
    <body id="body-pd">
        <%@include file="templates/sidebarPage.html" %>
        <!--Container Main start-->
        <div class="height-100 bg-light">
            <br>
            <h4>Transaction List</h4><hr>
            <br><br>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <table class="table table-bordered" id="product_table">
                            <thead>
                                <tr>
                                    <th>Bill Id</th>
                                    <th>Customer ID</th>
                                    <th>Billing Date</th>
                                    <th>Total (in &#8377)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

//                            int userid = Integer.parseInt((String)session.getAttribute("us_id"));
                            int userid=1;
                            ResultSet rs = new dbConn().getConnection().createStatement().executeQuery("select * from transaction where us_id="+userid);
                            int total=0;
                            while(rs.next())
                            {%>
                            <tr>
                                <td><%= rs.getString("billid") %></td>
                                <td><%= rs.getString("custid") %></td>
                                <td><%= rs.getString("billdate") %></td>
                                <td><%= rs.getString("amount") %></td>
                                <%total+= Integer.parseInt(rs.getString("amount"));%>
                            </tr>
                            <%}
                            %>
                            </tbody>
                        </table>
                            
                            
                    </div>
                </div>
                <div class="form-group row">
                    <label for="totalCost" class="col-form-label col-md-2">Total Revenue(in &#8377)</label>
                    <div class="col-md-4" style="display:inline-block">
                        <input type="number" class="form-control" name="totalCost" id="totalCost" value="<%=total%>" readonly>
                    </div>
                </div>
            </div>
            
        </div>
        <%@include file="templates/footer.html" %>
        <script>
            $(function(){
               $("#submit").click(function(){
                  var total=0;
                  var data = [];
                  var products = [];
                  
                  $("#product_table tbody input[type=checkbox]:checked").each(function(){
                      var row = $(this).closest("tr")[0];
                      //console.log(row);
                      var data1 = $(this).closest("tr").find("td:eq(5) input[type='number']").val();
                      //console.log(data1);
                      let temp = parseInt(row.cells[4].innerHTML) *  parseInt(data1);
                      total += temp;
                      products.push({
                         "Product_id":row.cells[1].innerHTML,
                         "Product_name": row.cells[2].innerHTML,
                         "total_quantity": row.cells[3].innerHTML,
                         "Product_price": parseInt(row.cells[4].innerHTML),
                         "Quantity_buyed": parseInt(data1),
                         "total_cost": temp 
                      });
                  });
                  data['Product_buyed'] = products;
                  data['Total']=total;
                  //console.log(products);
                  document.getElementById("productlist").value=JSON.stringify(products);
                  document.getElementById("totalCost").value=total;
                  document.getElementById("seek1").style.display='inline';
                  document.getElementById("seek2").style.display='inline';
                  document.getElementById("totalCost").readOnly = true;
                  //document.getElementById("tform").submit();
                  //console.log(document.getElementById("totalCount").value)
                  //$.ajax({
                    //    url: "ur_servlet",
                      //  type: "POST",
                        //data: { totalPrice : total }
                    //});
               });
               $(".quantity_data").keyup(function(){
                  var d = parseInt($(this).val());
                  var r = $(this).parents("tr")[0];
                  var a = parseInt(r.cells[2].innerHTML);
//                  alert(d);
//                  alert(a);
                  if(d>a)
                  {
                      alert("Quantity Not Available");
                      return false;
                  }
                  else
                      return true;
               });
            });
            
        </script>
    </body>
</html>
