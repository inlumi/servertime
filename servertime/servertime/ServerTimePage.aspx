<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServerTimePage.aspx.cs" Inherits="servertime.ServerTimePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Server Time Changing</title>
    <link type="text/css" rel="stylesheet" href="styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Server Time Changing</h1>
        <asp:Label ID="timing" runat="server"><%= System.DateTime.Now %></asp:Label>
        <asp:Button ID="plusHour" runat="server" Text="Plus Hour"/>
        <asp:Button ID="minusHour" runat="server" Text="MinusHour"/>
        <script type="text/javascript">
            $(function () {
                setInterval(function () {
                    $.ajax({
                        type: "POST",
                        url: "ServerTimePage.aspx/GetDate",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (time) {
                            $("#timing").text(time.d);
                        }
                    });
                }, 1000);
                $("#plusHour").on("click", function (event) {
                    $.ajax({
                        type: "POST",
                        url: "ServerTimePage.aspx/PlusHour",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json"
                    })
                    event.preventDefault();
                    return false;
                })
                $("#minusHour").on("click", function (event) {
                    $.ajax({
                        type: "POST",
                        url: "ServerTimePage.aspx/MinusHour",
                        data: "{}",
                        contentType: "application/json; charsetutf-8",
                        dataType: "json"
                    })
                    event.preventDefault();
                    return false;
                })
            });
        </script>
    </div>
    </form>
</body>
</html>
