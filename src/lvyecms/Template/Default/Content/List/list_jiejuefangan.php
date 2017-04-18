<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
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
        <!--solution_list begin-->
        <ul class="solution_list clearfix">
            <content action="lists" catid="6" order="id DESC">
                <volist name="data" id="li">
                    <li class="col-md-3 col-sm-4 col-xs-6">
                        <div class="solution_block">
                            <div class="solution_pic"><img src="{$li['thumb']}" width="280" height="344" /></div>
                            <h4 class="solution_caption">{$li['title']}</h4>
                            <div class="solution_intro">
                                <div class="intro_box">
                                    <h4><a href="{$li['url']}">{$li['title']}<span>{:getCategory(6,'catname')}</span></a></h4>
                                    <a href="{$li['url']}" class="intro_more">查看详情 ></a>
                                </div>
                            </div>
                        </div>
                    </li>
                </volist>
            </content>
      
        </ul>
        <!--solution_list end-->
    </div>
    <!--container end-->
</main>
<!--main end-->
<template file="Content/footer.php"/>