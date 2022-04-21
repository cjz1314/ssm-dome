
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="/emps"></jsp:forward>

<%
    String path = request.getContextPath();
    //basePath值为 http://localhost:8080/bookshop/
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html>
<head>
    <title>index</title>
    <%--设置base标签--%>
    <base href="<%=basePath%>">
    <!--    Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边-->
    <script type="text/javascript" src="static\js\jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static\bootstrap-3.4.1-dist\js\bootstrap.min.js"></script>
    <link rel="stylesheet" href="static\bootstrap-3.4.1-dist\css\bootstrap.min.css">
</head>
<body>

</body>
</html>
