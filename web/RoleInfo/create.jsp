<%--
  Created by IntelliJ IDEA.
  User: yf82
  Date: 2020/10/15
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加角色</title>
    <jsp:include page="../Share/head.jsp"></jsp:include>
    <script src="../js/RoleInfo/create.js"></script>
</head>
<body class="mainbody">
<div style="padding: 10px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <form class="layui-form layui-form-pane" action="" id="formSelf" enctype="multipart/form-data">
                <div class="layui-card">
                    <div class="layui-card-header">添加角色</div>
                    <div class="layui-card-body layui-form layui-form-pane">

                        <div class="layui-inline">
                            <label class="layui-form-label">*角色名称：</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="RoleName" id="RoleName" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入角色名称">
                            </div>
                        </div>

                        <br />
                        <br />

                        <div class="layui-inline">
                            <label class="layui-form-label">*角色描述：</label>
                            <div class="layui-input-inline">
                                <input type="tel" name="RoleDesc" id="RoleDesc" lay-verify="required" autocomplete="off" class="layui-input" placeholder="请输入角色描述">
                            </div>
                        </div>

                        <br />
                        <br />

                        <div class="layui-inline">
                            <label class="layui-form-label">*当前状态：</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="status" value="1" title="启用" checked="" id="status1">
                                <input type="radio" name="status" value="0" title="禁用" id="status2">
                            </div>
                        </div>

                        <div class="layui-inline" style="margin-top:2px">
                            <span style="color:#a7a7a7">*不选默认为启用</span>
                        </div>

                        <br />
                        <br />

                        <div class="layui-inline">
                            <label class="layui-form-label">*权限设置：</label>
                            <table id="MenuTable" border="1" bordercolor="#d9d9d9" cellpadding="1" style="width:500px">

                            </table>
                        </div>
                        <br />
                        <br />
                        <div class="layui-form-item">
                            <label class="layui-form-label"></label>
                            <div class="layui-input-block">
                                <button class="layui-btn mlbtn" id="btnSubmit" lay-submit="" lay-filter="objForm">添加</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
