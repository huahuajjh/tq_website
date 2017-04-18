<?php if (!defined('SHUIPF_VERSION')) exit(); ?>
    <!--footer begin-->
    <footer>
        <!--footer_top begin-->
        <div class="footer_top">
            <div class="container clearfix">
                <a href="/" class="col-sm-2 foot_logo"><img src="{:getCustomData(2)}" /></a>
                <ul class="col-sm-7 foot_nav clearfix">
                    <li><a href="{:U('lists', array('catid'=>2))}">{:getCategory(2,'catname')}</a></li>
                    <li><a href="{:U('lists', array('catid'=>6))}">{:getCategory(6,'catname')}</a></li>
                    <li><a href="{:U('lists', array('catid'=>7))}">{:getCategory(7,'catname')}</a></li>
                    <li><a href="{:U('lists', array('catid'=>9))}">{:getCategory(9,'catname')}</a></li>
                    <li><a href="{:U('lists', array('catid'=>10))}">{:getCategory(10,'catname')}</a></li>
                    <li><a href="{:U('lists', array('catid'=>13))}">{:getCategory(12,'catname')}</a></li>
                </ul>
                <ul class="col-sm-3 shared clearfix">
                    <li>
                        <a href="javascript:;" onclick="$('.jiathis_button_qzone').trigger('click');"><img src="{$config_siteurl}statics/tq/images/shared_ico1.png" width="22" height="22" alt="腾讯QQ" /></a>
                    </li>
                    <li>
                        <a href="javascript:;" onclick="$('.jiathis_button_weixin').trigger('click');"><img src="{$config_siteurl}statics/tq/images/shared_ico2.png" width="22" height="22" alt="微信" /></a>
                    </li>
                    <li>
                        <a href="javascript:;" onclick="$('.jiathis_button_tsina').trigger('click');"><img src="{$config_siteurl}statics/tq/images/shared_ico3.png" width="22" height="22" alt="新浪微博" /></a>
                    </li>
                </ul>
            </div>
        </div>
        <!--footer_top end-->
        <div class="foot_bot">
            <p>Copyright©2016 TianQue Keji Corporation All Rights Reserved.&nbsp;&nbsp;蜀ICP备16008841号-1 </p>
        </div>
        <!--float begin-->
        <ul class="float">
            <li>
                <a href="javascript:void(0);" title="返回顶部"><img src="{$config_siteurl}statics/tq/images/float_ico1a.png" width="30" height="30" /><img src="{$config_siteurl}statics/tq/images/float_ico1b.png"
                        width="30" height="30" class="ico_cur" />返回顶部</a>
            </li>
            <li>
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin={:getCustomData(3)}&site=qq&menu=yes" title="在线客服" style="cursor:pointer;">
                    <img src="{$config_siteurl}statics/tq/images/float_ico2a.png" width="30" height="30" />
                    <img src="{$config_siteurl}statics/tq/images/float_ico2b.png" width="30" height="30" class="ico_cur" />
                    在线客服
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" title="热线电话"><img src="{$config_siteurl}statics/tq/images/float_ico3a.png" width="30" height="30" /><img src="{$config_siteurl}statics/tq/images/float_ico3b.png"
                        width="30" height="30" class="ico_cur" />热线电话</a>
                <div class="float_info float_tel">{:getCustomData(4)}</div>
            </li>
            <li>
                <a href="javascript:void(0);" title="微信"><img src="{$config_siteurl}statics/tq/images/float_ico4a.png" width="30" height="30" /><img src="{$config_siteurl}statics/tq/images/float_ico4b.png"
                        width="30" height="30" class="ico_cur" />微信</a>
                <div class="float_info float_ma"><img src="{:getCustomData(5)}" width="136" height="136" />扫一扫<br />立即关注TQ科技公众号</div>
            </li>
        </ul>
        <!--float end-->
    </footer>
    <!--footer end-->
    <!-- JiaThis Button BEGIN -->
    <div class="jiathis_style_32x32" style="display:none">
        <a class="jiathis_button_qzone"></a>
        <a class="jiathis_button_tsina"></a>
        <a class="jiathis_button_weixin"></a>
        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank">更多</a>
    </div>
    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=" charset="utf-8"></script>
    <!-- JiaThis Button END -->
</body>
</html>