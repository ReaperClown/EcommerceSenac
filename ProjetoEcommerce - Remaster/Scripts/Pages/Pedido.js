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

//var pedido_id = "";
var alertPlaceholder = document.getElementById('displayMyAlert');
var myImg;
var count = 0;

$(document).ready(function () {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
    $('#lblAddress').css('display', 'none');
    $("#dropCliente").val('-1');
    $("#dropProduto").val('-1');
    $(".qtdProd").css('display', 'none');

    $("#dropCliente").change(function (event) {
        var id = $("#dropCliente option:selected").val();
        event.preventDefault();
        var ajaxOptions = {
            type: 'POST',
            url: "GetAddress.ashx?id=" + id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: '{}',
            success: function (data) {
                $('#lblAddress').css('display', 'block');
                var endereco = `Endereço:\n\nRua: ${data[0]['Rua']}, Nº ${data[0]['Numero']}\nCEP ${data[0]['CEP']}  ${data[0]['Cidade']}-${data[0]['UF']}`
                if (id != 0) {
                    $('#lblAddress').text(endereco);
                }
                else {
                    $('#lblAddress').text('Cliente não encontrado');
                }
            },
            failure: function (data) {
                console.log(data);
            },
            error: function (data) {
                console.log(data);
            }
        };
        //console.log('my data: ' + ajaxOptions.url + ' ' + JSON.stringify(ajaxOptions.data));
        $.ajax(ajaxOptions);
        return false;
    });

    $('#dropProduto').on('change', function (e) {
        var id = $("#dropProduto option:selected").val();
        event.preventDefault();
        var ajaxOptions = {
            type: 'POST',
            url: "GetProdDetail.ashx?id=" + id,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: '{}',
            success: function (data) {
                $(".qtdProd").css('display', 'inline');
                $("#txtVunit").attr('readonly', true);
                if (id != 0) {
                    $(".qtdProd").text(`Em estoque: ${data[0]['Quantidade']}`);
                    $("#txtVunit").val(`${data[0]['ValorUnitario']}`);
                }
                else {
                    $(".qtdProd").text('Produto não encontrado');
                }
            },
            failure: function (data) {
                console.log(data);
            },
            error: function (data) {
                console.log(data);
            }
        };
        console.log('my data: ' + ajaxOptions.url + ' ' + JSON.stringify(ajaxOptions.data));
        $.ajax(ajaxOptions);
        return false;

        $('.display').text('');
        var ID = $("#dropProduto option:selected").val();
        if (ID.length > 0) {
            var newImage = $('<img />');
            newImage.attr('src', 'GetImage.ashx?id=' + ID);
            newImage.attr('class', 'Img');
            newImage.attr('id', 'myImg');
            $('.display').append(newImage);
        }
        e.preventDefault();
    });

    $("#dialog").dialog({
        dialogClass: "no-close",
        autoOpen: false,
        modal: true,
        height: 600,
        width: 600,
        title: "Imagem",
        buttons: [
            {
                text: "Restaurar",
                click: function () {
                    $(this).dialogExtend("restore");
                }
            },
            {
                text: "Fechar",
                icon: "ui-icon-heart",
                click: function () {
                    $(this).dialog("close");
                }
            }
        ],
        close: function () {
            $('.prodImg').removeClass('prodImgAlt');
        }
    }).dialogExtend({
        "maximizable": true,
        "icons": { "maximize": "ui-icon-arrow-4-diag" },
        "minimizable": true,
        "collapsable": true,
        "dblclick": "collapse",
    });

    $(".imgDiv").click(function () {
        $('#dialog').html('');
        $('#dialog').append($('.display').clone());
        $('.prodImg').addClass('prodImgAlt');
        $('#dialog').dialog('open');
        $('.ui-dialog-buttonset button:last').addClass('btn btn-secondary');
        $('.ui-dialog-buttonset button:first').addClass('btn btn-primary closeImg');
    });

})