<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="Frontend/img/favicon_shop_car.ico"
	type="image/x-icon">
<title>Lazapee - Trang chủ</title>
<style>
#notification-success {
    position:fixed;
    top:30px;
    right: 50px;
    width:300px;
    z-index:10000;
    text-align:center;
    font-weight:normal;
    font-size:20px;
    color:white;
    background-color:Green;
    padding:10px;
    border: 1px solid green;
    border-radius: 5px;
}

#notification-success a {
    color:white;
    text-decoration:none;
}
#notification-fail {
    position:fixed;
    top:30px;
    right: 50px;
    width:300px;
    z-index:105;
    text-align:center;
    font-weight:normal;
    font-size:20px;
    color:white;
    background-color:red;
    padding:10px;
    border: 1px solid red;
    border-radius: 5px;
}

#notification-fail a {
    color:white;
    text-decoration:none;
}
</style>

	<jsp:include page="include/homeHeader.jsp"></jsp:include>
</head>
<body>
	
	<jsp:include page="../noti.jsp"></jsp:include>
	

	<jsp:include page="include/homeContent.jsp"></jsp:include>

	<jsp:include page="include/homeFooter.jsp"></jsp:include>

</body>
</html>


