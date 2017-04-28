<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<template file="Content/header.php"/>
    <!--main begin-->
    <main style="padding-bottom: 0;">
        <!--focus begin-->
        <div id="focus" class="owl-carousel">
            <content action="lists" catid="1"  order="listorder DESC" moreinfo="1">
              <volist name="data" id="vo">
              <div class="item">
                  <img src="{$vo['showimage']}" width="1920" height="699" />
                  <a <if condition="$vo['golink']">href="{$vo['golink']}"</if> target="_blank">
                      <div class="focus_box">
                          <div class="focus_txt">
                            <!--<img src="{$config_siteurl}statics/tq/image/20160812142214_33841.png" />-->
                          </div>
                      </div>
                  </a>
              </div>
              </volist>
            </content>
        </div>
        <script>
            $(document).ready(function () {
                var owl = $("#focus");
                owl.owlCarousel({
                    navigation: false,
                    singleItem: true,
                    mouseDrag: true,
                    autoPlay: 5000,
                    transitionStyle: "fadeUp" //transitionStyle属性值有goDown&fade&backSlide&fadeUp
                });
            });
        </script>
        <!--focus end-->
        <!--pro begin-->
        <section class="index_sec pro">
            <h3 class="sec_tit">
                <div class="container"><a href="{:U('lists', array('catid'=>2))}"><span>{:getCategory(2,'catname')}</span></a></div>
            </h3>
            <div class="container">
                <!--pro_scr begin-->
                <div id="pro_scr" class="owl-carousel">
                    <get table="category" parentid="2" order="listorder asc">
                        <volist name="data" id="vo">
                        <!--item begin-->
                        <div class="item">
                            <div class="pro_area">
                                <a href="{:U('lists', array('catid'=>2))}#{$vo['letter']}" title="{$vo['catname']}">
                                    <div class="pro_ico">
                                        <u class="cl"></u>
                                        <u class="cr"></u>
                                        <img src="{:getCategory($vo['catid'], 'extend.iconnormal')}" width="95" height="95" alt="{$vo['catname']}" />
                                        <img src="{:getCategory($vo['catid'], 'extend.iconfocus')}" width="75" height="75" alt="{$vo['catname']}" class="ico_colorful" />
                                    </div>
                                    <h4 class="pro_name">{$vo['catname']}</h4>
                                    <div class="pro_des">{$vo['description']}</div>
                                    <p class="pro_more"><span><em>查看详情</em></span></p>
                                </a>
                            </div>
                        </div>
                        <!--item end-->
                        </volist>
                    </get>
                </div>
                <!--pro_scr end-->
                <script>
                    $(document).ready(function () {
                        var owl = $("#pro_scr");
                        owl.owlCarousel({
                            items: 3, //3 items above 1200px browser width
                            itemsDesktop: [1199, 3], //3 items between 1199px and 992px
                            itemsDesktopSmall: [991, 2], // 2 items betweem 991px and 768px
                            itemsTablet: [639, 1],
                            itemsMobile: [479, 1],
                            navigation: false,
                            pagination: true,
                            lazyLoad: true,
                            autoPlay : 3500,
                        });
                    });
                </script>
            </div>
        </section>
        <!--pro end-->
        <!--solution begin-->
        <section class="index_sec solution">
            <h3 class="sec_tit">
                <div class="container"><a href="{:U('lists', array('catid'=>6))}"><span>{:getCategory(6,'catname')}</span></a></div>
            </h3>
            <div class="container">
                <!--solution_scr begin-->
                <div id="solution_scr" class="owl-carousel">
                    <content action="lists" catid="6" order="id DESC">
                        <volist name="data" id="li">
                            <!--item begin-->
                            <div class="item">
                                <div class="solution_area" style="background-image: url('{$li['thumb']}');">
                                    <a href="{$li['url']}">
                                        <div class="solution_info">
                                            <h4 class="solution_tit">{$li['title']}</h4>
                                            <div class="solution_text">
                                                <h4 class="solution_item">{$li['title']}{:getCategory(6,'catname')}</h4>
                                                <div class="solution_des">{$li['description']}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <!--item end-->
                          </volist>
                    </content>
                </div>
                <!--solution_scr end-->
                <script>
                    $(document).ready(function () {
                        var owl = $("#solution_scr");
                        owl.owlCarousel({
                            items: 4, //3 items above 1200px browser width
                            itemsDesktop: [1199, 3], //3 items between 1199px and 992px
                            itemsDesktopSmall: [991, 2], // 2 items betweem 991px and 768px
                            itemsTablet: [639, 2],
                            itemsMobile: [599, 1],
                            navigation: true,
                            pagination: true,
                            lazyLoad: true,
                            //autoPlay : 5000,
                        });
                    });
                </script>
            </div>
        </section>
        <!--solution end-->
        <!--case begin-->
        <section class="index_sec case">
            <h3 class="sec_tit">
                <div class="container"><a href="{:U('lists', array('catid'=>7))}"><span>{:getCategory(7,'catname')}</span></a></div>
            </h3>
            <div class="container">
                <!--case_tab begin-->
                <div class="case_tab clearfix">
                    <get table="category" parentid="7">
                        <volist name="data" id="vo">
                            <a href="{:U('lists', array('catid'=> $vo['catid']))}" <if condition='$key == 0'>class="case_cur"</if>>{$vo['catname']}</a>
                        </volist>
                    </get>
                </div>
                <get table="category" parentid="7">
                    <volist name="data" id="vo">
                        <!--case_tab end-->
                        <div class="case_area clearfix <if condition='$key != 0'>case_dis</if>">
                            <content action="lists" catid="$vo['catid']" order="id DESC" num="1">
                                <volist name="data" id="li">
                                    <div class="case_pic">
                                        <a href="{$li['url']}"><img src="{$li['thumb']}" width="529" height="348" /></a>
                                    </div>
                                </volist>
                            </content>
                            <div class="case_r">
                                <div class="case_info">
                                    <content action="lists" catid="$vo['catid']" order="id DESC" num="1">
                                        <volist name="data" id="li">
                                            <h4 class="case_tit"><a href="{$li['url']}">{$li['title']}</a></h4>
                                            <div class="case_des">{$li['description']}</div>
                                            <a href="{$li['url']}" class="pro_more"><span><em>查看详情</em></span></a>
                                        </volist>
                                    </content>
                                </div>
                                <div class="owl-carousel case_scr">
                                    <content action="lists" catid="$vo['catid']" order="id DESC" num="11">
                                        <volist name="data" id="li">
                                            <if condition='$i != 1'>
                                                <div class="item">
                                                    <div class="case_thumb">
                                                        <img src="{$li['thumb']}" width="202" height="133" />
                                                        <a href="{$li['url']}">
                                                            <p class="case_txt"><span>{$li['title']}</span></p>
                                                        </a>
                                                    </div>
                                                </div>
                                            </if>
                                        </volist>
                                    </content>
                                </div>
                            </div>
                        </div>
                        <!-- all cases end -->
                    </volist>
                </get>
                <script>
                    $(document).ready(function () {
                        var owl = $(".case_scr");
                        owl.owlCarousel({
                            items: 3, //3 items above 1200px browser width
                            itemsDesktop: [1199, 3], //3 items between 1199px and 992px
                            itemsDesktopSmall: [974, 4], // 2 items betweem 991px and 768px
                            itemsTablet: [639, 3],
                            itemsMobile: [479, 2],
                            navigation: true,
                            pagination: false,
                            lazyLoad: true,
                            //autoPlay : 5000,
                        });
                    });
                </script>
            </div>
        </section>
        <!--case end-->
    </main>
    <!--main end-->
<template file="Content/footer.php"/>