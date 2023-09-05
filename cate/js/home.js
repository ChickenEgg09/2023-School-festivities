jQuery(document).ready(function(){

    $('.navi>li').mouseover(function(){
        $(this).find('.submenu').stop().slideDown(300);
    }).mouseout(function(){
        $(this).find('.submenu').stop().slideUp(300);
    });
	
	var myFullpage = new fullpage('#fullpage', {
		showActiveTooltip: false
	});
});