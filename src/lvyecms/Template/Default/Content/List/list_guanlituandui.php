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
<main style="background: none; background-color:#525156;">  <!-- TODO xhy -->
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
                <div class="item"><a href="{:U('lists', array('catid'=>15))}" class="guide_cur"><span>{:getCategory(15,'catname')}</span></a></div>
                <div class="item"><a href="{:U('lists', array('catid'=>14))}"><span>{:getCategory(14,'catname')}</span></a></div>
            </div>
            <!--guide_scr end-->
        </div>
    </div>
    <!--guide_warp end-->
    <!--container begin-->
    <div class="container">
        <!--manager begin-->
        <style type="text/css"> <!-- TODO xhy -->
            .manager {
                margin-top: 10px;
            }

            .manager > li{
                height: 150px;
                margin-bottom: 46px;
                background: #666667;
                border: none;
                -webkit-box-shadow: 0px 5px 15px 0px rgb(70, 70, 70);
                -moz-box-shadow: 0px 5px 15px 0px rgb(70, 70, 70);
                box-shadow: 0px 5px 15px 0px rgb(70, 70, 70);
                border-radius: 150px 20px 20px 150px;
                position: relative;
                padding-left: 180px;
                overflow: hidden;
            }

            .manager .box-img {
                width: 150px;
                height: 150px;
                background-size: 100%;
                background-repeat: no-repeat;
                border-radius: 150px;
                position: absolute;
                top: 0;
                left: 0;
            }

            .manager_info {
                overflow: hidden;
                padding: 30px 51px 30px 0;
                height: 150px;
                color: #ffffff;
                font-size: 1.3rem;
                line-height: 25px;
            }
            /*手机*/
            @media screen and (max-width:600px){

                .manager > li{
                    border-radius: 10px;
                    height: auto;
                    margin-top: 50px;
                    overflow: inherit;
                    padding-left: 0;
                }

                .manager .box-img {
                    margin-top: -45px;
                    width: 90px;
                    height: 90px;
                    left: 50%;
                    top: 0;
                    margin-left: -45px;
                }

                .manager_info {
                    height: auto;
                    min-height: 150px;
                    padding: 60px 10px 20px 10px;
                }
            }
        </style>
        <ul class="manager clearfix container-text"> <!-- TODO xhy -->
            <content action="lists" catid="$catid" moreinfo="1" page="$page" num="8" order="id DESC">
                <volist name="data" id="li">
                    <li>
                        <div class="box-img" style="background-image: url('{$li['thumb']}');"></div>
                        <div class="manager_info" id="content_{$li['id']}">
                            <textarea style="display:none;">{$li['content']}</textarea>
                        </div>
                    </li>
                </volist>
            </content>
        </ul>
        <!--manager end-->
    </div>
    <!--container end-->
</main>
<!--main end-->
<script type="text/javascript">
    <content action="lists" catid="$catid" moreinfo="1" page="$page" num="8" order="id DESC">
        <volist name="data" id="li">
            editormd.markdownToHTML("content_{$li['id']}");
        </volist>
    </content>
</script>
<template file="Content/footer.php"/>