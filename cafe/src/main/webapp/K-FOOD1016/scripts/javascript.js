jQuery(document).ready(function(){


    $('.navi>li').mouseover(function(){
        $(this).find('.submenu').stop().slideDown(500);
    }).mouseout(function(){
        $(this).find('.submenu').stop().slideUp(500);
    });

   
    setInterval(function(){
        $('.slidelist').delay(3000);
        $('.slidelist').animate({marginTop:-500});
        $('.slidelist').delay(3000);
        $('.slidelist').animate({marginTop:-900});
        $('.slidelist').delay(3000);
        $('.slidelist').animate({marginTop:0});
    });


    $('.notice li>a:first').click(function(){
        $('.modal').addClass('active');
    })

    $('.btn').click(function(){
        $('.modal').removeClass('active');
    });


});