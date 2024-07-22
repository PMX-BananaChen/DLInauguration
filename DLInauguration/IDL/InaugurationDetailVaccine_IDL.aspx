<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InaugurationDetailVaccine_IDL.aspx.cs" Inherits="DLInauguration.IDL.InaugurationDetailVaccine_IDL" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../style/style.css" rel="stylesheet" />
    <link href="../style/print.css" rel="stylesheet" />
    <script src="../scripts/jquery/jquery-1.8.0.js"></script>
    <script src="../scripts/jquery/jquery-migrate-1.1.0.js"></script>
    <script src="../scripts/jquery/jquery.jqprint-0.3.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="formtitle">
            <span>IDL員工疫苗接種情況</span>
            <div style="float: right;">
                <a href="../InaugrationRecords_IDL.aspx">
                <input style="width: 50px; height: 25px; color: #fff; background: url(../images/btnbg.png);" type="button" value="返回" /></a>
            </div>
        </div>
        <div class="formbody">
            <div>
                <fieldset style="margin-left: 60px;">
                    <table class="tablelist">
                        <tr>
                            <th>身份證號</th>
                           <%--<th>是否接種新冠疫苗</th>--%>
                           <th>第一針接種廠家</th>
                           <th>第一針接種時間</th>
                           <th>第二針接種廠家</th>
                           <th>第二針接種時間</th>
                           <th>第三針接種廠家</th>
                           <th>第三針接種時間</th>
                           <%--<th>備註說明</th>  --%>               
                        </tr>
                        <tr>
                            <td style="width: 16%;">
                                <asp:Label ID="lblIdentityNo" runat="server"></asp:Label>
                            </td>
                            <td style="width: 14%;">
                                <asp:Label ID="lblVaccination1" runat="server"></asp:Label>
                            </td>
                            <td style="width: 14%;">
                                <asp:Label ID="lblVaccination1Date" runat="server"></asp:Label>
                            </td>
                            <td style="width: 14%;">
                                <asp:Label ID="lblVaccination2" runat="server"></asp:Label>
                            </td>
                            <td style="width: 14%;">
                                <asp:Label ID="lblVaccination2Date" runat="server"></asp:Label>
                            </td>
                            <td style="width: 14%;">
                                <asp:Label ID="lblVaccination3" runat="server"></asp:Label>
                            </td>
                            <td style="width: 14%;">
                                <asp:Label ID="lblVaccination3Date" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </form>
</body>
</html>
