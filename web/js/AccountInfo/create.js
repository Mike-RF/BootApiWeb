$(document).ready(function () {
    //实例化编辑器
    var ue=UE.getEditor("editor",{
        toolbars: [['fullscreen', 'source', '|', 'undo', 'redo', '|',
            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'selectall', 'cleardoc', '|',
            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|','indent', '|',
            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
            'link', 'unlink', '|',
            'insertimage',  'attachment',  '|','horizontal', 'date', 'time', 'spechars', 'snapscreen'
        ]],
        //关闭elementPath
        elementPathEnabled:false,
        //默认的编辑区域高度
        initialFrameHeight:300,
        //关闭字数统计
        wordCount:false,
        //focus时自动清空初始化时的内容
        autoClearinitialContent:true
    });
    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
    UE.Editor.prototype.getActionUrl = function(action){
        if (action == 'uploadimage') {
            return baseUrl+"file-server/uploadimg";
        }else{
            return this._bkGetActionUrl.call(this, action);
        }
    }
});

layui.use(['upload', 'form'], function () {
    var upload = layui.upload;
    var form = layui.form;
    upload.render({
        elem: '#btnUploadImg'
        , url: baseUrl+"file-server/fileUploadServlet"
        , auto: false  //auto 参数必须设置为false
        ,accept:"images"
        ,exts: 'jpg|png|jpeg'
        ,before: function(obj){
            //预读本地文件示例，不支持ie8
            obj.preview(function(index, file, result){
                $('#imgBeforeDisplay').attr('src', result); //图片链接（base64）
            });
        }
        ,choose: function(obj){  //上传前选择回调方法
            var flag = true;
            obj.preview(function(index, file, result){
                console.log(file);            //file表示文件信息，result表示文件src地址
                var img = new Image();
                img.src = result;
                img.onload = function () { //初始化夹在完成后获取上传图片宽高，判断限制上传图片的大小。
                    obj.upload(index, file);
                    // if(img.width ==665 && img.height >= 416){
                    //     obj.upload(index, file); //满足条件调用上传方法
                    // } else if($("#modules").val() == 3 && img.width == 850){
                    //     obj.upload(index, file); //满足条件调用上传方法
                    // }else{
                    //     flag = false;
                    //     if($("#modules").val() == 3){
                    //         conMsg("您上传的图片宽度必须是850尺寸！");
                    //     } else {
                    //         conMsg("您上传的图片宽度必须是665尺寸！");
                    //     }
                    //     return false;
                    // }
                }
                return flag;
            });
        }
        , done: function (res) {//上传成功回调方法
            $("#noticeVal").val(res.fileUrl);
            $("#imgAfterDisplay").attr("src", picHost + res.fileUrl);
        }
    });
});