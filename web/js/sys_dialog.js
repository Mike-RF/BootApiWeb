/**
 * JS 弹出提示
 * Created by jinhui on 2014/9/23.
 */
var icons={
    error:"error",
    loading:"loading",
    question:"question",
    succeed:"succeed",
    warning:"warning"
}
function conTip(msg){
    conTip(msg,icons.succeed,false);
}
/**
 * 倒计时自动关闭提示（不锁屏）
 * @param msg 提示信息
 * @param icon ICON图标
 */
function conTip(msg,icon,isRef) {
    conTipLock(msg,icon,isRef,null);
}
function conTip(msg,icon,isRef,url){
    var timer;
    art.dialog({
        id: 'tipdialog',
        icon: icon,
        fixed: true,
        drag: false,
        left:'50%',
        top:'150px',
        resize: false,
        content: msg,
        ok:function(){
            if(isRef){
                if(url==null) {
                    location.reload();
                }else{
                    location.href=url;
                }
            }
        },
        okVal:'确定',
        close: function () {
            if(isRef){
                if(url==null) {
                    window.location.reload();
                }else{
                    window.location.href=url;
                }
            }
        }
    }).show();
}
function conTipLock(msg){
    conTip(msg,icons.succeed);
}
function conTipLock(msg,icon,isRef) {
    conTipLock(msg,icon,isRef,null);
}
/**
 * 倒计时自动关闭提示（带锁屏）
 * @param msg 提示信息
 * @param icon ICON图标
 */
function conTipLock(msg,icon,isRef,url){
    art.dialog({
        lock: true,
        background: '#000', // 背景色
        opacity: 0.66,	// 透明度
        id: 'tipdialog',
        icon: icon,
        fixed: true,
        drag: false,
        left:'50%',
        top:'150px',
        resize: false,
        content: msg,
        ok:function(){
            if(isRef){
                if(url==null) {
                    window.location.reload();
                }else{
                    window.location.href=url;
                }
            }
        },
        okVal:'确定',
        close: function () {
            if(isRef){
                if(url==null) {
                    window.location.reload();
                }else{
                    window.location.href=url;
                }
            }
        }
    }).show();
}

artDialog.prompt = function (content, yes, placeholder, value) {
    value = value || '';
    placeholder = placeholder || '';
    var input;

    return artDialog({
        id: 'Prompt',
        icon: 'question',
        fixed: true,
        lock: true,
        opacity: .1,
        content: [
            '<div style="margin-bottom:5px;font-size:12px">',
                content,
            '</div>',
            '<div>',
                '<input value="',
                    value,
                '" placeholder="',
                    placeholder,
                '" maxlength="6" style="width:18em;padding:3px" />',
            '</div>'
        ].join(''),
        init: function () {
            input = this.DOM.content.find('input')[0];
            input.select();
            input.focus();
        },
        ok: function (here) {
            return yes && yes.call(this, input.value, here);
        },
        cancel: true
    });
};

/*
 * 带关闭按钮提示
 */
function conCancel(msg){
    conCancel(msg,icons.succeed,'关闭');
}
function conCancel(msg,btnName){
    conCancel(msg,icons.succeed,btnName);
}
/**
 * 提示信息（不锁屏）
 * @param msg 需要提示的信息
 * @param icon ICON图标
 * @param btnName 关闭按钮名称
 */
function conCancel(msg,icon,btnName){
    art.dialog({
        icon: icon,
        content: msg,
        fixed: true,
        drag: false,
        left:'50%',
        top:'150px',
        resize: false,
        cancelVal: btnName,
        cancel: true //为true等价于function(){}
    });
}
function conCancelLock(msg){
    conCancel(msg,icons.succeed,'关闭');
}
function conCancelLock(msg,btnName){
    conCancel(msg,icons.succeed,btnName);
}
/**
 * 提示信息（带锁屏）
 * @param msg 需要提示的信息
 * @param icon ICON图标
 * @param btnName 关闭按钮名称
 */
function conCancelLock(msg,icon,btnName){
    art.dialog({
        lock: true,
        background: '#000', // 背景色
        opacity: 0.66,	// 透明度
        icon: icon,
        fixed: true,
        drag: false,
        left:'50%',
        top:'150px',
        resize: false,
        content: msg,
        cancelVal: btnName,
        cancel: true //为true等价于function(){}
    });
}
/**
 * 带分享功能提示
 * @param msg
 * @param icon
 * @param isRef
 * @param url
 */
function tipShare(msg,icon,isRef,url){
    art.dialog({
        lock: true,
        background: '#000', // 背景色
        opacity: 0.66,	// 透明度
        id: 'tipdialog',
        icon: icon,
        fixed: true,
        drag: false,
        left:'50%',
        top:'150px',
        resize: false,
        content: msg,
        cancelVal: btnName,
        cancel: function(){
            if(isRef){
                if(url==null) {
                    window.location.reload();
                }else{
                    window.location.href=url;
                }
            }
        },
        ok:function(){
            if(isRef){
                if(url==null) {
                    window.location.reload();
                }else{
                    window.location.href=url;
                }
            }
        },
        okVal:'确定',
        close: function () {
            if(isRef){
                if(url==null) {
                    window.location.reload();
                }else{
                    window.location.href=url;
                }
            }
        }
    }).show();
}