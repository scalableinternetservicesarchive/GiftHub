/**
 * Created by btran on 6/4/15.
 */

function init() {
    $.material.init();
}

function showNotifications() {
    PNotify.prototype.options.styling = "fontawesome";
    $('.flash-message').each(function (index) {
        swal($(this).val());
        //new PNotify({
        //    title: 'test',
        //    text: 'test'
        //});
        $(this).remove();
    });
}