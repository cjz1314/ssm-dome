<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    //basePath值为 http://localhost:8080/bookshop/
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" +
            request.getServerPort() + path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>index</title>
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
        <button type="button" class="btn btn-primary col-md-offset-10" data-target="#myModal"
                id="btn_add">添加
        </button>
        <button class="btn btn-danger" id="delete_all">删除被选员工</button>
    </div>
    <div class="row col-md-12">
        <table class="table table-hover">
            <thead>
            <tr>
                <th><input type="checkbox" id="check_all"></th>
                <th>id</th>
                <th>lastName</th>
                <th>email</th>
                <th>gender</th>
                <th>deptName</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody id="table_body">

            </tbody>
        </table>
    </div>
    <div class="row col-md-12">
        <div class="center" id="info"></div>
        <nav class="center" id="page_nav"></nav>
    </div>
</div>


<%--新增模态框--%>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_emp">

                    <div class="form-group">
                        <label for="empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName" placeholder="员工姓名" name="empName">
                            <span></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="123456@qq.com"
                                   name="email">
                            <span></span>
                        </div>
                    </div>
                    <%-- 性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1" value="m"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2" value="w"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="depts">
                            </select>
                        </div>
                    </div>
                </form>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="save">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
<%--修改模态框--%>
<div class="modal fade" id="update_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="update_emp_ModalLabel">修改员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_emp">
                    <input type="hidden" id="update_empId">
                    <div class="form-group">
                        <label for="update_empName" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="update_empName" placeholder="员工姓名"
                                   name="empName">
                            <span></span>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="update_email" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="update_email" placeholder="123456@qq.com"
                                   name="email">
                            <span></span>
                        </div>
                    </div>
                    <%-- 性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="update_gender1" value="m"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="update_gender2" value="w"> 女
                            </label>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="update_depts">
                            </select>
                        </div>
                    </div>
                </form>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="update">保存修改</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var maxPageNum;//最大的页码数
    var update_id;//将要修改的员工id
    var emp_count;
    $(function () {
        //初始化，去第一页

        to_page(1);
    });

    //发起ajax请求得到第几页的数据
    function to_page(pageNum) {
        $.ajax({
            url: "<%=basePath%>emps",
            data: "pageNum=" + pageNum,
            type: "GET",
            success: function (result) {
                nowPageNum = result.extend.pageInfo.pageNum;
                maxPageNum = result.extend.pageInfo.pages;
                emp_count = result.extend.pageInfo.pageSize;
                include_table(result);
                include_info(result);
                include_nav(result);
            }
        });
    }


    //导入table的数据
    function include_table(result) {
        $("#table_body").empty();

        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            //执行更新前先清空数据
            var checkBox = $("<td><input type=\"checkbox\"  class=\"check_item\"></td>");
            var td_id = $("<td></td>").append(item.empId);
            var td_name = $("<td></td>").append(item.empName);
            var td_email = $("<td></td>").append(item.email);
            var td_gender = $("<td></td>").append(item.gender == "m" ? "男" : "女").val(item.gender);
            var td_deptName = $("<td></td>").append(item.dept.deptName).val(item.dept.deptId);

            var btn_update = $("<button></button>").addClass("btn btn-sm btn-info").append($("<span></span>").addClass("glyphicon glyphicon-pencil btn_update").append("编辑"));
            var btn_delete = $("<button></button>").addClass("btn btn-sm btn-danger delete_item").append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
            var td_button = $("<td></td>").append(btn_update).append(" ").append(btn_delete);

            var tr = $("<tr></tr>");
            tr.append(checkBox).append(td_id).append(td_name).append(td_email).append(td_gender).append(td_deptName).append(td_button);
            $("#table_body").append(tr);

        });
    }

    //导入网站页面详情
    function include_info(result) {
        //执行更新前先清空数据
        $("#info").empty();
        $("#info").append("当前第" + result.extend.pageInfo.pageNum + "页，共有" + result.extend.pageInfo.pages + "页，总共" + result.extend.pageInfo.total + "条记录");
    }

    //导入分页导航栏
    function include_nav(result) {
        //执行更新前先清空数据
        $("#page_nav").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var first = $("<li></li>").append($("<a/>").append("首页"));
        var Previous = $("<li></li>").append($("<a/>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == true) {
            first.click(function () {
                to_page(1);
            });
            Previous.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        } else {
            first.addClass("disabled");
            Previous.addClass("disabled");
        }
        ul.append(first).append(Previous);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var li = $("<li></li>").append($("<a/>").append(item));
            ul.append(li);

            if (item == result.extend.pageInfo.pageNum) {
                li.addClass("active");
            } else {
                li.click(function () {
                    to_page(item);
                })
            }
        })

        var next = $("<li></li>").append($("<a/>").append("&raquo;"));
        var last = $("<li></li>").append($("<a/>").append("末页"));
        if (result.extend.pageInfo.hasNextPage == true) {
            last.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            next.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        } else {
            last.addClass("disabled");
            next.addClass("disabled");
        }
        ul.append(next).append(last);

        var nav = $("#page_nav");
        nav.append(ul);
    }


    // 点击新增，出现模态框
    $("#btn_add").click(function () {

        //查询所有的部门,并将数据插入
        depts($("#depts"));

        //出现模态框
        $('#myModal').modal({
            backdrop: 'static'
        });
    })

    //查询所有的部门,并将数据插入到传入的下拉菜单中
    function depts(ele) {
        $.ajax({
            url: "<%=basePath%>depts",
            type: "GET",
            success: function (result) {
                $.each(result.extend.depts, function (index, item) {
                    $("<option></option>").append(item.deptName).attr("value", item.deptId).appendTo(ele);
                })
            }
        })
    }


    //点击保存按钮，执行保存
    $("#save").click(function () {
        //前端校验：判读是否符合正则表达式
        if (reg($("#empName"), $("#email")) == true) {
            //执行保存
            save_emp();
        }


    })

    //保存员工
    function save_emp() {

        $.ajax({
            url: "<%=basePath%>emp",
            data: $("#new_emp").serialize(),
            type: "POST",
            success: function (result) {
                // 如果保存成功关闭模态框，然后跳转到最大页码数+1，通过分页插件的设置，确保在新加了数据的情况下跳转到最后一页
                if (result.code == 100) {
                    $('#myModal').modal('hide');
                    //跳转到最后一页
                    to_page(maxPageNum + 1);
                } else if (result.code == 500) {
                    //如果后端得到的数据不符合正则表达式
                    if (result.extend.errorFields != null) {
                        if (result.extend.errorFields.email != null) {
                            show_validate_msg($("#email"), "error", "邮箱格式错误");
                        }
                        if (result.extend.errorFields.empName != null) {
                            show_validate_msg($("#empName"), "error", "用户名格式错误");
                        }
                    } else {
                        //如果保存失败，表示这个用户名已经被使用，不可再用，显示提示信息
                        show_validate_msg($("#empName"), "error", "用户名已经存在");
                    }

                }
            }
        })
    }

    //判断是否符合正则表达式，符合返回true，不符合返回false
    function reg(ele_name, ele_email) {
        var book = true;
        var regName = /(^[a-zA-z0-9_-]{5,16}$)|(^[\u2E80-\u9FFF]{2,6})/;
        var name = ele_name.val();
        if (!regName.test(name)) {
            show_validate_msg(ele_name, "error", "请输入合法的用户名");
            book = false;
        } else {
            show_validate_msg(ele_name, "success", "");
        }
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var email = ele_email.val();
        if (!regEmail.test(email)) {
            show_validate_msg(ele_email, "error", "邮箱格式错误");
            book = false;
        } else {
            show_validate_msg(ele_email, "success", "");
        }

        return book;
    }


    //显示提示信息
    function show_validate_msg(ele, status, msg) {
        //先清除之前的样式，再添加新的样式
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success");

        } else if (status == "error") {
            $(ele).parent().addClass("has-error");

        }
        $(ele).next("span").text(msg);
    }


    //点击修改按钮，出现修改的模态框
    $(document).on("click", ".btn_update", function () {
        //查询员工信息
        aboutEmployee($(this));
        //查询部门信息
        depts($("#update_depts"));
        //打开模态框
        $("#update_emp_modal").modal(
            {
                backdrop: 'static'
            }
        )
    })

    //获取关于员工的数据，并且回显
    function aboutEmployee(ele) {
        var tr = ele.parent().parent().parent();
        update_id = tr.children(":nth-child(2)").text();
        var name = tr.children(":nth-child(3)").text();
        var email = tr.children(":nth-child(4)").text();
        var gender = tr.children(":nth-child(5)").val();

        var dept = tr.children(":nth-child(6)").val();
        $("#update_empId").val(update_id);
        $("#update_empName").val(name);
        $("#update_email").val(email);
        if (gender == 'm') {
            $("#update_gender1").attr("checked", true);

        } else {
            $("#update_gender2").attr("checked", true);
        }
        $("#update_depts").val(dept);

    }

    //点击保存修改时，先校验数据符合了就提交
    $("#update").click(function () {
        if (reg($("#update_empName"), $("#update_email")) == true) {

            //保存修改的数据
            update();
        }

    })

    //发起ajax请求，保存修改后的数据
    function update() {
        $.ajax({
            url: "<%=basePath%>emp/" + update_id,
            data: $("#update_emp").serialize(),
            type: "put",
            success: function (result) {

                if (result.code == 100) {
                    $('#update_emp_modal').modal('hide');
                    //跳转到修改的那一页
                    to_page(nowPageNum);
                } else if (result.code == 500) {
                    //如果后端得到的数据不符合正则表达式
                    if (result.extend.errorFields != null) {
                        if (result.extend.errorFields.email != null) {
                            show_validate_msg($("#update_email"), "error", "邮箱格式错误");
                        }
                        if (result.extend.errorFields.empName != null) {
                            show_validate_msg($("#update_empName"), "error", "用户名格式错误");
                        }
                    } else {
                        //如果保存失败，表示这个用户名已经被使用，不可再用，显示提示信息
                        show_validate_msg($("#update_empName"), "error", "用户名已经存在");
                    }

                }
            }
        })
    }

    //单个删除
    $(document).on("click", ".delete_item", function () {
        var father = $(this).parent().parent();
        var name = father.children(":nth-child(3)").text();
        var id = father.children(":nth-child(2)").text();
        if (confirm("是否要删除" + name + "?")) {
            $.ajax({
                url: "<%=basePath%>emp/" + id,
                type: "delete",
                success: function () {

                    to_page(nowPageNum);
                }
            })
        }
    })

    //全选全不选按钮
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    })
    //全选按钮跟随选中个数变化
    $(document).on("click", ".check_item", function () {
            var count = $(".check_item:checked").length;
            if (count == emp_count) {
                $("#check_all").prop("checked", true);
            } else {
                $("#check_all").prop("checked", false);
            }
        }
    )
    //点击全部删除，弹出对话框
    $("#delete_all").click(function () {
        var ids = "";
        $.each($(".check_item:checked"), function () {
            ids += $(this).parents("tr").children(":nth-child(2)").text() + "-";
        })

        ids = ids.substring(0, ids.length - 1);
        if (confirm("是否要删除这些？")) {
            $.ajax(
                {
                    url: "<%=basePath%>emp/" + ids,
                    type: "delete",
                    success: function () {
                        to_page(nowPageNum);
                    }
                }
            )
        }
    })
</script>


</body>
</html>
