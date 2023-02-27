<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Management Product</title>

    <link rel="stylesheet" href="BootStrap/bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">

</head>
<style>

    table.table.table-striped {
        width: 100%;
    }

    input.form-control.rounded {
        width: 30%;
        display: inline-block;
    }

    button.btn.btn-primary {
        position: absolute;
    }

    h2.fw-bold {
        width: 30%;
        float: left;
        margin-right: 470px;
    }

    .row.searchID {
        width: 100%;
        display: block;
    }

    img {
        /* width: 100px; */
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }

    input[type="checkbox"] {
        color: #f2f2f2;
        text-align: right;
        display: inline-block;
        width: 50px;
        height: 25px;
        margin: -2px 10px 0 0;
        vertical-align: middle;
    }
</style>
<body>

<div class="row">
    <div class="col-5">
    </div>
    <div class="col-3 ">
        <a href="http://localhost:8085/" class="header_logo">
            <img src="CSS_HomePage/img/Logo_furama.jpg" class="img-fluid" style="" alt="logo" width="50%" height="25px">
        </a>
    </div>
    <div class="col-4" x>
        <h2 style="padding-top: 140px" class="img-fluid" width="100%">
            <a href="/products?action=create" class="btn btn-success"><img src="/CSS_HomePage/img/addCustomer.jpg"></i>
                Add new Product</a>
        </h2>
        <div class="row searchID">
            <form action="/products" method="get" class="form-inline">
                <input type="text" class="form-control rounded " name="search" placeholder="Search" aria-label="Search"
                       aria-describedby="search-addon"/>
                <button type="submit" class="btn btn-primary">Search</button>
            </form>
        </div>
    </div>
</div>
</div>

<form action="products" method="get">
    <input type="hidden" name="action" value="deleteAll">

    <table class="table table-striped" id="example">
        <caption style="caption-side: top">
            <h2 class="fw-bold">List Of Product
            </h2>
        </caption>
        <tr>
            <th>STT</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>Category</th>
            <th>Actions</th>
        </tr>
        <c:forEach items="${productList}" var="product">
        <tr>
            <td><c:out value="${product.getProductId()}"></c:out></td>
            <td><c:out value="${product.getProductName()}"></c:out></td>
            <td><c:out value="${product.getProductPrice()}"></c:out></td>
            <td><c:out value="${product.getProductQuantity()}"></c:out></td>
            <td><c:out value="${product.getProductColor()}"></c:out></td>
            <td><c:out value="${product.getProductCategory()}"></c:out></td>
            <td>
                    <%--                <a href="/customers?action=update&id=${customer.getCustomerId()} "class="btn btn-info">Update</a>--%>
                <button type="button" class="btn btn-info" data-bs-toggle="modal"
                        data-bs-target="#updateModal${product.getProductId()}">
                    Update
                </button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteModal${product.getProductId()}">
                    Delete
                </button>
            </td>

            <!-- Modal Delete -->
            <div class="modal fade" id="deleteModal${product.getProductId()}" data-bs-backdrop="static"
                 data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Delete ? </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to delete <strong class="text-danger">${product.getProductName()}</strong>?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a href="/products?action=delete&id=${product.getProductId()}">
                                <button type="button" class="btn btn-warning">Confirm</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Update -->
            <div class="modal fade" id="updateModal${product.getProductId()}" data-bs-backdrop="static"
                 data-bs-keyboard="false" tabindex="-1"
                 aria-labelledby="staticBackdropLabelUpdate" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabelUpdate">Update ? </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Are you sure you want to update it?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <a href="/products?action=update&id=${product.getProductId()}">
                                <button type="button" class="btn btn-warning">Confirm</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
    </table>
</form>

<script src="/BootStrap/bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.min.js"></script>
<script src="/BootStrap/bootstrap-5.3.0-alpha1-dist/js/bootstrap.js"></script>
<script src="/BootStrap/bootstrap-5.3.0-alpha1-dist/js/bootstrap.esm.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</body>
</html>
