$(document).on('rails_admin.dom_ready', function(){
    if($('#attachment_common:checked').length > 0) {
        $('#attachment_attachable_id').hide();
    }
    $('#attachment_common').click(function() {
        $('#attachment_attachable_id').toggle().children('option:eq(0)').prop('selected', true);
    })
});