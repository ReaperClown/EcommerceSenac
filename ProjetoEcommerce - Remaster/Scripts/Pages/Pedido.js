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

var isChanged = false;
$(function () {
    $('#dropProduto').focusin(function () {
        if (!isChanged) {
            $(this).find('option:first').remove();
        }
    });
    $('#dropProduto').change(function () {
        isChanged = true;
    });
    $('#dropProduto').focusout(function () {
        if (!isChanged) {
            $(this).prepend('<option selected="selected" value="0">Selecione o produto</option>');
        }
    });
});

const forms = document.querySelectorAll('table');
const form = forms[0];

Array.from(form.elements).forEach((input) => {
    console.log(input);
});