<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    //basePath值为 http://localhost:8080/bookshop/
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>

<%--引入jstl标签库--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>list</title>
    <%--设置base标签--%>
    <base href="<%=basePath%>">
    <!--    Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边-->
    <script type="text/javascript" src="static\js\jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="static\bootstrap-3.4.1-dist\js\bootstrap.min.js"></script>
    <link rel="stylesheet" href="static\bootstrap-3.4.1-dist\css\bootstrap.min.css">
    <style>
        .center {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <h1 class="col-md-12">SSM-CRUD</h1>
    </div>
    <div class="row">
        <button class="btn btn-primary col-md-offset-10">添加</button>
        <button class="btn btn-danger">删除</button>
    </div>
    <div class="row col-md-12">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>id</th>
                <th>lastName</th>
                <th>email</th>
                <th>gender</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td>${emp.empId}</td>
                    <td>${emp.empName}</td>
                    <td>${emp.email}</td>
                    <td>${emp.gender=="m"?"男":"女"}</td>
                    <td>${emp.dept.deptName}</td>

                    <td>
                        <button class="btn btn-info"><span class="glyphicon glyphicon-pencil "
                                                           aria-hidden="true"></span>编辑
                        </button>

                        <button class="btn btn-danger"><span class="glyphicon glyphicon-trash"
                                                             aria-hidden="true"></span>删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row col-md-12">
        <div class="center">当前第${pageInfo.pageNum}页，共有${pageInfo.pages}页，总共${pageInfo.total}条记录</div>
        <nav class="center" aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="<%=basePath%>emps?pageNum=1">首页</a></li>
                <c:if test="${!pageInfo.isFirstPage}">
                    <li>
                        <a href="<%=basePath%>emps?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                    <li><a href="<%=basePath%>emps?pageNum=${i}">${i}</a></li>
                </c:forEach>

                <c:if test="${!pageInfo.isLastPage}">
                    <li>
                        <a href="<%=basePath%>emps?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <li><a href="<%=basePath%>emps?pageNum=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
