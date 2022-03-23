<%--
  Created by IntelliJ IDEA.
  User: yf82
  Date: 2020/10/15
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <jsp:include page="../Share/head.jsp"></jsp:include>
</head>
<body class="mainbody">
<div style="padding: 10px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">修改密码</div>
                <div class="layui-card-body layui-form layui-form-pane">

                    <div class="layui-inline" id="opdiv">
                        <label class="layui-form-label">*原密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="oldPwd" lay-verify="required" class="layui-input">
                        </div>
                    </div>

                    <br />
                    <br />

                    <div class="layui-inline" id="npdiv">
                        <label class="layui-form-label">*新密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="newPwd" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <br />
                    <br />

                    <div class="layui-inline" id="npdiv1">
                        <label class="layui-form-label">*重复新密码：</label>
                        <div class="layui-input-inline">
                            <input type="password" id="newPwd1" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                    </div>

                    <br />
                    <br />

                    <div class="layui-form-item">
                        <label class="layui-form-label"></label>
                        <div class="layui-input-block">
                            <button class="layui-btn mlbtn" id="OK" lay-filter="objForm" onclick="updpass();">确认</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var updpass = function () {
        var oldPwd = $("#oldPwd").val();
        var newPwd = $("#newPwd").val();
        var newPwd1 = $("#newPwd1").val();

        if (oldPwd == "" || $.trim(oldPwd).length == 0) {
            showWarn("请输入原密码！");
        }
        else if (newPwd == "" || $.trim(newPwd).length == 0) {
            showWarn("请输入新密码！");
        }
        else if (newPwd1 == "" || $.trim(newPwd1).length == 0) {
            showWarn("请再次输入新密码！");
        }
        else if (newPwd != newPwd1) {
            showWarn("两次密码不一致！");
        }
        else if ($.trim(newPwd).length < 6) {
            showWarn("密码长度不小于六位！");
        }
        else {
            ajaxFun(
                "adminInfo/updatePwd",
                {
                    oldPwd: oldPwd,
                    newPwd: newPwd
                },
                function(data){
                    showInfo("密码修改成功");
                    $("#oldPwd").val("");
                    $("#newPwd").val("");
                    $("#newPwd1").val("");
                },
                true,true);
        }
    }
</script>
</body>
</html>
