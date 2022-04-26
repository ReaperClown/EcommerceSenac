<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormPedido.aspx.cs" Inherits="ProjetoEcommerce___Remaster.FormPedido" %>

<%@ Register Src="~/Components/NavBar.ascx" TagName="navbar" TagPrefix="TNav" %>
<%@ Register Src="~/Components/Footer.ascx" TagName="footer" TagPrefix="TFooter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/css/default.css" rel="stylesheet" />
    <link href="../Content/vendor/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />

    <link href="../Content/css/e-pedido.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.structure.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.theme.css" rel="stylesheet" />

    <style>
        .ui-datepicker-title select {
            display: inline;
            
        }
    </style>
    <title>Pedido</title>
</head>
<body class="d-flex flex-column h-100">
    <form id="form1" runat="server">
        <TNav:navbar ID="myNav" runat="server" />

        <div class="container body-content flex-shrink-0">
            <div class="container body-content">
                <div class="container">
                    <table class="table table-bordered table-responsive align-middle text-center my-table" style="width: 100%;">
                        <tr>
                            <th colspan="4" style="background-color: #b5b5b5">
                                <asp:Label ID="Label1" runat="server" Text="Pedido" Font-Bold="True"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <td style="width: 300px">
                                <asp:Label ID="Label2" runat="server" Text="Cliente"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 300px">
                                <asp:Label ID="Label5" runat="server" Text="Produto"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:DropDownList ID="DropDownList2" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 300px">
                                <asp:Label ID="Label3" runat="server" Text="Tipo de Pagamento"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:DropDownList ID="DropDownList3" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 300px">
                                <asp:Label ID="Label6" runat="server" Text="Quantidade"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 300px">
                                <asp:Label ID="Label4" runat="server" Text="Valor Unitário"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 300px">
                                <asp:Label ID="Label7" runat="server" Text="Subtotal"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 300px">
                                <asp:Label ID="Label8" runat="server" Text="Valor Total"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 300px">
                                <asp:Label ID="Label9" runat="server" Text="Data do Pedido"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <div class="input-group">
                                    <asp:TextBox ID="txtDate" CssClass="form-control datepicker" runat="server"></asp:TextBox>
                                    <span class="input-group-text lbl-date" id="basic-addon1"><i class="fa-solid fa-calendar-days"></i></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 300px">
                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="align-middle" style="width: 275px">
                                <asp:DropDownList ID="DropDownList4" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 300px">
                                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <TFooter:footer ID="myFooter" runat="server" />
    </form>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Content/jquery-ui/jquery-ui.js"></script>
    <script src="../Content/jquery-ui/datepicker-pt-BR.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <script>
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
    </script>
</body>
</html>
