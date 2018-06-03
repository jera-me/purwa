/*
Template Name: MaxRank
Author: TrendyTheme
Version: 1.0
*/

;(function () {

	"use strict"; // use strict to start

	$(document).ready(function () {

		/* === back To Top === */
		$('.backToTop').click(function (e) {
		    e.preventDefault();
		    $("html, body").animate({
		        scrollTop: 0
		    }, 600);
		    return false;
		});

		
        /* ======= Contact Form ======= */
        $('#contactForm').on('submit',function(e){

            e.preventDefault();

            var $action = $(this).prop('action');
            var $data = $(this).serialize();
            var $this = $(this);

            $this.prevAll('.alert').remove();

            $.post( $action, $data, function( data ) {

                if( data.response=='error' ){

                    $this.before( '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button> <i class="fa fa-times-circle"></i> '+data.message+'</div>' );
                }

                if( data.response=='success' ){

                    $this.before( '<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><i class="fa fa-thumbs-o-up"></i> '+data.message+'</div>' );
                    $this.find('input, textarea').val('');
                }

            }, "json");

        });
		

	});
})(jQuery);
