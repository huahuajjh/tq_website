<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
<!--main begin-->
<main class="main_lead">
    <!--banner_warp begin-->
    <div class="banner_warp" style="background-image: url('{:getCategory(2,'image')}');">
        <div class="container">
            <div class="banner_box">
                <div class="banner_info">
                    <h3 class="sub_tit">{:getCategory(2,'catname')}</h3>
                    <div class="banner_des">{:getCategory(2,'description')}</div>
                </div>
            </div>
        </div>
    </div>
    <!--banner_warp end-->
    <!--pro_lead begin-->
    <div class="pro_lead">
        <div class="container">
            <get table="category" parentid="2" order="listorder asc">
                <volist name="data" id="vo">
                    <div class="lead_box">
                        <h4 class="lead_tit"> <a id="{$vo['letter']}"><img src="{:getCategory($vo['catid'], 'extend.iconnormal')}" width="42" height="42" />{$vo['catname']}</a></h4>
                        <!--lead_area begin-->
                        <div class="lead_area">
                            <!--lead_tab begin-->
                            <div class="owl-carousel lead_tab">
                                <content action="lists" catid="$vo['catid']" order="id DESC">
                                    <volist name="data" id="li">
                                        <div class="item" >
                                            <a href="#" class="tab_block">
                                                <div class="lead_ico">
                                                    <img src="{$li['thumb']}" width="34" height="34" alt="{$li['title']}" />
                                                </div>
                                                {$li['title']}
                                            </a>
                                        </div>
                                    </volist>
                                </content>
                                <!--item begin-->
                                <!--item end-->
                            </div>
                            <!--lead_tab end-->
                            <!--lead_info begin-->
                            <div class="owl-carousel lead_info">
                                <content action="lists" catid="$vo['catid']" order="id DESC">
                                    <volist name="data" id="li">
                                        <div class="item">
                                            <div class="info_block">
                                                <h4 class="lead_item"><a href="{$li['url']}"><span>{$li['title']}</span></a></h4>
                                                <div class="info_des">{$li['description']}</div>
                                            </div>
                                        </div>
                                    </volist>
                                </content>
                            </div>
                            <!--lead_info end-->
                            <!--<p class="lead_more"><a href="#">查看全部</a></p> -->
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