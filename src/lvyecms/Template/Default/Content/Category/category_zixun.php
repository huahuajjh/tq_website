<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
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
                <div class="item"><a href="{:U('lists', array('catid'=> 9))}" class="guide_cur"><span>全部</span></a></div>
                <?php $catids = array(); ?>
                <get table="category" parentid="9">
                    <volist name="data" id="vo">
                        <?php array_push($catids,  $vo['catid']); ?>
                        <div class="item"><a href="{:U('lists', array('catid'=> $vo['catid']))}"><span>{$vo['catname']}</span></a></div>
                    </volist>
                </get>
                <?php $catids = "catid in (".join(",",$catids).")"; ?>
            </div>
            <!--guide_scr end-->
        </div>
    </div>
    <!--guide_warp end-->
    <!--container begin-->
    <div class="container">
        <!--case_list begin-->
        <ul class="report clearfix">
            <get table="zixun" where="$catids" page="$page" num="8" order="id DESC">
                <volist name="data" id="li">
                    <li>
                        <span class="report_date"><b>{$li['updatetime']|date="d",###}</b><em>{$li['updatetime']|date="Y-m",###}</em></span>
                        <a href="{$li['url']}" class="report_pic">
                            <img src="{$li['thumb']}" width="248" height="154" />
                        </a>
                        <div class="report_info">
                            <h5><a href="{$li['url']}">{$li['title']}</a></h5>
                            <div class="report_des">{$li['description']}</div>
                            <p class="report_date2">{$li['updatetime']|date="Y-m-d",###}</p>
                        </div>
                    </li>
                </volist>
            </get>
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