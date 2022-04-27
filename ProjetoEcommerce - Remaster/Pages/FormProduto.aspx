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

    <link href="../Content/css/produto.css" rel="stylesheet" />
    <%--<link href="../Content/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.structure.css" rel="stylesheet" />
    <link href="../Content/jquery-ui/jquery-ui.theme.css" rel="stylesheet" />--%>

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
                                <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-success" Text="Inserir" OnClick="btnInsert_Click" UseSubmitBehavior="False" />
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
                        <asp:BoundField DataField="imagem" HeaderText="imagem" SortExpression="imagem" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:DBEcommerce %>" SelectCommand="SELECT * FROM [produto]"></asp:SqlDataSource>
            </div>
        </div>
        <TFooter:footer runat="server" ID="Footer" />
    </form>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/json2/20160511/json2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/bootstrap-filestyle.min.js"></script>
    <script src="../Scripts/popper.min.js"></script>
    <script type="text/javascript">
        $(":file").filestyle({ text: "Procurar" });
        $(":file").filestyle({ placeholder: "Nenhum arquivo selecionado" });
    </script>
</body>
</html>
