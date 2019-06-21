<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JqueryAjax.aspx.cs" Inherits="AjaxCall.JqueryAjax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Jquery Ajax</title>
    <link href="CSS/table.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: 0px auto; width: 310px; margin-top: 100px;">
            <table>
                <tr>
                    <th colspan="2">Add Two Numbers</th>
                </tr>
                <tr>
                    <td>First Number</td>
                    <td>
                        <asp:TextBox ID="txtFirstNumber" runat="server" TextMode="Number" autocomplete="off"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Second Number</td>
                    <td>
                        <asp:TextBox ID="txtSecondNumber" runat="server" TextMode="Number" autocomplete="off"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <button type="button" onclick="return AddTwoNumbers();">Total</button>
                    </td>
                    <td>
                        <asp:TextBox ID="txtTotal" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script>
        // Add two numbers
        function AddTwoNumbers() {
            var firstNumber = document.getElementById('txtFirstNumber');
            var secondNumber = document.getElementById('txtSecondNumber');

            $.ajax({
                type: "POST",
                url: "AspDotNetAjax.aspx/AddTwoNumbers",
                data: "{ firstNumber: '" + parseInt(firstNumber.value) + "',secondNumber: '" + parseInt(secondNumber.value) + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: "true",
                cache: "false",
                success: onSucceed,
                Error: onError
            });
        }

        // On Success
        function onSucceed(results, currentContext, methodName) {
            if (results !== null && results.d !== null) {
                document.getElementById('txtTotal').value = results.d;
            }
        }

        // On Error
        function onError(results, currentContext, methodName) {
            console.log(results);
        }
    </script>
</body>
</html>
