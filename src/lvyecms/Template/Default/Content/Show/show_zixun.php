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
    <div class="banner_warp" style="background-image: url('{:getCategory(9,'image')}');">
        <div class="container">
            <div class="banner_box">
                <div class="banner_info">
                    <h3 class="sub_tit">{:getCategory(9,'catname')}</h3>
                    <div class="banner_des">{:getCategory(9,'description')}</div>
                </div>
            </div>
        </div>
    </div>
    <!--banner_warp end-->
    <!--guide_warp begin-->
    <div class="guide_warp">
        <div class="container">
            <h4 class="guide_tit">{:getCategory(9,'catname')}</h4>
            <!--guide_scr begin-->
            <div id="guide_scr" class="owl-carousel">
                <div class="item"><a href="{:U('lists', array('catid'=> 9))}"><span>全部</span></a></div>
                <get table="category" parentid="9">
                    <volist name="data" id="vo">
                        <div class="item"><a href="{:U('lists', array('catid'=> $vo['catid']))}" <if condition="$vo['catid'] == $catid">class="guide_cur"</if>><span>{$vo['catname']}</span></a></div>
                    </volist>
                </get>
            </div>
            <!--guide_scr end-->
        </div>
    </div>
    <!--guide_warp end-->
    <!--container begin-->
    <div class="container">
        <!--article begin-->
        <section class="article">
            <h6 class="article_tit">{$title}</h6>
            <div class="container-text">
                <div id="content"><textarea style="display:none;">{$content}</textarea></div>
            </div>
        </section>
        <!--article end-->
        <!--article_page begin-->
        <ul class="article_page clearfix">
            <li>
                上一条：<pre target="1" msg="已经没有了" />
            </li>
            <li class="article_next">
                下一条：<next target="1" msg="已经没有了" />
            </li>
        </ul>
        <!--article_page end-->
    </div>
    <!--container end-->
</main>
<!--main end-->
<script type="text/javascript">
    editormd.markdownToHTML("content");
</script>
<template file="Content/footer.php"/>