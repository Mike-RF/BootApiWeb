<%--
  Created by IntelliJ IDEA.
  User: yf82
  Date: 2020/10/15
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色列表</title>
    <jsp:include page="../Share/head.jsp"></jsp:include>
    <script src="../js/RoleInfo/index.js"></script>
</head>
<body class="mainbody">
<div class="layui-form layui-form-pane layui-form-item">
    <a href="javascript:window.parent.doNav('角色管理', '../RoleInfo/index.jsp', '添加角色', '../RoleInfo/create.jsp')" class="layui-btn" style="margin-left:5px;margin-top:5px">添加角色</a>
    <div class="form-inline floatRight" style="margin-top:5px">
        <div class="layui-inline">
            <label class="layui-form-label layui-form-Search-label">状态：</label>
            <div class="layui-input-inline" style="margin-right:0px;width: 80px">
                <select name="status" id="status" style="margin-top:5px;">
                    <option value="-1">全部</option>
                    <option value="1">启用</option>
                    <option value="0">禁用</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label layui-form-Search-label">角色名称：</label>
            <div class="layui-input-inline" style="margin-right:0px">
                <input type="text" name="roleName" id="roleName" value="" placeholder="请输入角色名称" autocomplete="off" maxlength="20" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <input class="layui-btn mlbtn" type="button" value="查询" onclick="searchData()"/>
        </div>
    </div>
</div>
<div id="divTable"></div>
<div id="divPage"></div>
</body>
</html>
