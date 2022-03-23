<%--
  Created by IntelliJ IDEA.
  User: yf82
  Date: 2020/11/3
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片上传案例</title>
    <jsp:include page="../Share/head.jsp"></jsp:include>

    <!--引入富文本信息依赖-->
    <script type="text/javascript" charset="utf-8" src="../js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../js/ueditor/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script src="../js/AccountInfo/create.js"></script>
</head>
<body class="mainbody">
<div style="padding: 10px; background-color: #F2F2F2;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <form class="layui-form layui-form-pane" action="" id="formSelf" enctype="multipart/form-data">
                <div class="layui-card">
                    <div class="layui-card-header">图片上传案例</div>
                    <div class="layui-card-body layui-form layui-form-pane">

                        <div class="layui-inline">
                            <label class="layui-form-label">*富文本框：</label>
                            <div class="layui-input-inline">
                                <textarea id="editor" name="editor" lay-verify="required" type="text/plain" style="width:700px;height:300px;" autocomplete="off"></textarea>
                            </div>
                        </div>

                        <br />
                        <br />

                        <div class="layui-input-inline">
                            <label class="layui-form-label">上传图片：</label>
                            <div class="layui-input-inline">
                                <input id="noticeVal" name="noticeVal" type="hidden">
                                <button type="button" class="layui-btn" id="btnUploadImg">
                                    <i class="layui-icon">&#xe67c;</i>上传图片 </button>
                            </div>
                        </div>

                        <br />
                        <br />

                        <div class="layui-inline">
                            <label class="layui-form-label">上传前预览图：</label>
                            <div class="layui-input-inline">
                                <img class="layui-upload-img" height="100" id="imgBeforeDisplay">
                            </div>
                        </div>

                        <br />
                        <br />

                        <div class="layui-inline">
                            <label class="layui-form-label">上传后预览图：</label>
                            <div class="layui-input-inline">
                                <img class="layui-upload-img" height="100" id="imgAfterDisplay">
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
