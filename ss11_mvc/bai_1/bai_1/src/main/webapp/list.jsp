<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/28/2023
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--nhúng jstl vào html:--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h1 style="text-align: center">Danh sách sản phẩm</h1>
<br>
<table class="table table-striped">
    <thead>
    <tr>
        <th>#</th>
        <th>Mã sản phẩm</th>
        <th>Tên sản phẩm</th>
        <th>Giá sản phẩm</th>
        <th>Mô tả của sản phẩm</th>
        <th>Nhà sản xuất</th>
        <th>Chức Năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${product}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <th colspan="2">
                <button type="button" class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#updateModal${product.id}">
                   Sửa
                </button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal${product.id}">
                    Xóa
                </button>
            </th>
        </tr>
        <div class="modal fade" id="deleteModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Xóa sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có muốn xóa sản phẩm ${product.name} ngày không ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary" onclick="window.location.href='/product?action=delete&id=${product.getId()}'">YES</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="updateModal${product.id}" tabindex="-1" aria-labelledby="update" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update">Chỉnh sửa sản phẩm</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chỉnh sửa sản phẩm ${product.name} này không ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary" onclick="window.location.href='/product?action=update&id=${product.getId()}'">YES</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    <tr>
        <td>
            <button class="btn btn-primary" onclick="window.location.href='/product?action=create'">Thêm mới</button>
        </td>
    </tr>
    </tbody>

</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
