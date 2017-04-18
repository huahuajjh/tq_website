<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
<!--main begin-->
<main>
    <!--banner_warp begin-->
    <div class="banner_warp" style="background-image: url('{:getCategory(7,'image')}');"></div>
    <!--banner_warp end-->
    <!--guide_warp begin-->
    <div class="guide_warp">
        <div class="container">
            <h4 class="guide_tit">{:getCategory(7,'catname')}</h4>
            <!--guide_scr begin-->
            <div id="guide_scr" class="owl-carousel">
                <div class="item"><a href="{:U('lists', array('catid'=> 7))}"><span>全部</span></a></div>
                <get table="category" parentid="7">
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
        <!--case_list begin-->
        <ul class="case_list clearfix">
            <content action="lists" catid="$catid" page="$page" num="8" order="id DESC">
                <volist name="data" id="li">
                    <li>
                        <div class="case_show">
                            <a href="{$li['url']}">
                                <img src="{$li['thumb']}" width="270" height="180" />
                            </a>
                        </div>
                        <div class="case_overview">
                            <h5><a href="{$li['url']}">{$li['title']}</a></h5>
                            <div class="overview_des">{$li['description']}</div>
                        </div>
                    </li>
                </volist>
            </content>
        </ul>
        <!--case_list end-->
        <!--page begin-->
        <div class="page clearfix">
            {$pages}     
        </div>
        <!--page end-->
    </div>
    <!--container end-->
</main>
<!--main end-->
<template file="Content/footer.php"/>