<%--
  Created by IntelliJ IDEA.
  User: yf82
  Date: 2020/10/14
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>管理员登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/Login/login.css" rel="stylesheet" />
    <script src="js/jquery-3.6.0.min.js"></script>
    <link href="js/layuiadmin/layui/css/layui.css" rel="stylesheet" />
    <link href="js/layuiadmin/style/admin.css" rel="stylesheet" />
    <script src="js/Common.js"></script>
    <script src="js/layuiadmin/layui/layui.js"></script>

    <style>
      body {
        background-color: #ffffff;
      }

      article > header {
        text-align: center;
        background: #ffffff;
        font-size: 28px;
        font-weight: bold;
        padding-top: 40px
      }

      .content {
        padding: 40px 30px;
      }

      .content > div {
        padding-bottom: 30px !important;
        margin: 0 !important;
      }

      .content > div > input {
        height: 40px;
      }

      .content > div > input[name="username"] {
        background: url(images/user-ico.png) no-repeat 6px center;
        padding-left: 40px;
      }

      .content > div > input[name="password"] {
        background: url(images/pwd-ico.png) no-repeat 8px center;
        padding-left: 40px;
      }

      .content > div > a[name=forget] {
        float: right;
        margin-right: 10%;
        color: #333333;
      }

      .content > div > a[name=forget]:hover {
        color: #ffa70d;
        text-decoration: none;
      }

      .btn-primary {
        width: 100%;
        font-size: 18px;
        word-spacing: 8px;
        letter-spacing: 8px
      }

      .codeDiv > input {
        width: 200px;
        text-indent: 10px;
        outline: none;
        border: 1px solid #ccc;
      }

      .codeDiv > a {
        width: 32%;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        background-color: #ffa70d;
        color: #fff;
        height: 40px;
        border-radius: 2px;
        line-height: 40px;
      }

      img.bg {
        min-height: 100%;
        min-width: 1024px;
        width: 100%;
        height: auto;
        position: fixed;
        top: 0;
        left: 0;
      }
      .form-control
      {
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
        border-radius: 4px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
      }
    </style>
  </head>
  <body class="login-body">
  <img src="images/login-bg.jpg" class="bg" />
  <form role="form">
    <article>
      <header>管理员登录</header>
      <div class="content">
        <div>
          <input id="userName" name="userName" class="form-control" type="text" autocomplete="off" placeholder="请输入您的用户名">
        </div>
        <div>
          <input id="userPwd" name="userPwd" class="form-control" type="password" autocomplete="off" placeholder="请输入您的密码">
        </div>
        <div class="codeDiv">
          <input id="valid" name="valid" type="text" autocomplete="off" placeholder="请输入验证码" maxlength="4" style="float：left">
          <img id="codeImage" border="0" style="margin-left: 5px;height: 40px;width: 80px; cursor: pointer;float: right"
               onclick="displayValid()" />
        </div>
        <div>
          <input type="button" id="btnLogin" class="btn btn-primary" value="登录" onclick="doLogin()" />
        </div>
      </div>
    </article>
  </form>

  <script type="text/javascript">
    var redisKey = "";

    function SelfLayUI(form, layer, layedit, laydate, table, laypage){
      displayValid();
    }

    function displayValid(){
      ajaxFun("login/createValid",{},function(data){
        redisKey = data.redisKey;
        $("#codeImage").attr("src", "data:image/png;base64," + data.validImg);
      },false,false);
    }

    function doLogin() {
      var userName = $("#userName").val();
      var userPwd = $("#userPwd").val();
      var valid = $("#valid").val();

      if ($.trim(userName).length == 0) {
        showWarn("请输入用户名");
        return false;
      }

      if (userPwd.length < 6) {
        showWarn("密码长度不小于六位");
        return false;
      }

      if (valid.length != 4) {
        showWarn("验证码应为四位");
        return false;
      }

      ajaxFun(
          "login/adminLogin",
            {
              adminName: userName,
              adminPwd: userPwd,
              valid: valid,
              validKey:redisKey
            },
            function(data){
              saveToken(data.token);
              location.href = "Home/index.jsp";
            },
            false,
            false,
            function (){
              $("#valid").val("");
              displayValid();
            }
      );
    }
  </script>
  </body>
</html>
