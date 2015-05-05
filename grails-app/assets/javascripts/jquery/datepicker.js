jQuery(function ($) {
    $("#dateBegin").datetimepicker({
        regional: 'ru',
        showSecond: false,
        timeFormat: 'hh:mm',
        stepHour: 1,
        stepMinute: 5,
        dateFormat: 'dd.mm.yy'
    });
    $("#dateEnd").datetimepicker({
        regional: 'ru',
        showSecond: false,
        timeFormat: 'hh:mm',
        stepHour: 1,
        stepMinute: 5,
        dateFormat: 'dd.mm.yy'
    });
    $("#reportDateBegin").datetimepicker({
        regional: 'ru',
        showSecond: false,
        timeFormat: 'hh:mm',
        stepHour: 1,
        stepMinute: 5,
        dateFormat: 'dd.mm.yy'
    });
    $("#reportDateEnd").datetimepicker({
        regional: 'ru',
        showSecond: false,
        timeFormat: 'hh:mm',
        stepHour: 1,
        stepMinute: 5,
        dateFormat: 'dd.mm.yy'
    });
});