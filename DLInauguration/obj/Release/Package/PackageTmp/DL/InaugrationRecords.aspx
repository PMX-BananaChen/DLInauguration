<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InaugrationRecords.aspx.cs" Inherits="DLInauguration.DL.InaugrationRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../style/style.css" rel="stylesheet" />
    <link href="../style/select.css" rel="stylesheet" />
    <script src="../scripts/My97DatePicker/WdatePicker.js"></script>
    <script src="../scripts/jquery/jquery-1.8.0.js"></script>
    <script src="../scripts/select-ui.min.js"></script>
    <title></title>
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".select1").uedSelect({
                width: 345
            });
            $(".select2").uedSelect({
                width: 80
            });
            $(".select3").uedSelect({
                width: 110
            });
        });
        $(function () {
            $("#selectAll").change(function () {
                var checkboxs = $("#tbody").find("input[type='checkbox']");
                var isChecked = $(this).is(":checked");
                //严禁使用foreach，jq对象的遍历会使浏览器崩溃
                for (var i = 0; i < checkboxs.length; i++) {
                    //临时变量，必须，否则只能选中最后一条记录
                    var temp = i;
                    $(checkboxs[temp]).prop("checked", isChecked);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="formbody">
            <%--<div  class="formtitle"><span>DL員工入職記錄</span> <table><asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton></table></div>--%>
            <div class="formtitle" style="font-weight: bold; color: #0099FF">
                <label>DL員工入職記錄</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%--<a  href="/IDL/InaugrationRecords_IDL.aspx" class="">切換至IDL員工入職記錄頁面</a>--%>
            </div>

            <ul class="seachform">
                <li>
                    <label>開始時間</label>
                    <input id="txtStartDay" runat="server" class="dfinput" type="text" onfocus="WdatePicker({ skin: 'twoer', dateFmt: 'yyyy-MM-dd', })" style="width: 100px;" />
                </li>
                <li>
                    <label>結束時間</label>
                    <input id="txtEndDay" runat="server" class="dfinput" type="text" onfocus="WdatePicker({ skin: 'twoer', dateFmt: 'yyyy-MM-dd', })" style="width: 100px;" />

                </li>
                <li>
                    <label>身份證號</label>
                    <input id="txtNo" runat="server" class="dfinput" type="text" style="width: 150px;" />
                </li>
                <li>
                    <label>姓名</label>
                    <input id="txtName" runat="server" class="dfinput" type="text" style="width: 100px;" />
                </li>
                <li>
                    <label>区域</label>
                    <div class="vocation">
                        <asp:DropDownList ID="ddlArea" runat="server" CssClass="select2">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                            <asp:ListItem Text="刘屋" Value="LW"></asp:ListItem>
                            <asp:ListItem Text="明珠" Value="MZ"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </li>
                <li>
                    <asp:Button ID="btnSeach" runat="server" CssClass="scbtn" Text="查詢" OnClick="btnSeach_Click" />&nbsp;&nbsp;
                    <asp:Button ID="btnBatchPrint" runat="server" CssClass="scbtn" Text="批量打印" OnClick="btnBatchPrint_Click" />
                </li>
            </ul>
            <div style="width: 100%">
                <asp:Repeater ID="rptInauRecords" runat="server">
                    <HeaderTemplate>
                        <table class="tablelist" id="tblInauRecords">
                            <tbody id="tbody">
                                <tr>
                                    <th>
                                        <input id="selectAll" role='checkbox' type='checkbox' class='cbox checkbox' Checked />
                                    </th>
                                    <th>姓名
                                    </th>
                                    <th>身份證號
                                    </th>
                                    <th>生日
                                    </th>
                                    <th>工号
                                    </th>
                                    <th>性別
                                    </th>
                                    <th>婚姻
                                    </th>
                                    <th>戶口
                                    </th>
                                    <th>手機號碼
                                    </th>
                                    <th>籍貫
                                    </th>
                                    <th>居住地址
                                    </th>
                                    <th>更新时间
                                    </th>
                                    <th>操作
                                    </th>
                                </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="width: 3%;">
                                <asp:CheckBox ID="cbPrint" ToolTip='<%#Eval("ID") %>' Text="" runat="server" Checked />
                            </td>
                            <td style="width: 5%;">
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></td>
                            <td style="width: 10%;">
                                <asp:Label ID="lblIdentityNo" runat="server" Text='<%#Eval("IdentityNo") %>'></asp:Label></td>
                            <td style="width: 8%;">
                                <asp:Label ID="lblBirthDay" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd}", Eval("BirthDay"))%>'></asp:Label></td>
                            <td style="width: 5%;">
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("EmpNo") %>'></asp:Label></td>
                            <td style="width: 4%;">
                                <asp:Label ID="lblGender" runat="server" Text='<%#Eval("Gender") %>'></asp:Label></td>
                            <td style="width: 4%;">
                                <asp:Label ID="lblMarriage" runat="server" Text='<%#Eval("Marriage") %>'></asp:Label></td>
                            <td style="width: 5%;">
                                <asp:Label ID="lblHousehold" runat="server" Text='<%#Eval("Household") %>'></asp:Label></td>
                            <td style="width: 7%;">
                                <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label></td>
                            <td style="width: 8%;">
                                <asp:Label ID="lblProvince" runat="server" Text='<%#Eval("Province") %>'></asp:Label></td>
                            <td style="width: 12%;">
                                <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label></td>
                            <td style="width: 12%;">
                                <asp:Label ID="lblUpdatetime" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd HH:mm:ss}", Eval("UpdateTime"))%>'></asp:Label></td>
                            <td style="width: 15%;">
                                <asp:ImageButton ID="ImgDetail"
                                    ImageAlign="absmiddle" ToolTip="詳情" BorderStyle="None" ImageUrl="../Images/f03.png"
                                    Style="cursor: pointer;" runat="server" AlternateText="Detail" /><a href='<%# GetDetailURL(Eval("ID")) %>' target="_blank">詳情</a>
                                <asp:ImageButton ID="ImgDetail2"
                                    ImageAlign="absmiddle" ToolTip="詳情2" BorderStyle="None" ImageUrl="../Images/f03.png"
                                    Style="cursor: pointer;" runat="server" AlternateText="Detail" /><a href='<%# GetDetailVaccineURL(Eval("ID")) %>' target="_blank">詳情2</a>
                                <asp:ImageButton ID="ImgEdit" ImageAlign="absmiddle" ToolTip="编辑" BorderStyle="None" ImageUrl="../Images/t02.png"
                                    Style="cursor: pointer;" runat="server" AlternateText="edit" /><a href='<%# GetEditURL(Eval("ID")) %>' target="_blank">编辑</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="pagin">
                <div class="message">
                    共<i class="blue">
                        <asp:Label ID="lblTotal" runat="server"></asp:Label>
                    </i>條記錄，當前顯示第&nbsp;<i class="blue"><asp:Label ID="lblCurrPage" runat="server"></asp:Label>&nbsp;</i>頁，共&nbsp;<i class="blue"><asp:Label ID="lblTttPage" runat="server"></asp:Label>&nbsp;</i>頁
                </div>
                <ul class="paginList">
                    <li class="paginItem">
                        <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">首頁</asp:LinkButton></li>
                    <li class="paginItem">
                        <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">上一頁</asp:LinkButton></li>
                    <li class="paginItem">
                        <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">下一頁</asp:LinkButton></li>
                    <li class="paginItem">
                        <asp:LinkButton ID="lbLast" runat="server" OnClick="lbLast_Click">末頁</asp:LinkButton></li>
                </ul>
            </div>
        </div>
    </form>
</body>
</html>
