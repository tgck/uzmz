$(document).ready(function() {
	alert("jQuery ready");

    window.setTimeout(function(){
//    	$("iframe, img, section, .box2d").box2d({'y-velocity':9.8, 'x-velocity':-0.05, 'debug':false});
    	$("iframe, img, div.post_content, .box2d").box2d({'y-velocity':9.8, 'x-velocity':-0.05, 'debug':false});
    },500);

});
