var layuiForm = null;

function SelfLayUI(form, layer, layedit, laydate, table, laypage){
    layuiForm = form;
    ajaxFun("roleInfo/getMenuList", {}, callbackFun, true, true);
}

function callbackFun(data){
    $(data.menulist).each(function (pix,pitem){
        if(pitem.ParentId==0){
            var html =
                '<tr style="height:60px">'+
                    '<td width="140px" style="background-color:#f3f3f3">'+
                        '<input type="checkbox" lay-verify="required|checks" name="ids" value="'+pitem.Id+'" id="menuInfo'+pitem.Id+'" lay-filter="changeParent" title="'+pitem.MenuName+'" lay-skin="primary">'+
                    '</td>'+
                    '<td>';

            $(data.menulist).each(function (cix,citem){
                if(citem.ParentId == pitem.Id){
                    html+='<input type="checkbox" name="ids" title="'+citem.MenuName+'" lay-verify="required|checks" lay-filter="changeChild" value="'+citem.Id+'" parentid="'+pitem.Id+'" id="menuInfo'+citem.Id+'" lay-skin="primary">';
                }
            });

            html+='</td></tr>';

            $("#MenuTable").append(html);
        }
    });

    //需要进行重新渲染
    layuiForm.render();
    initForm(layuiForm);
}

function initForm(form){
    form.verify({

    });

    form.on('checkbox(changeParent)', function (data) {
        var id = data.value;

        if (data.elem.checked) {
            $("#MenuTable").find("input[parentid='" + id + "']").each(function () {
                $(this).prop("checked", true);
            })
        }
        else {
            $("#MenuTable").find("input[parentid='" + id + "']").each(function () {
                $(this).prop("checked", false);
            })
        }

        form.render();
    });

    form.on('checkbox(changeChild)', function (data) {
        var pid = data.elem.getAttribute("parentid");
        console.log(pid);
        var num = $("input[type='checkbox'][parentid='" + pid + "']:checked").length;
        console.log(num);
        if (num == 0) {
            $("#menuInfo" + pid).prop("checked", false);
        }
        else {
            $("#menuInfo" + pid).prop("checked", true);
        }
        form.render();
    });

    form.on('submit(objForm)', function (data) {
        var num = $("input[type='checkbox']:checked").length;
        if (num <= 0) {
            layer.msg("请选择权限");
            return false;
        }

        var ids = "";
        $("#MenuTable").find("input[type='checkbox']").each(function () {
            if ($(this).prop("checked") == true) {
                ids == "" ? ids += $(this).val() : ids += "," + $(this).val();
            }
        });

        ajaxFun("roleInfo/createRole",
            {
                idList : ids,
                roleName: $("#RoleName").val(),
                roleDesc: $("#RoleDesc").val(),
                status: $("input[name=status]:checked").val()
            },
            function (data){
                layer.msg("角色添加成功", { icon: 1, time: 1500, end: function () { parent.doNav('', '', '角色管理', '../RoleInfo/index.jsp'); } });
            }, true, true);

        return false;
    });
}

