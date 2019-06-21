<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AspDotNetAjax.aspx.cs" Inherits="AjaxCall.AspDotNetAjax" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASP .Net Ajax</title>
    <link href="CSS/table.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
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
            PageMethods.AddTwoNumbers(parseInt(firstNumber.value), parseInt(secondNumber.value), onSucceed, onError);
        }

        // On Success
        function onSucceed(results, currentContext, methodName) {
            if (results !== null) {
                document.getElementById('txtTotal').value = results;
            }
        }

        // On Error
        function onError(results, currentContext, methodName) {
            console.log(results);
        }
    </script>
</body>
</html>
