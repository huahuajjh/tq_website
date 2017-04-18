<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<Admintemplate file="Common/Head"/>
<body class="J_scroll_fixed">
<div class="wrap J_check_wrap">
  <div class="mb10">
    <a href="{:U("Index/add")}" class="btn" title="添加内容"><span class="add"></span>添加内容</a>
  </div>
  <form class="J_ajaxForm" action="" method="post">
    <div class="table_list">
      <table width="100%">
        <colgroup>
        <col width="50">
        <col width="">
        <col width="140">
        <col width="120">
        </colgroup>
        <thead>
          <tr>
            <td align="center">ID</td>
            <td>标题</td>
            <td align="center"><span>时间</span></td>
            <td align="center">管理操作</td>
          </tr>
        </thead>
        <volist name="data" id="vo">
          <tr>
            <td align="center">{$vo.id}</td>
            <td>{$vo.title}</td>
            <td align="center">{$vo.updatetime|date="Y-m-d H:i:s",###}</td>
            <td align="center">
            <?php
              $op = array();
              $op[] = '<a href="'.U("Index/edit",array("id"=>$vo['id'])).'">修改</a>';
              $op[] = '<a href="'.U("Index/delete",array("id"=>$vo['id'])).'" class="J_ajax_del" >删除</a>';
              echo implode(' | ',$op);
              ?>
            </td>
          </tr>
        </volist>
      </table>
      <div class="p10"><div class="pages"> {$Page} </div> </div>
    </div>
  </form>
</div>
</body>
</html>