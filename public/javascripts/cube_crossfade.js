;(function($) {
// What does the cube_crossfade plugin do?
$.fn.cube_crossfade = function(options) {

  var defaults = {
    // key : value goes here
		speed : 3000,
		pause : 5000,
		w : "600px", // Sets Default width
		h : "270px" // Sets Default height
  };

  var config = $.extend(defaults, options);

  this.each(function() {
    // sets reference to a variable
    var $this = $(this);
		
		$this.wrap("<div class='cube_crossfade_wrap'></div>");
		
		var $wrapper = $this.parent("div");
		
		$wrapper.css({
			"position" : 'relative',
			"width" : config.w,
			"height" : config.h,
			"overflow" : "hidden"
		});
		
		$this.children('li').css({
			'position' : 'absolute',
			'z-index' : '0',
			'top' : '0px'
		});
		
		var $top = $this.children("li:first-child");
				$top.css({ "z-index" : '2' });
				
		var $timer = window.setInterval(function() {
			var $next = $top.next('li');
			$next.css({ 'z-index' : '1'});
			$top.fadeTo(config.speed, 0, function() {
				$top.css({ 'z-index' : '0'}).remove().appendTo($this).css({ 'opacity' : '1'});
				$next.css({ 'z-index' : '2'});
				$top = $next;
			});
		}, config.pause);
				

  }); // function end

	return this;

};
})(jQuery);
