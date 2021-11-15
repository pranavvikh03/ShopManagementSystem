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
            <h4>All Customers</h4>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <table class="table table-bordered table-responsive-sm">
                            <thead>
                                <tr>
                                    <th>Sr. No.</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Email</th>
                                    <th>Mobile No.</th>
                                    <th><button class="btn btn-sm btn-block">U</button><button class="btn btn-sm btn-primary">D</button></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Pranav Vikharankar</td>
                                    <td>Bhakshi Road, Satana</td>
                                    <td>pranavvikh03@gmail.com</td>
                                    <td>+91 8888939839</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="templates/footer.html" %>
    </body>
</html>