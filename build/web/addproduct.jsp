<%-- 
    Document   : addproduct
    Created on : 25 Dec, 2021, 2:10:11 PM
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
            <div class="container">
               <div class="row row-content align-items-center ">
                <div class="col-12">
                    <br>
                    <h3>Add Product</h3>
                    <hr>
                </div>
                <div class="col-12 col-md-9">
                    <form action="AddProduct" method="post">
                        
                        <div class="form-group row">
                            <label for="productid" class="col-form-label col-md-2">Product ID</label>
                            <div class="col-md-6">
                                <input type="number" class="form-control" name="productid" placeholder="Enter Product ID">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-6" id="vname"></span>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label for="productname" class="col-form-label col-md-2">Product Name</label>
                            <div class="col-md-6">
                                <input type="text" class="form-control" name="productname" placeholder="Enter Product Name">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-6" id="vname"></span>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label for="vendorid" class="col-form-label col-md-2">Vendor ID</label>
                            <div class="col-md-6">
                                <input type="number" class="form-control" name="vendorid" placeholder="Enter Vendor ID">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-6" id="vname"></span>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label for="quantity" class="col-form-label col-md-2">Quantity</label>
                            <div class="col-md-6">
                                <input type="number" class="form-control" name="quantity" placeholder="Enter Quantity">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-6" id="vname"></span>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label for="costprice" class="col-form-label col-md-2">Cost Price</label>
                            <div class="col-md-6">
                                <input type="number" class="form-control" name="costprice" placeholder="Enter Cost Price">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-6" id="vname"></span>
                        </div>
                        <br>
                        <div class="form-group row">
                            <label for="saleprice" class="col-form-label col-md-2">Sale Price</label>
                            <div class="col-md-6">
                                <input type="number" class="form-control" name="saleprice" placeholder="Enter Sale Price">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-6" id="vname"></span>
                        </div>
                        <br>
                        <div class="form-group row">
                            <div class="offset-md-2 col-md-10">
                                <input type="submit" class="btn btn-primary" value="Submit Details">
                            </div>
                            <div class="col-md-2">
                            </div>
                            <span class="col-md-10" id="vsubmit" style="color:#00ff00;"></span>
                        </div>
                        
                    </form>
                </div>
            </div> 
            </div>
            
        </div>
        
        <%@include file="templates/footer.html" %>
    </body>
</html>
