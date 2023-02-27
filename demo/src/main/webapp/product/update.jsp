<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2>Update Product Manager</h2>

</center>
<div align="center">
    <form method="post"  >
        <input type="hidden" name="productStt" value="<c:out value='${existingProduct.getProductId()}' />"/>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Update Product
                </h2>
            </caption>
            <tr>
                <th>Product Name:</th>
                <td>
                    <input type="text" name="productName" size="45"
                           value="<c:out value='${existingProduct.getProductName()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Price :</th>
                <td>
                    <input type="text" name="productPrice" size="15"
                           value="<c:out value='${existingProduct. getProductPrice()}' />"/>
                </td>
            </tr>
            <tr>
                <th>Quantity:</th>
                <td>
                    <input type="text" name="productQuantity" size="15"
                           value="<c:out value='${existingProduct.getProductQuantity()}' />"/>
                </td>
                </td>
            </tr>
            <tr>
                <th>Color:</th>
                <td>
                    <input type="text" name="productColor" size="45"
                           value="<c:out value='${existingProduct.getProductColor()}' />"
                    />
                </td>
            </tr>
            <tr>
                <th> Category:</th>
                <td>
                    <input type="text" name="productCategory" size="45"
                           value="<c:out value='${existingProduct.getProductCategory()}' />"
                    />
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="update" />
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
