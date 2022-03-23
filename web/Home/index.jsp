<%--
  Created by IntelliJ IDEA.
  User: yf82
  Date: 2020/10/14
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员后台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <jsp:include page="../Share/head.jsp"></jsp:include>
</head>

<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
            </ul>

            <div class="layui-layout-left" style="margin:15px 0 0 50px">
                    <span class="layui-breadcrumb layui-nav-item" id="navSpan" lay-separator="-">
                        <a href="javascript:doNav('','','','../Home/center.jsp')" id="IndexPage">首页</a>
                    </span>
            </div>

            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">

                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite id="citeTrueName"></cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:doNav('','','','../Home/center.jsp')">管理中心</a>
                        </dd>
                        <dd>
                            <a href="javascript:doNav('','','修改密码','../Home/UpdPass.jsp')">修改密码</a>
                        </dd>
                        <hr>
                        <dd><a href="javascript:logout()">退出系统</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->

        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="home/console.html">
                    <span>管理员后台</span>
                </div>

                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    <li data-name="get" class="layui-nav-item layui-this" id="Treeli">
                        <a href="javascript:doNav('','','','../Home/center.jsp')" lay-tips="管理中心" lay-direction="2">
                            <i class="layui-icon layui-icon-auz"></i>
                            <cite>管理中心</cite>
                        </a>
                    </li>


                </ul>
            </div>
        </div>

        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="../Home/center.jsp" frameborder="0" class="layadmin-iframe" id="mainframe" name="mainframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script>

    layui.config({
        base: '../js/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');

    function SelfLayUI(form, layer, layedit, laydate, table, laypage){
        ajaxFun(
            "home/Index",
            {
            },
            function(data){
                $("#citeTrueName").html(data.trueName);

                $(data.menuList).each(function (pix,pitem){
                    if(pitem.ParentId==0){
                        var html =
                            '<li data-name="home" class="layui-nav-item">'+
                            '<a href="javascript:;" lay-tips="'+pitem.MenuName+'" lay-direction="2">'+
                            '<i class="layui-icon layui-icon-home"></i>'+
                            '<cite>'+pitem.MenuName+'</cite>'+
                            '</a>'+
                            '<dl class="layui-nav-child">';

                        $(data.menuList).each(function (cix,citem){
                            if(citem.ParentId == pitem.Id){
                                html+='<dd data-name="console">'+
                                    "<a href=\"javascript:doNav('"+pitem.MenuName+"','"+pitem.MenuUrl+"','"+citem.MenuName+"','"+citem.MenuUrl+"')\">"+citem.MenuName+"</a>"+
                                    '</dd>';
                            }
                        });

                        html+='</dl></li>';

                        $("#LAY-system-side-menu").append(html);
                    }
                });

                //需要进行重新渲染
                layui.use('element', function() {
                    var element = layui.element;
                    element.init();
                });
            },
            true,true);
    }

    function doNav(navTitle, navUrl, citeTitle, goUrl) {
        $("#mainframe").attr("src", goUrl);

        $("#navSpan").html("<a href=\"javascript:doNav('','','','../Home/center.jsp')\" id=\"IndexPage\">首页</a>");

        if (navUrl != "" && navTitle != "") {
            $("#navSpan").append("<a href=\"javascript:doNav('','','" + navTitle + "','" + navUrl + "')\">" + navTitle + "</a>");
        }

        if (citeTitle != "") {
            $("#navSpan").append("<a><cite>" + citeTitle + "</cite></a>");
        }

        var element = layui.element;

        element.render("breadcrumb");
    }

    function logout() {
        layer.confirm('确定退出系统吗？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            ajaxFun(
                "login/adminLoginout",
                {
                },
                function(data){
                    location.href="../index.jsp";
                },
                true,true);
        });
    }
</script>
</body>
</html>
