<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/27/2023
  Time: 10:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1 style="width: 30%; text-align:  center;margin-left: 30%">Danh sách khách hàng</h1>
    <div style="padding: 0 20%; text-align: center">
        <table  border="1px" style="text-align: center">
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
            <c:forEach var="customer" items="${customer}">
                <tr>
                    <td style="text-align: center;width: 20vw"> ${customer.getNames()}</td>
                    <td style="text-align: center;width: 20vw"> ${customer.getBirthday()}</td>
                    <td style="text-align: center;width: 20vw"> ${customer.getAddress()}</td>
                    <td style="text-align: center;width: 20vw"><img src="${customer.getImg()}" alt="" style="width: 10vw"></td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>
