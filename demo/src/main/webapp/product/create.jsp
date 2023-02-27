<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Product</title>
    <link rel="stylesheet" href="BootStrap/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
</head>
<style>
    h2{
        text-align: center;
    }
</style>
<body>
<div class="header">
    <div class="row col-12">
        <h2 class="text-success align-content-center" >Add New Customer</h2>
    </div>
</div>
<div align="center" class="row col-12 ">
    <form method="post" >
        <input type="hidden" name="action" value="create">
        <table class="table-success  ">
            <tr class="form-group">
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="productName" size="45" />
                </td>
            </tr>
            <tr>
                <th>Price :</th>
                <td>
                    <input type="text" name="productPrice" size="15"/>
                </td>
            </tr>
            <tr>
                <th>Quantity:</th>
                <td>
                    <input type="text" name="productQuantity" size="15"/>
                </td>
                </td>
            </tr>
            <tr>
                <th>Color:</th>
                <td>
                    <input type="text" name="productColor" size="45"/>
                </td>
            </tr>
            <tr>
                <th> Category:</th>
                <td>
                    <input type="text" name="productCategory" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="create" name="action"/>
                    <button class="btn btn-danger">
                        <a href="products?action=product">Hủy</a></button>
                    <%--                    <a class="btn btn-danger" href="customers?action=customers" role="button">Back to list Customer</a>--%>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
