<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormProduto.aspx.cs" Inherits="ProjetoEcommerce___Remaster.Pages.FormProduto" %>

<%@ Register Src="~/Components/NavBar.ascx" TagName="navbar" TagPrefix="TNav" %>
<%@ Register Src="~/Components/Footer.ascx" TagName="footer" TagPrefix="TFooter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../Content/css/default.css" rel="stylesheet" />
    <link href="../Content/vendor/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />

    <link href="../Content/css/e-produto.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui-full.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.structure-full.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.theme-full.css" rel="stylesheet" />

    <title>Produto</title>
</head>
<body>
    <form id="form1" runat="server">
        <TNav:navbar runat="server" ID="NavBar" />
        <div class="content">
            <div class="container body-content">
                <div class="container">
                    <table class="table table-bordered table-responsive align-middle text-center" style="width: 100%;">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="NOME DO PRODUTO:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNome" CssClass="form-control" runat="server" Width="275px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="QUANTIDADE EM ESTOQUE:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtQtd" runat="server" CssClass="form-control" Width="275px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="VALOR UNITÁRIO:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtVunit" CssClass="form-control" runat="server" Width="275px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="QUANTIDADE LIMITE:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLimit" CssClass="form-control" runat="server" Width="275px" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="DESCRIÇÃO:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server" Width="275px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="IMAGEM:"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="fUpImg" CssClass="filestyle" runat="server" data-size="sm" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right">
                                <button type="button" class="btn btn-success" id="btnInsert" runat="server">Inserir</button>
                            </td>
                            <td colspan="2" style="text-align: left">
                                <asp:Button ID="btnClean" runat="server" CssClass="btn btn-danger" Text="Limpar" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lblResult" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="container">
                <%--
                    <asp:CommandField ShowEditButton="True" />
                    <asp:CommandField ShowSelectButton="True" />
                --%>
                <asp:GridView ID="gvProduto" runat="server" Caption="LISTA DE PRODUTOS JÁ CADASTRADOS:" CssClass="table table-dark caption-top table-bordered table-condensed table-striped table-dark table-responsive table-hover table-produto" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DataSourceProduct" ShowHeaderWhenEmpty="True" OnPreRender="gvProduto_PreRender" OnRowDataBound="gvProduto_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                        <asp:BoundField DataField="quantidade" HeaderText="quantidade" SortExpression="quantidade" />
                        <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
                        <asp:BoundField DataField="valorunitario" HeaderText="valorunitario" SortExpression="valorunitario" />
                        <asp:BoundField DataField="quantidadelimite" HeaderText="quantidadelimite" SortExpression="quantidadelimite" />
                        <asp:TemplateField>
                            <HeaderTemplate>Imagem</HeaderTemplate>
                            <ItemTemplate>
                                <div class="img-container" id="img-placeholder" data-toggle="tooltip" data-placement="top" title="Clique na imagem para redimensioná-la">
                                    <img class="prodImg" src='data:image/jpg;base64,<%# Eval("imagem") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("imagem")) : string.Empty %>' alt="image" />
                                </div>
                                <div class="modal fade" id="imgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <img src='data:image/jpg;base64,<%# Eval("imagem") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("imagem")) : string.Empty %>' alt="image" />
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fechar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div id="dialog" style="display: none"></div>
                <asp:SqlDataSource ID="DataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DBEcommerce %>" SelectCommand="SELECT * FROM [produto]"></asp:SqlDataSource>
            </div>
        </div>
        <TFooter:footer runat="server" ID="Footer" />
    </form>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Content/jquery-ui/jquery-ui-full.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script src="../Scripts/bootstrap-filestyle.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/json2/20160511/json2.min.js"></script>
    <script type="text/javascript">
        $(":file").filestyle({ text: "Procurar" });
        $(":file").filestyle({ placeholder: "Nenhum arquivo selecionado" });

        $(document).ready(function () {
            $("body").tooltip({ selector: '[data-toggle=tooltip]' });

            $("#dialog").dialog({
                dialogClass: "no-close",
                autoOpen: false,
                modal: true,
                height: 600,
                width: 600,
                title: "Imagem",
                buttons: [
                    {
                        text: "Fechar",
                        icon: "ui-icon-heart",
                        click: function () {
                            $(this).dialog("close");
                        }
                    }
                ]
            });
            $("[id*=gvProduto] img").click(function () {
                $('#dialog').html('');
                $('#dialog').append($(this).clone());
                $('#dialog').dialog('open');
                $('.ui-dialog-buttonset button').addClass('btn btn-primary closeImg');

                // <---- Custom Size ---->
                //var width = $("#dialog").dialog("option", "width");
                //$("#dialog").dialog("option", "width", 100);
            });
        });

        $(function () {
            var reader = new FileReader();
            var fileName;
            var contentType;
            $('input[type=file]').change(function () {
                if (typeof (FileReader) != "undefined") {
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    $($(this)[0].files).each(function () {
                        var file = $(this);
                        if (regex.test(file[0].name.toLowerCase())) {
                            fileName = file[0].name;
                            contentType = file[0].type;
                            reader.readAsDataURL(file[0]);
                        } else {
                            alert(file[0].name + " is not a valid image file.");
                            return false;
                        }
                    });
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            });

            $("[id*=btnInsert]").bind("click", function () {
                var byteData = reader.result;
                byteData = byteData.split(';')[1].replace("base64,", "");

                var prod = {};
                prod.Nome = $("[id*=txtNome]").val();
                prod.Quantidade = $("[id*=txtQtd]").val();
                prod.Descricao = $("[id*=txtDesc]").val();
                prod.ValorUnitario = $("[id*=txtVunit]").val();
                prod.QuantidadeLimite = $("[id*=txtLimit]").val();
                prod.Imagem = byteData;
                var ajaxOptions = {
                    type: "POST",
                    url: "Pages/FormProduto.aspx/SaveProd",
                    data: '{Nome: "' + prod.Nome + '", Quantidade: "' + prod.Quantidade + '", Descricao: "' + prod.Descricao + '", ValorUnitario: "' + prod.ValorUnitario + '", QuantidadeLimite: "' + prod.QuantidadeLimite + '", Imagem: "' + prod.Imagem + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("Product has been added successfully.");
                        window.location.reload();
                    },
                    error: (error) => {
                        console.log(JSON.stringify(error));
                    }
                };
                console.log('my data: ' + ajaxOptions.url + ' ' + JSON.stringify(ajaxOptions.data));
                $.ajax(ajaxOptions);
                return false;
            });
        });
    </script>
</body>
</html>
