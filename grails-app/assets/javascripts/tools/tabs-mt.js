jQuery(function ($) {
    $("#tabs-mt").tabs({
        load: function (event, ui) {
            $('ui.panel').delegate('a', 'click', function (event) {
                $('ui.panel').load(this.href);
                event.preventDefault();
            });
        }
    });
    $("#tabs-info").tabs({
        load: function (event, ui) {
            $('ui.panel').delegate('a', 'click', function (event) {
                $('ui.panel').load(this.href);
                event.preventDefault();
            });
        }
    });
    $("#tabs-menu").tabs({
        load: function (event, ui) {
            $('ui.panel').delegate('a', 'click', function (event) {
                $('ui.panel').load(this.href);
                event.preventDefault();
            });
        }
    });
});