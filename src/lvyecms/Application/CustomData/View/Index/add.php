<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<Admintemplate file="Common/Head"/>
<body class="J_scroll_fixed">

<link rel="stylesheet" href="{:CONFIG_SITEURL_MODEL}statics/editor.md/css/editormd.css" />
<script type="text/javascript"  src="{:CONFIG_SITEURL_MODEL}statics/editor.md/editormd.js"></script>

<script type="text/javascript">
//编辑器路径定义
var editorURL = GV.DIMAUB;
</script>
<script type="text/javascript"  src="{:CONFIG_SITEURL_MODEL}statics/js/ueditor/editor_config.js"></script>
<script type="text/javascript"  src="{:CONFIG_SITEURL_MODEL}statics/js/ueditor/editor_all_min.js"></script>
<script type="text/javascript" src="{:CONFIG_SITEURL_MODEL}statics/js/content_addtop.js"></script>
<div class="wrap J_check_wrap">
  <div class="mb10">
    <div class="nav">
        <div class="return"><a href="javascript:window.history.back();">返回</a></div>
    </div>
  </div>
  <div class="h_a">字段属性</div>
  <form name="myform" class="J_ajaxForm" action="{:U("Index/add")}" method="post" onsubmit="return isSubmit();">
  <div class="table_full">
  <table width="100%" class="table_form contentWrap">
      <tr>
        <th width="250"><font color="red">*</font> <strong>数据类型</strong><br /></th>
        <td><select name="typeid" id="typeid" onChange="javascript:field_setting(this.value);">
            <option value='' selected>请选择数据类型</option>
            <volist name="all_field" id="vo">
            <option value="{$key}" >{$vo}</option>
            </volist>
          </select></td>
      </tr>
      <tr>
        <th><font color="red">*</font> <strong>标题</strong></th>
        <td><input type="text" name="title" id="title" size="60" class="input"></td>
      </tr>
      <tr>
        <th><font color="red">*</font>  <strong>录入数据</strong></th>
        <td><div id="setting"></div></td>
      </tr>
    </table>
  </div>
  <div class="btn_wrap">
      <div class="btn_wrap_pd">             
        <button class="btn btn_submit mr10 J_ajax_submit_btn" type="submit">添加</button>
      </div>
    </div>
  </form>
</div>
<script type="text/javascript">
function field_setting(fieldtype) {
    if (fieldtype == "") {
        return false;
    }
    $.get("{:U('Index/getForm')}",{fieldtype:fieldtype}, function (data) {
        $('#setting').html(data);
    });
}
function isSubmit() {
  if(!$('[name="typeid"]').val() || !$('[name="title"]').val() || !$('[name="data"]').val()) {
    return false;
  }
  return true;
}
</script>
</body>
</html>