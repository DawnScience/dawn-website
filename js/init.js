(function ($) {

    $.fn.parallax = function () {
      var window_width = $(window).width();
      // Parallax Scripts
      return this.each(function(i) {
        var $this = $(this);
        $this.addClass('parallax');

        function updateParallax(initial) {
          var container_height;
          if (window_width < 601) {
            container_height = ($this.height() > 0) ? $this.height() : $this.children("img").height();
          }
          else {
            container_height = ($this.height() > 0) ? $this.height() : 500;
          }
          var $img = $this.children(".parallax-img").first();
          var img_height = $img.height();
          var parallax_dist = img_height - container_height;
          var bottom = $this.offset().top + container_height;
          var top = $this.offset().top;
          var scrollTop = $(window).scrollTop();
          var windowHeight = window.innerHeight;
          var windowBottom = scrollTop + windowHeight;
          var percentScrolled = (windowBottom - top) / (container_height + windowHeight);
          var parallax = Math.round((parallax_dist * percentScrolled));

          if (initial) {
            $img.css('display', 'block');
          }
          if ((bottom > scrollTop) && (top < (scrollTop + windowHeight))) {
            $img.css('transform', "translate3D(0%," + parallax + "px, 0)");
          }

        }
        updateParallax(true);
        
        $(window).scroll(function() {
          window_width = $(window).width();
          updateParallax(false);
        });

        $(window).resize(function() {
          window_width = $(window).width();
          updateParallax(false);
        });

      });

    };
}( jQuery ));


$(document).ready(function(){
  $('.parallax').parallax();
  $(".button-collapse").sideNav();

  // Make Search Appear
  $('#search-button').click(function(){
    if( $('.search-wrapper').hasClass('active') ){

      $(this).parent('li').removeClass("active");
      $('.search-wrapper').removeClass("active");
      $('.search-results-wrapper').removeClass("active");
      $('#search').val("");

    }else{
      $(this).parent('li').addClass("active");
      $('.search-wrapper').addClass("active");

      $('.search-wrapper input').focus();
    }
  });

  //Contact form
  // Set up an event listener for the contact form.
  $('#contact-form').submit(function(event) {
      // Stop the browser from submitting the form.
      event.preventDefault();

      var formData = $(this).serialize();

      $.ajax({
        type: 'POST',
        url: 'http://localhost:8888/dawnfeedback',
        data: formData
      }).done(function(response) {
        $('#contact-form').addClass('submitted');
        $('#contact-form-message').addClass('success');
      }).fail(function(){
        $('#contact-form-message').addClass('error');
      });


  });


  //Animated scrolling
  $('a[href^="#"]').on('click',function (e) {
      e.preventDefault();

      var target = this.hash;
      var $target = $(target);

      $('html, body').stop().animate({
          'scrollTop': $target.offset().top
      }, 900, 'swing', function () {
          window.location.hash = target;
      });
  });

});