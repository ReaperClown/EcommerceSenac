<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ProjetoEcommerce___Remaster.Home" %>

<%@ Register Src="~/Components/NavBar.ascx" TagName="navbar" TagPrefix="TNav" %>
<%@ Register Src="~/Components/Footer.ascx" TagName="footer" TagPrefix="TFooter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/css/default.css" rel="stylesheet" />
    <link href="Content/vendor/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet" />
    <title>Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <TNav:navbar ID="myNav" runat="server" />

        <div class="container body-content flex-shrink-0">
            <div class="container body-content">
                <div class="container">
                    Content
                </div>
            </div>
        </div>
        <TFooter:footer ID="myFooter" runat="server" />
    </form>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
</body>
</html>
