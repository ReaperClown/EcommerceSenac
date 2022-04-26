$(".datepicker").datepicker({
    inline: true,
    dateFormat: "dd/mm/yy",
    changeMonth: true,
    changeYear: true,
    showAnim: "blind",
    showButtonPanel: true,
    currentText: "Hoje",
    closeText: "Feito"
});

$.datepicker._gotoToday = function (id) {
    $(id).datepicker('setDate', new Date()).datepicker('hide').blur();
};

$(".datepicker").datepicker($.datepicker.regional["pt-BR"]);

$(".ui-datepicker td").each(function () {
    var dateText = $(this).find("a").text();
    $(this).find("a").html("<span>" + dateText + "</span>");
});