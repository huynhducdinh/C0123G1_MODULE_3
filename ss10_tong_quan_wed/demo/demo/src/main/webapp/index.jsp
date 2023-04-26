<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/26/2023
  Time: 2:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<link rel="stylesheet" href="text.css">
</head>
<body>
<form  action="/display-discount" method="post">
  <h1 style="text-align: center">Product Discount Calculator</h1>
  <div  class="content">
    <label>Product Description</label>
    <input type="text" name="product" placeholder="Mô tả sản phẩm"><br>
    <label>List Price</label>
    <input type="text" name="price" placeholder="Giá niêm yết của sản phẩm"><br>
    <label>Discount Percent</label>
    <input type="text" name="percent" placeholder="Tỷ lệ chiết khẩu(phần trăm)"><br>
      <input  type="submit" value="Calculate Discount">
  </div>
</form>
</body>
</html>
