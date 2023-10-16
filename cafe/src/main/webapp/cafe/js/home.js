jQuery(document).ready(function(){

    $('.navi>li').mouseover(function(){
        $(this).find('.submenu').stop().slideDown(300);
    }).mouseout(function(){
        $(this).find('.submenu').stop().slideUp(300);
    });
    
    setInterval(function(){
        $('.slidelist').delay(3000)
        $('.slidelist').animate({marginLeft: "-100%"})
        $('.slidelist').delay(3000)
        $('.slidelist').animate({marginLeft: "-200%"})
        $('.slidelist').delay(3000)
        $('.slidelist').animate({marginLeft: 0})
    });
	
	var myFullpage = new fullpage('#fullpage', {
		showActiveTooltip: false
	});
});