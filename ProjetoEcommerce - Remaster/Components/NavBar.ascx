<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="ProjetoEcommerce___Remaster.NavBar" %>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" runat="server" href="~/">
            <img src="../Content/img/ecommerce-icon.png" alt="Ecommerce Logo" width="30" height="30" class="d-inline-block align-text-top" />
            Projeto Ecommerce
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav my-nav mx-auto">
                <a class="nav-link px-3" runat="server" href="~/">Página inicial</a>
<%--                <a class="nav-link px-3" runat="server" href="~/Cliente">Cliente</a>
                <a class="nav-link px-3" runat="server" href="~/Produto">Produto</a>
                <a class="nav-link px-3" runat="server" href="~/Tipo_Pagamento">Tipos de Pagamento</a>--%>
                <a class="nav-link px-3" runat="server" href="~/Pedido">Pedido</a>
            </div>
        </div>
        <form class="d-flex collapse">
            <input class="form-control me-2" type="search" placeholder="Pesquisar..." aria-label="Pesquisar">
            <button class="btn btn-success" type="submit">Pesquisar</button>
        </form>
    </div>
</nav>
