<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
<link rel="stylesheet" href="{$config_siteurl}statics/editor.md/css/editormd.preview.min.css" />
<link rel="stylesheet" href="{$config_siteurl}statics/editor.md/css/editormd.css" />
<script src="{$config_siteurl}statics/editor.md/lib/marked.min.js"></script>
<script src="{$config_siteurl}statics/editor.md/lib/prettify.min.js"></script>
<script src="{$config_siteurl}statics/editor.md/editormd.min.js"></script>
<!--main begin-->
<main class="main_pro">
  <!--banner_warp begin-->
  <div class="banner_warp" style="background-image: url('{:getCategory(2,'image')}');">
    <div class="container">
      <div class="banner_box">
        <div class="banner_info">
          <h3 class="sub_tit">{$title}</h3>
          <div class="banner_des">{$description}</div>
        </div>
      </div>
    </div>
  </div>
  <!--banner_warp end-->
  <!--pro_lead begin-->
  <div class="pro_end">
    <?php
      $catname = getCategory(2,'catname');
      $catname = str_replace(" ","", $catname);
    ?>
    <!--优势 begin-->
    <section class="pro_sec">
      <div class="container clearfix">
        <h6 class="end_tit">{$catname}优势</h6>
        <!--advance begin-->
        <div class="advance clearfix container-text">
            <div id="superiority"><textarea style="display:none;">{$superiority}</textarea></div>
        </div>
        <!--advance end-->
      </div>
    </section>
    <!--优势 end-->
    <!--功能 begin-->
    <section class="pro_sec">
      <div class="container clearfix">
        <h6 class="end_tit">{$catname}功能</h6>
        <!--advance begin-->
        <div class="advance clearfix container-text">
            <div id="feature"><textarea style="display:none;">{$feature}</textarea></div>
        </div>
        <!--advance end-->
      </div>
    </section>
    <!--功能 end-->
    <!--应用场景 begin-->
    <section class="pro_sec">
      <div class="container clearfix">
        <h6 class="end_tit">应用场景</h6>
        <div class="scene clearfix container-text">
          <div id="applicationscene"><textarea style="display:none;">{$applicationscene}</textarea></div>
        </div>
      </div>
    </section>
    <!--应用场景 end-->
  </div>
  <!--pro_lead end-->
</main>
<script type="text/javascript">
editormd.markdownToHTML("superiority");
editormd.markdownToHTML("feature");
editormd.markdownToHTML("applicationscene");
</script>
<!--main end-->
<template file="Content/footer.php"/>