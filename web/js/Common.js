var layer = null;
var baseUrl = "http://127.0.0.1:8888/";

$(document).ready(function () {
    //JavaScript代码区域
    layui.use(['layer', 'element', 'form', 'layedit', 'laydate', 'table', 'laypage'], function () {
        layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var layer = layui.layer;
        var layedit = layui.layedit;
        var laydate = layui.laydate;
        var table = layui.table;
        var laypage = layui.laypage

        if (isExitsFunction("SelfLayUI")) {
            SelfLayUI(form, layer, layedit, laydate, table, laypage);
        }
    });
});

function isExitsFunction(funcName) {
    try {
        if (typeof (eval(funcName)) == "function") {
            return true;
        }
    }
    catch (e) {
    }

    return false;
}

function saveToken(token) {
    localStorage.setItem("token", token);
}

function getToken() {
    var token = "";
    try {
        token = localStorage.getItem("token");
    } catch (e) {

    }
    return token;
}

function ajaxFun(url, data, callback, showWait, sendToken, errorCallback) {
    if (sendToken) {
        data.token = getToken();
    }

    var layerIx = 0;
    $.ajax({
        url: baseUrl + url,
        type: "POST", //方式
        data: JSON.stringify(data), //传值
        contentType: 'application/json',
        cache: false, //禁用缓存
        async: true,  //异步调用
        dataType: "json",
        success: function(rv){
            if(rv.status==1){
                return callback(rv.data);
            } else {
                showWarn("失败：" + rv.message);

                if(errorCallback!=null){
                    errorCallback();
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            if (XMLHttpRequest.status == 401) {
                layer.alert(
                    'token过期，请重新登录！',
                    {
                        closeBtn: 0    // 是否显示关闭按钮
                        ,anim: 1 //动画类型
                        ,btn: ['重新登录'] //按钮
                        ,icon: 6    // icon
                        ,yes:function(){
                            top.location.href="../index.jsp";
                        }
                    }
                );
            } else if (XMLHttpRequest.status == 402) {
                showWarn("没有访问该功能的权限，请联系管理员!");
            }
            else{
                showWarn("请求异常, 请稍后尝试！");
            }
        },
        beforeSend: function (request) {
            //alertLoad('正在保存');
            if(sendToken){
                var token = getToken();
                request.setRequestHeader("token", token);
            }

            if (showWait) {
                if (top.layer != null) {
                    layerIx = top.layer.load();
                }
            }
        },
        complete: function (XMLHttpRequest, textStatus) {
            if (showWait) {
                if (top.layer != null) {
                    top.layer.close(layerIx);
                }
            }
        }
    });
}

//提示
function showInfo(info){
    layer.msg(info, { time: 2000, icon: 1 });
}

//警告
function showWarn(info){
    layer.msg(info, { time: 2000, icon: 2 });
}