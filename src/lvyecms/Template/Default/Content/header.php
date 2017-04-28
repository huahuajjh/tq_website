<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <link rel="icon" href="{:getCustomData(6)}" type="image/x-icon">
    <link rel="shortcut icon" href="{:getCustomData(6)}" type="image/x-icon">
    <title><if condition=" isset($SEO['title']) && !empty($SEO['title']) ">{$SEO['title']}</if>{$SEO['site_title']}</title>
    <meta name="description" content="{$SEO['description']}" />
    <meta name="keywords" content="{$SEO['keyword']}" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="format-detection" content="email=no" />
    <meta name="HandheldFriendly" content="true" />
    <script type="text/javascript" src="{$config_siteurl}statics/tq/js/jquery.min.js"></script>
    <script type="text/javascript" src="{$config_siteurl}statics/tq/js/owl.carousel.js"></script>
    <link rel="stylesheet" href="{$config_siteurl}statics/tq/css/owl.carousel.css" />
    <link rel="stylesheet" href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" />
    <script type="text/javascript" src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="{$config_siteurl}statics/tq/js/web.js"></script>
    <link rel="stylesheet" href="{$config_siteurl}statics/tq/css/animate.min.css" />
    <link rel="stylesheet" href="{$config_siteurl}statics/tq/css/shared.css" />
    <link rel="stylesheet" href="{$config_siteurl}statics/tq/css/style.css" />
    <!--图片延迟加载-->
    <script type="text/javascript" src="{$config_siteurl}statics/tq/js/jquery.lazyload.js"></script>
    <script type="text/javascript">
        jQuery(function () {
            jQuery("img").lazyload({ effect: "fadeIn" });
        });
    </script>
</head>
<body>
    <div id="menu-overlay-bg"></div>
    <!--header begin-->
    <header>
        <div class="container clearfix">
            <a href="/" class="logo"><img src="{:getCustomData(1)}" /></a>
            <!--nav_list begin-->
            <div id="menu-overlay">
                <ul class="nav_list">
                    <li><a href="/" class="nav_item0">首 页</a></li>
                    <li>
                        <a href="{:U('lists', array('catid'=>2))}" class="nav_item0">{:getCategory(2,'catname')}</a>
                        <!--subclass begin  产品的下拉菜单样式与其他不同-->
                        <div class="subclass subclass_pro">
                            <div class="container clearfix">
                                <get table="category" parentid="2" order="listorder asc">
                                    <volist name="data" id="vo">
                                    <div class="pro_line">
                                        <a href="{:U('lists', array('catid'=>2))}#{$vo['letter']}" class="erji"><img src="{:getCategory($vo['catid'], 'extend.iconnormal')}" width="22" height="22" /><span>{$vo['catname']}</span></a>
                                        <div class="sanji">
                                            <content action="lists" catid="$vo['catid']" order="id DESC">
                                                <volist name="data" id="li">
                                                    <a href="{$li['url']}"><span><img src="{$li['thumb']}" width="22" height="22" class="simg">{$li['title']}</span></a>
                                                </volist>
                                            </content>
                                        </div>
                                    </div>
                                    </volist>
                                </get>
                            </div>
                        </div>
                        <!--subclass end-->
                    </li>
                    <li>
                        <a href="{:U('lists', array('catid'=>6))}" class="nav_item0">{:getCategory(6,'catname')}</a>
                    </li>
                    <li>
                        <a href="{:U('lists', array('catid'=>7))}" class="nav_item0">{:getCategory(7,'catname')}</a>
                    </li>
                    <li>
                        <a href="{:U('lists', array('catid'=>9))}" class="nav_item0">{:getCategory(9,'catname')}</a>
                        <!--subclass begin-->
                        <div class="subclass">
                            <div class="container clearfix">
                                <get table="category" parentid="9">
                                    <volist name="data" id="vo">
                                        <a href="{:U('lists', array('catid'=>$vo['catid']))}"><span>{$vo['catname']}</span></a>
                                    </volist>
                                </get>
                            </div>
                        </div>
                        <!--subclass end-->
                    </li>
                    <li>
                        <a href="{:U('lists', array('catid'=>10))}" class="nav_item0">{:getCategory(10,'catname')}</a>
                    </li>
                    <li>
                        <a href="{:U('lists', array('catid'=>13))}" class="nav_item0">{:getCategory(12,'catname')}</a>
                        <!--subclass begin-->
                        <div class="subclass">
                            <div class="container clearfix">
                                <a href="{:U('lists', array('catid'=>13))}"><span>{:getCategory(13,'catname')}</span></a>
                                <a href="{:U('lists', array('catid'=>15))}"><span>{:getCategory(15,'catname')}</span></a>
                                <a href="{:U('lists', array('catid'=>14))}"><span>{:getCategory(14,'catname')}</span></a>
                            </div>
                        </div>
                        <!--subclass end-->
                    </li>
                </ul>
            </div>
            <!--nav_list end-->
            <!--menu-activator begin pad&phone导航弹出按钮-->
            <a class="menu-activator" id="menu_chu">
                <span class="descriptor">Menu</span>
                <div class="visual">
                    <i class="line line01"></i>
                    <i class="line line02"></i>
                    <i class="line line03"></i>
                    <i class="line line04"></i>
                </div>
            </a>
            <!--menu-activator end-->
            <!--menu-overlay begin pad&phone导航内容-->
            <!--menu-overlay end-->
        </div>
    </header>
    <!--header end-->