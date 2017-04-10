(function () {

  var current_user_mail = $('#current_user_mail').text();

  $('.admin_panel .action a').click(function ( event ) {
    var me = $(this);
    event.preventDefault();

    var tr = me.closest('tr');
    var item_user_mail = tr.find('.item_user_mail').text();
    var item_user_status = tr.find('.status').text();

    if (item_user_status == 'admin' ) {
      return alert('Default admin, do not change!');
    }
    $.post( this.href, function( data ) {

      tr.find('.status').text( data.status );
      tr.find('.blocked_date').text( data.blocked_date );

      if (current_user_mail == item_user_mail) {
        alert('Changed your self!');

        location.reload();
      }
    });

  });














})()