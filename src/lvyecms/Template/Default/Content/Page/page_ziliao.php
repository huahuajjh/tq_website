<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
<style type="text/css">
    .zilaio-list {
        box-sizing: border-box;
    }
    .zilaio-list:after {
        content: "";
        display: block;
        clear: both;
    }
    .zilaio-list a{
        width: 100%;
        float: left;
        position: relative;
        padding: 15px 80px;
        box-sizing: border-box;
        color: #3c4144;
        text-decoration: none;
        height: 89px;
    }
    .zilaio-list a .zilaio-icon-file{
        background-image: url("{$config_siteurl}statics/tq/images/wj.png");
        background-size: 100% 100%;
        height: 42px;
        width: 42px;
        display: block;
        position: absolute;
        left: 20px;
        top: 50%;
        margin-top: -21px;
    }
    .zilaio-list a:hover .zilaio-icon-file{
        background-image: url("{$config_siteurl}statics/tq/images/wj.hover.png");
    }
    .zilaio-list a .zilaio-info-name{
        margin-top: 4px;
        color: #333;
        display: block;
        font-size: 21px;
    }
    .zilaio-list a .zilaio-icon-down{
        background-image: url("{$config_siteurl}statics/tq/images/xz.png");
        width: 26px;
        height: 24px;
        display: block;
        position: absolute;
        right: 20px;
        top: 50%;
        margin-top: -13px;
    }
    .zilaio-list a:hover .zilaio-icon-down{
        background-image: url("{$config_siteurl}statics/tq/images/xz.hover.png");
    }
    @media (max-width: 800px) {
        .lead_box {
            margin: 0 20px;
        }
    }
</style>
<!--main begin-->
<main class="main_lead">
    <!--banner_warp begin-->
    <div class="banner_warp" style="background-image: url('{:getCategory(10,'image')}');">
        <div class="container">
            <div class="banner_box">
                <div class="banner_info">
                    <h3 class="sub_tit">{:getCategory(10,'catname')}</h3>
                    <div class="banner_des">{:getCategory(10,'description')}</div>
                </div>
            </div>
        </div>
    </div>
    <!--banner_warp end-->
    <!--pro_lead begin-->
    <div class="pro_lead">
        <div class="container-text">
            <get table="category" parentid="10">
                <volist name="data" id="vo">
                    <div class="lead_box">
                        <h4 class="lead_tit"> <a id="{$vo['letter']}"><img src="{$config_siteurl}statics/tq/images/wjj.png" width="42" height="42" />{$vo['catname']}</a></h4>
                        <!--lead_area begin-->
                        <div class="zilaio-list">
                            <content action="lists" catid="$vo['catid']" order="id DESC" moreinfo="1">
                                <volist name="data" id="li">
                                    <a href="{$li['wenjian']}" target="__bark">
                                        <span class="zilaio-icon-file"></span>
                                        <span class="zilaio-info">
                                            <span class="zilaio-info-name">{$li['title']}</span>
                                            <small class="zilaio-info-time">发布时间：{$li['updatetime']|date="Y-m-d",###}</small>
                                        </span>
                                        <span class="zilaio-icon-down"></span>
                                    </a>
                                </volist>
                            </content>
                        </div>
                        <!--lead_area end-->
                    </div>
                </volist>
            </get>
        </div>
    </div>
    <!--pro_lead end-->
</main>
<!--main end-->
<template file="Content/footer.php"/>