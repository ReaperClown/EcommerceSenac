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
        .auto-style3 {
            width: 215px;
        }
    </style>
    <title>Pedido</title>
</head>
<body>
    <form id="form1" runat="server">
        <TNav:navbar ID="myNav" runat="server" />

        <div class="content">
            <div class="container body-content">
                <div class="container">
                    <table class="table table-bordered table-responsive align-middle text-center my-table" style="width: 100%;">
                        <tr>
                            <th colspan="4" style="background-color: #b5b5b5">
                                <asp:Label ID="Label1" runat="server" Text="Pedido" Font-Bold="True"></asp:Label>
                            </th>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label2" runat="server" Text="Cliente"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:DropDownList ID="dropCliente" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style3">
                                <asp:Label ID="Label5" runat="server" Text="Produto"></asp:Label>
                            </td>
                            <td class="tdProd">
                                <asp:DropDownList ID="dropProduto" CssClass="form-select" runat="server" DataSourceID="DataSourcePedido" DataTextField="nome" DataValueField="id">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DataSourcePedido" runat="server" ConnectionString="<%$ ConnectionStrings:DBEcommerce - Work %>" SelectCommand="SELECT [id], [nome] FROM [produto]"></asp:SqlDataSource>
                                <img src="https://source.unsplash.com/random/300×300" alt="imagem" width="50" height="50" class="prodImg" id="pImg" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Text="Tipo de Pagamento"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:DropDownList ID="dropPagamento" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style3">
                                <asp:Label ID="Label6" runat="server" Text="Quantidade"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="txtQtd" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Valor Unitário"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="txtVunit" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style3">
                                <asp:Label ID="Label7" runat="server" Text="Subtotal"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="txtSub" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label8" runat="server" Text="Valor Total"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="txtTotal" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style3">
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
                            <td class="auto-style3">
                                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="align-middle" style="width: 275px">
                                <asp:DropDownList ID="DropDownList4" CssClass="form-select" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style3">
                                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td style="width: 275px">
                                <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right">
                                <button class="btn btn-success" runat="server" id="btnInsert">Inserir</button>
                                </td>
                            <td colspan="2" style="text-align: left">
                                <button class="btn btn-danger" runat="server" id="btnClean">Limpar</button>

                                </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div class="table-responsive">
                                    <table class="table table-bordered align-middle text-center my-table" style="width: 600px;" runat="server" id="itemsPedido">
                                    <tr>
                                        <th colspan="4" style="text-transform: uppercase">Items do Pedido</th>
                                    </tr>
                                    <tr>
                                        <th>ID</th>
                                        <th>ID do Pedido</th>
                                        <th>Quantidade</th>
                                        <th>Valor Unitário</th>
                                    </tr>
                                    <tbody>
                                    </tbody>
                                </table>
                                </div>
                            </td>
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
    <script src="../Scripts/Pages/Pedido.js"></script>

    <script>
        var id = document.getElementById('<%= dropProduto.ClientID %>').selectedIndex;
        var pedido_id = "";
        var qtd = document.getElementById('<%= txtQtd.ClientID %>').value;
        var vunit = document.getElementById('<%= txtVunit.ClientID %>').value;
        var alertPlaceholder = document.getElementById('displayMyAlert')
        var count = 0;

        $("#btnInsert").click(function (e) {
            e.preventDefault();

            if (qtd == "" || vunit == "" || id < 0) {
                if (count == 0) {
                    function alert() {
                        var wrapper = document.createElement('div')
                        wrapper.innerHTML = '<div class="alert alert-danger alert-dismissible d-flex align-items-center" id="myAlert" role="alert">' + '<i class="fa-solid fa-triangle-exclamation bi flex-shrink-0 me-2" role="img" aria-label="Danger:"></i>' + '<div>Por favor, preencha todos os campos.</div>' + '<button type="button" id="alertClose" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button></div>'

                        alertPlaceholder.append(wrapper)
                    }
                    alert();
                    count++
                }
                $('#myAlert').on('closed.bs.alert', function (e) {
                    e.preventDefault();
                    count = 0
                });

            }
            else {
                $("#itemsPedido").show();

                var rows = "";

                rows += "<tr><td>" + id + "</td><td>" + pedido_id + "</td><td>" + qtd + "</td><td>" + vunit + "</td></tr>";
                $(rows).appendTo("#itemsPedido tbody");
            }
        });
    </script>
</body>
</html>
