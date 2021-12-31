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
            <h4>New Order</h4>
            <h5>Product List</h5>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="form-floating mb-3">
                                <input type="text" id="cust_name" class="form-control cust_name" placeholder="Enter Name" required/>
                                <label>Customer Name:</label>
                                <div id="names_list" class="shadow rounded"></div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="form-floating mb-3">
                                <input id="myInput" type="text" class="form-control" placeholder="Search..">
                                <label>Search....</label>
                            </div>
                        </div>
                    </div>
                    
                <div class="row">
                    <div class="col-md-8 col-xs-12">
                        <table class="table table-bordered" id="product_table">
                            <thead>
                                <tr>
                                    <th>Checkout</th>
                                    <th>Product Id</th>
                                    <th>Product Name</th>
                                    <th>Avaliable Quantity</th>
                                    <th>Selling Price (in &#8377)</th>
                                    <th>Total Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                            ResultSet rs = new dbConn().getConnection().createStatement().executeQuery("select * from product");
                            while(rs.next())
                            {%>
                            <tr>
                                <td><input type="checkbox" name="checkout" id="checkout" class="form-check-input"/></td>
                                <td><%= rs.getString("pid") %></td>
                                <td><%= rs.getString("pname") %></td>
                                <td><%= rs.getString("quantity") %></td>
                                <td><%= rs.getString("cprice") %></td>
                                <td><input type="number" id="quantity" name="quantity" min="0" max="<%= rs.getString("quantity") %>" value="0" class="form-control quantity_data"/></td>
                            </tr>
                            <%}
                        %>
                            </tbody>
                            <tfoot>
                            
                                <tr>
                            <form action="ur_servlet" method="post" id="tform">
                                    <input type="hidden" name="productlist" id="products"/>
                                    <input type="hidden" name="cust_name" id="cust_name1"/>
                                    <td colspan="2"><b>Total Cost:</b></td>
                                    <td colspan="2"><input type="text" name="total_cost" id="total_cost" class="form-control" value="0" readonly/></td>
                                    <td colspan="2"><input type="submit" id="confirm_order" name="submit" class="btn btn-success w-75" value="Confirm Order" disabled/></td>
                            </form> 
                            </tr>
                            </tfoot>
                        </table>
                            <button id="submit" class="btn btn-outline-success w-100">Submit</button>
                    </div>
                </div>
            </div>
            
        </div>
        <%@include file="templates/footer.html" %>
        <script>
                   
                    $(document).ready(function(){
                       $(".cust_name").keyup(function(){
                          var customer_name=$(this).val();
                          if(customer_name!='')
                          {
                              $.ajax({
                                 url:"search.jsp",
                                 method:"POST",
                                 data:{ customer_name: customer_name },
                                 success: function(names)
                                 {
                                     $("#names_list").fadeIn();
                                     $("#names_list").html(names);
                                 }
                              });
                          }
                          else
                          {
                              $("#names_list").fadeOut();
                              $("#names_list").html("");
                              }
                       });
                       $(document).on('click','#searchli',function(){
                              $(".cust_name").val($(this).text());
                              $("#names_list").fadeOut();
                       });
                       $("#myInput").on("keyup", function() {
                        var value = $(this).val().toLowerCase();
                        $("#product_table tbody tr").filter(function() {
                          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                        });
                      });
                    });
                </script>
        <script>
            $(function(){
               $("#submit").click(function(){
                  var total=0;
                  var data = [];
                  var products = []
                  $("#product_table tbody input[type=checkbox]:checked").each(function(){
                      var row = $(this).closest("tr")[0];
                      var data1 = $(this).closest("tr").find("td:eq(5) input[type='number']").val();
                      console.log(data1);
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
                  
                  document.getElementById("products").value=JSON.stringify(products);
                  document.getElementById("cust_name1").value=$("#cust_name").val();
                  console.log(data);
                  console.log(JSON.stringify(data));
                  $("#total_cost").val(total);
                  $("#submit").prop("hidden","true");
                  $("#confirm_order").prop('disabled',false);
                  
               });
            });
            
        </script>
    </body>
</html>