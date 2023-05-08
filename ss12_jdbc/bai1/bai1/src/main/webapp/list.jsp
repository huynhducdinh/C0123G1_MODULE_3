<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 5/4/2023
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-light bg-light" style="height: 80px">
    <div class="container-fluid">
        <div style="display: flex; margin: 8px;position: relative">
            <div>
                <button class="btn" style="border: 1px solid #DDDDDD" onclick="window.location.href='/user?action=create'">Thêm mới</button>
            </div>
            <form action="/user?action=sort" method="post" style="margin-left: 20px">
                <button class="btn"  style="border: 1px solid #DDDDDD" type="submit">Sắp xếp</button>
            </form>

        </div>
        <form class="d-flex" action="/user?action=search" method="post">
            <input type="text" name="action" value="search" hidden>
            <input class="form-control me-2" type="search" name="phone" value="${phone}"
                   placeholder="Search by phone number" aria-label="Search">
            <button class="btn btn-secondary" type="submit">Search</button>
        </form>

    </div>
</nav>
<h1 style="text-align: center;">Quản Lý Khách Hàng</h1>
<table class="table table-striped table- bordered" style="width: 100%">
    <thead>
    <tr>
        <th>#</th>
        <th>Mã ID</th>
        <th>Họ và Tên</th>
        <th>Email</th>
        <th>Quốc Gia</th>
        <th>Chức Năng</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td colspan="3">
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#updateModal${user.id}">
                    Sửa
                </button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#deleteModal${user.id}">
                    Xoá
                </button>
            </td>
        </tr>
        <div class="modal fade" id="updateModal${user.id}" tabindex="-1" aria-labelledby="update" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update">Chỉnh sửa tên</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có chỉnh sửa tên ${user.name} này không ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary"
                                onclick="window.location.href='/user?action=update&id=${user.getId()}'">YES
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteModal${user.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Xóa tên</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Bạn có muốn xóa tên ${user.name} ngày không ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                        <button type="button" class="btn btn-primary"
                                onclick="window.location.href='/user?action=delete&id=${user.getId()}'">YES
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    </tbody>

</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
