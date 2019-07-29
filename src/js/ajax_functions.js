(function ($) {
    $(document).ready(function () {
        var ajaxscript = {ajax_url: "src/php/FindDestination.php"}
        $.ajax({
            url: ajaxscript.ajax_url,
            data: {
                // action: 'get_post_info',
                id: _id
            },
            method: 'POST',
            success: function (response) {
                fill_fields(response)
            },
            error: function (error) {
                console.log(error)
            }
        })

        // $("div[data-name='post_item']").on('change', function () {
        //     let _id = get_post_item_id(obj); // call ajax
        //     fill_fields(obj, {"title": "loading..", "excerpt": "loading.."})
        //
        // });

        function fill_fields(res_obj) {
            $(".result").innerHTML(res_obj);
        }
    });
})(jQuery);