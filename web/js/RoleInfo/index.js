var postData={
    status : -1,
    roleName : "",
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
            { field: 'CreateDate', title: '创建日期', width: 180 },
            { field: 'AdminNum', title: '用户个数', width: 120 },
            { field: 'RoleDesc', title: '角色描述' },
            {
                field: 'Status', title: '状态', width: 100, align: "center",
                templet: function (data) { return (data.Status == 0) ? "禁用" : "启用" }
            },
            {
                field: 'caozuo', title: '操作', width: 150, align: "center",
                templet: function (data) {
                    return '<a class="layui-btn layui-btn-xs" onclick="editData('+data.Id+')"><i class="layui-icon">&#xe642;</i>编辑</a>' +
                        '<a class="layui-btn layui-btn-danger layui-btn-xs" onclick="delData(' + data.Id +')"><i class="layui-icon">&#xe640;</i>删除</a>';
                }
            }
        ]],
        limit: 100
    });

    layuiTable = table;
    layuilayPage = laypage;

    ajaxFun("roleInfo/page", postData, callbackFun, true, true);
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

                ajaxFun("roleInfo/page", postData, callbackFun, true, true);
            }
        }
    });
}

function searchData(){
    postData.pageIndex=1;
    postData.status=$("#status").val();
    postData.roleName=$("#roleName").val();

    ajaxFun("roleInfo/page", postData, callbackFun, true, true);
}


