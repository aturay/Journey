(function () {

  $('.admin_panel .action a').click(function ( event ) {
    event.preventDefault();
    var me = $(this);

    $.post( this.href, function( data ) {
      me.closest('tr').find('.status').text( data.status );
    });

  });














})()