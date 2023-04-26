<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/26/2023
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="padding-left: 30px">Product Description</h1>
<div style="border: solid red 2px; width: 450px">
    <h2 style="padding-left: 15px">Product Description:${product}</h2>
    <h2 style="padding-left: 15px">List Price:${price}</h2>
    <h2 style="padding-left: 15px">Discount Percent:${percent}%</h2>
</div>
<br>
<h1 style="padding-left: 30px">Result</h1>
<div style="border: solid red 2px ; width: 450px">
    <h2 style="padding-left: 15px"> Discount Amount:${amount} </h2>
    <h2 style="padding-left: 15px"> Discount Price:${total} </h2>
</div>

</body>
</html>
