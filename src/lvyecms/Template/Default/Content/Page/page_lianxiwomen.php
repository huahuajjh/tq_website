<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
<link rel="stylesheet" href="{$config_siteurl}statics/editor.md/css/editormd.preview.min.css" />
<link rel="stylesheet" href="{$config_siteurl}statics/editor.md/css/editormd.css" />
<script src="{$config_siteurl}statics/editor.md/lib/marked.min.js"></script>
<script src="{$config_siteurl}statics/editor.md/lib/prettify.min.js"></script>
<script src="{$config_siteurl}statics/editor.md/editormd.min.js"></script>
<style>
    .editormd-preview-container, .editormd-html-preview {
        background: none;
    }
</style>
<!--main begin-->
<main>
    <!--banner_warp begin-->
    <div class="banner_warp" style="background-image: url('{:getCategory(12,'image')}');"></div>
    <!--banner_warp end-->
    <!--guide_warp begin-->
    <div class="guide_warp">
        <div class="container">
            <h4 class="guide_tit">{:getCategory(12,'catname')}</h4>
            <!--guide_scr begin-->
            <div id="guide_scr" class="owl-carousel">
                <div class="item"><a href="{:U('lists', array('catid'=>13))}"><span>{:getCategory(13,'catname')}</span></a></div>
                <div class="item"><a href="{:U('lists', array('catid'=>15))}"><span>{:getCategory(15,'catname')}</span></a></div>
                <div class="item"><a href="{:U('lists', array('catid'=>14))}" class="guide_cur"><span>{:getCategory(14,'catname')}</span></a></div>
            </div>
            <!--guide_scr end-->
        </div>
    </div>
    <!--guide_warp end-->
    <!--container begin-->
    <div class="container-text">
        <!--intro begin-->
        <div id="content"><textarea style="display:none;">{:getCustomData(8)}</textarea></div>
        <!--intro end-->
    </div>
    <!--container end-->
</main>
<!--main end-->
<script type="text/javascript">
    editormd.markdownToHTML("content");
</script>
<template file="Content/footer.php"/>