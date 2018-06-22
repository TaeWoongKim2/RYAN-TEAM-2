
jQuery(function($) {
  'use strict';

  //Responsive Nav
  $('li.dropdown').find('.fa-angle-down').each(function() {
    $(this).on('click', function() {
      if ($(window).width() < 768) {
        $(this).parent().next().slideToggle();
      }
      return false;
    });
  });

  //Fit Vids
  if ($('#video-container').length) {
    $("#video-container").fitVids();
  }

  //Initiat WOW JS
  new WOW().init();

  // portfolio filter
  $(window).load(function() {

    $('.main-slider').addClass('animate-in');
    $('.preloader').remove();
    //End Preloader

    if ($('.masonery_area').length) {
      $('.masonery_area').masonry(); //Masonry
    }

    var $portfolio_selectors = $('.portfolio-filter >li>a');

    if ($portfolio_selectors.length) {

      var $portfolio = $('.portfolio-items');
      $portfolio.isotope({
        itemSelector: '.portfolio-item',
        layoutMode: 'fitRows'
      });

      $portfolio_selectors.on('click', function() {
        $portfolio_selectors.removeClass('active');
        $(this).addClass('active');
        var selector = $(this).attr('data-filter');
        $portfolio.isotope({
          filter: selector
        });
        return false;
      });
    }

  });
  
  /* scroll overflow controller */
  $(window).scroll(function(){
	  if($(window).scrollTop() == ($(document).height()-$(window).height())){
		  //스크롤 끝에 닿으면 이벤트 발생
		  var overflowPosition = $("#floatMenu");
		  overflowPosition.data('extenddiv',overflowPosition.css('top')).animate({top:1185 + "px"});
		  //끝에 닿는 순간 해당 좌표로 이동..
	
	  }
  });


  $('.timer').each(count);

  function count(options) {
    var $this = $(this);
    options = $.extend({}, options || {}, $this.data('countToOptions') || {});
    $this.countTo(options);
  }

  // Search
  $('.fa-search').on('click', function() {
    $('.field-toggle').fadeToggle(200);
  });

  // Contact form
  var form = $('#main-contact-form');
  form.submit(function(event) {
    event.preventDefault();
    var form_status = $('<div class="form_status"></div>');
    $.ajax({
      url: $(this).attr('action'),
      beforeSend: function() {
        form.prepend(form_status.html('<p><i class="fa fa-spinner fa-spin"></i> Email is sending...</p>').fadeIn());
      }
    }).done(function(data) {
      form_status.html('<p class="text-success">Thank you for contact us. As early as possible  we will contact you</p>').delay(3000).fadeOut();
    });
  });

  // Progress Bar
  $.each($('div.progress-bar'), function() {
    $(this).css('width', $(this).attr('data-transition') + '%');
  });

  if ($('#gmap').length) {
    var map;

    map = new GMaps({
      el: '#gmap',
      lat: 43.04446,
      lng: -76.130791,
      scrollwheel: false,
      zoom: 16,
      zoomControl: false,
      panControl: false,
      streetViewControl: false,
      mapTypeControl: false,
      overviewMapControl: false,
      clickable: false
    });

    map.addMarker({
      lat: 43.04446,
      lng: -76.130791,
      animation: google.maps.Animation.DROP,
      verticalAlign: 'bottom',
      horizontalAlign: 'center',
      backgroundColor: '#3e8bff',
    });
  }

  $(document).ready(function() {
    // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
    var floatPosition = parseInt($("#floatMenu").css('top'));
    var footerPosition = $("#footer").offset();
    // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

    $(window).scroll(function() {
      // 현재 스크롤 위치를 가져온다.
      var scrollTop = $(window).scrollTop();
      var newPosition = scrollTop + floatPosition - 500 + "px";
      var fixedpositon = floatPosition + "px";
      //console.log(scrollTop);
      // 애니메이션 없이 바로 따라감
      if ($(this).scrollTop() <= 500)
        //scrollTop.toFixed();
        $("#floatMenu").css("top","0px");
      else
        $("#floatMenu").css('top', newPosition);

    }).scroll();

  });
});
