var postData={
    status : -1,
    adminName : "",
    trueName : "",
    pageIndex : 1
};
var layuiTable = null;
var layuilayPage = null;
function SelfLayUI(form, layer, layedit, laydate, table, laypage) {
    table.render({
        elem: '#divTable',
        height: 'full-130',
        id: "tableContext",
        cols: [[
            { field: 'Id', title: '编号', hide: true },
            { field: 'RoleName', title: '角色名称' },
            { field: 'AdminName', title: '登录名称' },
            { field: 'TrueName', title: '姓名' },
            { field: 'CreateDate', title: '创建日期', width: 180 },
            { field: 'LastLoginDate', title: '最后登录日期', width: 180 },
            {
                field: 'Status', title: '状态', width: 100, align: "center",
                templet: function (data) { return (data.Status == 0) ? "禁用" : "启用" }
            },
            // {
            //     field: 'caozuo', title: '操作', width: 220, align: "center",
            //     templet: function (data) {
            //         return '<a class="layui-btn layui-btn-xs" onclick="resetStatus(' + data.Id + ',' + data.Status +",'"+data.AdminName+"'"+')"><i class="layui-icon">&#xe642;</i>'+(data.Status==1?"禁用":"启用")+'</a>' +
            //             '<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="resetPwd(' + data.Id +",'"+data.AdminName+"'"+')"><i class="layui-icon"></i>重置密码</a>'+
            //             '<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="delData(' + data.Id +')"><i class="layui-icon">&#xe640;</i>删除</a>';
            //     }
            // }
            {
                field: 'caozuo', title: '操作', width: 220, align: "center",templet: "#tmpCaoZuo"
            }
        ]],
        limit: 100
    });

    layuiTable = table;
    layuilayPage = laypage;

    ajaxFun("adminInfo/adminInfoPage", postData, callbackFun, true, true);
}

function callbackFun(data){
    //重新给表格赋值
    layuiTable.reload('tableContext', { data: data.pageData });

    layuilayPage.render({
        elem: 'divPage', //注意，这里的 test1 是 ID，不用加 # 号
        layout: ['prev', 'page', 'next', 'count'],
        limit: data.pageSize,
        curr: data.pageIndex,
        count: data.rowCount, //数据总数，从服务端得到
        jump: function (obj, first) {
            if (obj.curr != data.pageIndex) {
                postData.pageIndex = obj.curr;

                ajaxFun("adminInfo/adminInfoPage", postData, callbackFun, true, true);
            }
        }
    });
}

function searchData(){
    postData.pageIndex=1;
    postData.status=$("#status").val();
    postData.adminName=$("#adminName").val();
    postData.trueName=$("#trueName").val();

    ajaxFun("adminInfo/adminInfoPage", postData, callbackFun, true, true);
}

//重置密码
function resetPwd(adminId,adminName){
    layer.confirm('确定要重置['+adminName+']的密码吗？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        ajaxFun(
            "adminInfo/resetPwd",
            {
                id:adminId
             },
            function(data){
                showInfo("成功将用户["+adminName+"]的密码重置为：123666");
            },
            true,true);
    });
}


//重置状态
function resetStatus(adminId, statusVal,adminName){
    layer.confirm('确定要['+adminName+']的状态为'+(statusVal==1?"禁用":"启用")+'吗？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        ajaxFun(
            "adminInfo/resetStatus",
            {
                id:adminId,
                status:statusVal
            },
            function(data){
                layer.msg(
                    "成功修改用户["+adminName+"]的状态",
                    {
                        icon: 1,
                        time: 2500,
                        end: function () {
                            ajaxFun("adminInfo/adminInfoPage", postData, callbackFun, true, true);
                        }
                    });
            },
            true,true);
    });
}