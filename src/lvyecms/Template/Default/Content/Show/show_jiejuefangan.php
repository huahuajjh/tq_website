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
    <div class="banner_warp" style="background-image: url('{:getCategory(6,'image')}');">
        <div class="container">
            <div class="banner_box">
                <div class="banner_info">
                    <h3 class="sub_tit">{:getCategory(6,'catname')}</h3>
                    <div class="banner_des">{:getCategory(6,'description')}</div>
                </div>
            </div>
        </div>
    </div>
    <!--banner_warp end-->
    <!--container begin-->
    <div class="container">
        <!--article begin-->
        <section class="article" style="padding-bottom: 0; border-bottom: 0;">
            <h6 class="article_tit">{$title}</h6>
            <div class="container-text">
                <div id="content"><textarea style="display:none;">{$content}</textarea></div>
            </div>
        </section>
        <!--article end-->
    </div>
    <!--container end-->
</main>
<!--main end-->


<script type="text/javascript">
editormd.markdownToHTML("content");
</script>
<!--main end-->
<template file="Content/footer.php"/>