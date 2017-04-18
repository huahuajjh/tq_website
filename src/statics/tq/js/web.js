// JavaScript Document

jQuery(document).ready(function() {

    //导航下拉
    /*jQuery(".nav_list li").hover(function(){
        $(this).children().stop(false,true);
        $(this).find(".subclass").show();
    },function(){
        $(this).children().stop(false,true);
        $(this).find(".subclass").hide();
    }); */
    //$('.pro_line .sanji a:odd').addClass("odd");
	
	//导航PAD&PHONE
    $("#menu_chu,#menu-overlay-bg").click(function(){
        $("body").toggleClass("body_py");
    });

    $("#menu-overlay li > a").on("click", function(e) {
        if($("body").hasClass("body_py") && $(this).closest("li").find(".subclass").length > 0) {
            var li = $(this).closest("li");
            $("#menu-overlay li").not(li).removeClass('active');
            li.toggleClass("active");
            e.preventDefault();
        }
    });

    //首页--产品
    jQuery(".pro_area").hover(function(){
        //$(this).children().stop(false,true);
        $(this).find("img").stop(false,true).animate({top:"-5px",left:"-5px"},300);
        $(this).find("img.ico_colorful").stop(false,true).animate({top:"15px",left:"15px"});
    },function(){
        //$(this).children().stop(false,true);
        $(this).find("img").stop(false,true).animate({top:"5px",left:"5px"},300);
        $(this).find("img.ico_colorful").stop(false,true).animate({top:"15px",left:"15px"});
    });

    //首页--案例
    jQuery(".case_tab a").each(function(index){
        jQuery(this).hover(function(){
            jQuery(".case_area").addClass("case_dis");
            jQuery(".case_area:eq("+index+")").removeClass("case_dis");
            jQuery(".case_tab a").removeClass("case_cur");
            jQuery(this).addClass("case_cur");
        })
    })
    /*case_thumb*/
    jQuery(".case_thumb").hover(function(){
        $(this).children().stop(false,true);
        $(this).find("a").fadeIn();
    },function(){
        $(this).children().stop(false,true);
        $(this).find("a").fadeOut();
    });
    //首页--解决方案
    jQuery(".solution_area").hover(function(){
        //$(this).children().stop(false,true);
        $(this).find(".solution_info").stop(false,true).animate({bottom:"0"},400);
        $(this).find(".solution_tit").stop(false,true).animate({top:"-40px"},300);
    },function(){
        //$(this).children().stop(false,true);
        $(this).find(".solution_info").stop(false,true).animate({bottom:"-230px"},400);
        $(this).find(".solution_tit").stop(false,true).animate({top:"-80px"},300);
    });

    /*02--产品终端页*/
   /* jQuery(".function_area").hover(function(){
        $(this).children().stop(false,true);
        $(this).find(".function_video").fadeIn();
    },function(){
        $(this).children().stop(false,true);
        $(this).find(".function_video").fadeOut();
    });*/

    //03--解决方案
    jQuery(".solution_block").hover(function(){
        $(this).children().stop(false,true);
        $(this).children().children().stop(false,true);
        $(this).find(".solution_caption").animate({bottom:"-50px"},200);
        $(this).find(".solution_intro").fadeIn();
        $(this).find(".intro_box").animate({bottom:"40px"},400);
    },function(){
        $(this).children().stop(false,true);
        $(this).children().children().stop(false,true);
        $(this).find(".solution_caption").animate({bottom:"50px"},400);
        $(this).find(".solution_intro").fadeOut();
        $(this).find(".intro_box").animate({bottom:"-40px"},400);
    });

    //06--大数据学院--1活动报道
    $('.data li:odd').addClass("odd");

    //07关于我们--4科学委员会
    jQuery(".committee_area").hover(function(){
        $(this).stop(false,true);
        $(this).animate({top:"-30px"},200);
    },function(){
        $(this).stop(false,true);
        $(this).animate({top:"0px"},200);
    });

    //07关于我们--7加入我们
    jQuery(".part_ico").find("img:nth-of-type(2)").addClass("dis");
    jQuery(".part li").hover(function(){
        $(this).children().stop(false,true);
        $(this).find(".part_ico img:nth-of-type(2)").fadeIn();
    },function(){
        $(this).children().stop(false,true);
        $(this).find(".part_ico img:nth-of-type(2)").fadeOut();
    });

    jQuery(".part li.part_cur .part_ico").find("img:nth-of-type(2)").removeClass("dis");
    jQuery(".part li.part_cur").hover(function(){
        $(this).children().stop(false,true);
        $(this).find(".part_ico img:nth-of-type(2)").fadeIn();
    },function(){
        $(this).children().stop(false,true);
        $(this).find(".part_ico img:nth-of-type(2)").fadeIn();
    });


    /*置顶置底*/
	jQuery('.float li:first-child a').click(function(){
		jQuery('html,body').animate({scrollTop: '0'}, 800);
    });


	   
	
});

//点击div以外的部分 隐藏该div
/*jQuery(document).ready(function() {
    $("body").bind("click",function(e){ 
		var target = $(e.target); 
		if(target.closest(".search_warp").length == 0){ 
			$(".search_warp").hide();
		} 
	})  

});*/

/*产品引导页 begin*/
$(document).ready(function() {
    $(".lead_box").each(function() {
        var sync1 = $(this).find(".lead_info");
        var sync2 = $(this).find(".lead_tab");
        var itemCount = $(this).find(".lead_info > .item").length;
        sync1.owlCarousel({
            singleItem : true,
            slideSpeed : 1000,
            navigation: true,
            pagination:false,
            afterAction : syncPosition,
            responsiveRefreshRate : 200,
        });

        sync2.owlCarousel({
            items : itemCount > 5 ? 5 : itemCount,
            itemsDesktop      : [1199, itemCount > 5 ? 5 : itemCount],
            itemsDesktopSmall     : [979, itemCount > 4 ? 4 : itemCount],
            itemsTablet       : [768, itemCount > 3 ? 3 : itemCount],
            itemsMobile       : [479, itemCount > 2 ? 2 : itemCount],
            pagination:false,
            rewindNav:true,
            responsiveRefreshRate : 100,
            afterInit : function(el){
                el.find(".owl-item").eq(0).addClass("synced");
            }
        });

        function syncPosition(el){
            var current = this.currentItem;
            sync2
                .find(".owl-item")
                .removeClass("synced")
                .eq(current)
                .addClass("synced")
            if(sync2.data("owlCarousel") !== undefined){
                center(current)
            }

        }

        sync2.on("click", ".owl-item", function(e){
            e.preventDefault();
            var number = $(this).data("owlItem");
            sync1.trigger("owl.goTo",number);
        });

        function center(number){
            var sync2visible = sync2.data("owlCarousel").owl.visibleItems;

            var num = number;
            var found = false;
            for(var i in sync2visible){
                if(num === sync2visible[i]){
                    var found = true;
                }
            }

            if(found===false){
                if(num>sync2visible[sync2visible.length-1]){
                    sync2.trigger("owl.goTo", num - sync2visible.length+2)
                }else{
                    if(num - 1 === -1){
                        num = 0;
                    }
                    sync2.trigger("owl.goTo", num);
                }
            } else if(num === sync2visible[sync2visible.length-1]){
                sync2.trigger("owl.goTo", sync2visible[1])
            } else if(num === sync2visible[0]){
                sync2.trigger("owl.goTo", num-1)
            }
        }
    });
});
/*产品引导页 end*/

/*guide_scr*/   
$(document).ready(function () {
	var owl = $("#guide_scr").owlCarousel({
		navigation: true,
		pagination: false, 
		items : 7,  
		itemsDesktop : [1199,6], 
		itemsDesktopSmall : [974,5], 
		itemsTablet: [639,4],
		itemsMobile :[479,3], 
		pnLoop:false,
		rewindNav:true,

	});

	//自动定位
	var curindex = 0;
	var maxindex = 0;
	$(".owl-item").each(function () {
		if ($(this).find("a").attr("class") == "guide_cur") {
			curindex = $(this).index();
		}
		maxindex=$(this).index();
	});
	if (curindex == maxindex) {
		curindex = curindex - 1;
	}
	 owl.trigger("owl.jumpTo", curindex)
	/*owl.goTo(curindex);
	for (var i = 0; i < curindex - 1; i++) {
		owl.trigger('owl.next');
	}*/
});














