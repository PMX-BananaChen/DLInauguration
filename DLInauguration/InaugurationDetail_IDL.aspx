<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InaugurationDetail_IDL.aspx.cs" Inherits="DLInauguration.IDL.InaugurationDetail_IDL" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../style/style.css" rel="stylesheet" />
    <link href="../style/print.css" rel="stylesheet" />
    <script src="../scripts/jquery/jquery-1.8.0.js"></script>
    <script src="../scripts/jquery/jquery-migrate-1.1.0.js"></script>
    <script src="../scripts/jquery/jquery.jqprint-0.3.js"></script>
    <script type="text/javascript">
        function print() {
            $("#dlForm").jqprint();
        }
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="formbody">
            <div class="formtitle">
                <span>DL員工詳細信息</span>
                <div style="float: right;">
                    <input type="button" style="width: 50px; height: 25px; color: #fff; background: url(../images/btnbg.png);" onclick="print()" value="打印" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="InaugrationRecords.aspx">
                        <input style="width: 50px; height: 25px; color: #fff; background: url(../images/btnbg.png);" type="button" value="返回" /></a>
                </div>
            </div>
            <div id="dlForm">
                <div style="margin-top: 80px; margin-bottom: 10px; font-size: 30px; text-align: center; font-weight: bold;">
                    工作申请书（间接员工用）
                </div>
                <div>
                    <fieldset style="margin-left: 60px;">
                        <%--<table class="" border="1" style="width:100%">--%>
                        <table class="tbl">
                            <tr>
                                <td style="text-align: left; width: 35%;">報到日</td>
                                <td style="text-align: left; width: 65%;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left; width: 35%;">部門</td>
                                <td style="text-align: left; width: 65%;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left; width: 35%;">職稱</td>
                                <td style="text-align: left; width: 65%;">&nbsp;</td>
                            </tr>
                             <tr>
                                <td style="text-align: left; width: 35%;">離職日</td>
                                <td style="text-align: left; width: 65%;">&nbsp;</td>
                            </tr>
                             <tr>
                                <td style="text-align: left; width: 35%;">離職原因</td>
                                <td style="text-align: left; width: 65%;">&nbsp;</td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
                <div>
                    <fieldset style="margin-left: 60px;">
                        <%--<table class="" border="1" style="width:100%">--%>
                        <table style="width: 90%;margin-left:30px;line-height:30px;" border="0">
                            <tr style="border:0;">
                                <td style="text-align: left; width: 80%;">&nbsp;</td>
                                
                                <td style="text-align: left; width: 20%; border: solid 1px #cbcbcb;">工號：</td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
                <div>
                    <fieldset style="margin-left: 60px;">
                        <table class="table">
                            <tr>
                                <td style="width: 10%">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                                <td style="width: 35%">
                                    <asp:Label ID="lblName" runat="server"></asp:Label></td>
                                <td style="width: 10%">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;別：</td>
                                <td style="width: 25%">
                                    <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                                <td rowspan="5" style="width: 30%;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>出生日期：</td>
                                <td>
                                    <asp:Label ID="lblBirthDay" runat="server"></asp:Label></td>
                                <td>婚姻狀況：</td>
                                <td>
                                    <asp:Label ID="lblMarriage" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>身份證號：</td>
                                <td>
                                    <asp:Label ID="lblIdentityNo" runat="server"></asp:Label></td>
                                <td>戶口性質：</td>
                                <td>
                                    <asp:Label ID="lblHousehold" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>現在住址：</td>
                                <td>
                                    <asp:Label ID="lblAddress" runat="server"></asp:Label></td>
                                <td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;貫：</td>
                                <td>
                                    <asp:Label ID="lblProvince" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>手機號碼：</td>
                                <td colspan="3">
                                    <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </fieldset>
                    <fieldset style="margin-left: 60px;">
                        <legend style="font-size: 15px;">教育程度</legend>
                        <table class="tablelist">
                            <tr>
                                <th>最高學歷
                                </th>
                                <th>畢業學校
                                </th>
                                <th>證書
                                </th>
                                <th>入學日期
                                </th>
                                <th>畢業日期
                                </th>
                            </tr>

                            <tr>
                                <td style="width: 15%;">
                                    <asp:Label ID="lblEducation" runat="server"></asp:Label>
                                </td>
                                <td style="width: 40%;">
                                    <asp:Label ID="lblSchool" runat="server"></asp:Label>
                                </td>
                                <td style="width: 15%;">
                                    <asp:Label ID="lblCertificate" runat="server"></asp:Label>
                                </td>
                                <td style="width: 15%;">
                                    <asp:Label ID="lblEntranceDate" runat="server"></asp:Label>
                                </td>
                                <td style="width: 15%;">
                                    <asp:Label ID="lblGraduationDate" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </fieldset>
                </div>
                <div>
                    <fieldset style="margin-left: 60px;">
                        <legend style="font-size: 15px;">家庭狀況</legend>
                        <asp:Repeater ID="rptFamily" runat="server">
                            <HeaderTemplate>
                                <table class="tablelist">
                                    <tr>
                                        <th>姓名
                                        </th>
                                        <th>關係
                                        </th>
                                        <th>職業
                                        </th>
                                        <th>電話
                                        </th>
                                        <th>地址
                                        </th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblRelationship" runat="server" Text='<%#Eval("Relationship") %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblOccupation" runat="server" Text='<%#Eval("Occupation") %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label></td>
                                    <td style="width: 40%;">
                                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </fieldset>

                    <fieldset style="margin-left: 60px;">
                        <legend style="font-size: 15px;">本公司三類親</legend>
                        <asp:Repeater ID="rptRelatives" runat="server">
                            <HeaderTemplate>
                                <table class="tablelist">
                                    <tr>
                                        <th>姓名
                                        </th>
                                        <th>關係
                                        </th>
                                        <th>部門
                                        </th>
                                        <th>電話
                                        </th>
                                        <th>工號
                                        </th>
                                        <th>備註
                                        </th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblRelationship" runat="server" Text='<%#Eval("Relationship")%>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblDepartment" runat="server" Text='<%#Eval("Department")%>'></asp:Label>
                                    </td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber")%>'></asp:Label></td>
                                    <td style="width: 10%;">
                                        <asp:Label ID="lblEmpNo" runat="server" Text='<%#Eval("EmpNo")%>'></asp:Label></td>
                                    <td style="width: 30%;">
                                        <asp:Label ID="lblRemark" runat="server" Text='<%#Eval("Remark") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </fieldset>
                    <fieldset style="margin-left: 60px;">
                        <legend style="font-size: 15px;">意外聯絡人</legend>
                        <asp:Repeater ID="rptLinkman" runat="server">
                            <HeaderTemplate>
                                <table class="tablelist">
                                    <tr>
                                        <th>姓名
                                        </th>
                                        <th>關係
                                        </th>
                                        <th>電話
                                        </th>
                                        <th>地址
                                        </th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblRelationship" runat="server" Text='<%#Eval("Relationship")%>'></asp:Label></td>
                                    <td style="width: 20%;">
                                        <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber")%>'></asp:Label></td>
                                    <td style="width: 60%;">
                                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </fieldset>
                    <fieldset style="margin-left: 60px;">
                        <legend style="font-size: 15px;">工作經歷</legend>
                        <asp:Repeater ID="rptWorkExperience" runat="server">
                            <HeaderTemplate>
                                <table class="tablelist">
                                    <tr>
                                        <th>公司名稱
                                        </th>
                                        <th>職務名稱
                                        </th>
                                        <th>離職原因
                                        </th>
                                        <th>待遇
                                        </th>
                                        <th>入職日期
                                        </th>
                                        <th>離職日期
                                        </th>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20%;">
                                        <asp:Label ID="lblCompany" runat="server" Text='<%#Eval("Company") %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblOccupation" runat="server" Text='<%#Eval("Occupation")%>'></asp:Label></td>
                                    <td style="width: 25%;">
                                        <asp:Label ID="lblReasonForLeaving" runat="server" Text='<%#Eval("ReasonForLeaving")%>'></asp:Label>
                                    </td>
                                    <td style="width: 10%;">
                                        <asp:Label ID="lblSalary" runat="server" Text='<%#Eval("Salary")%>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblEmploymentDate" runat="server" Text='<%#string.Format("{0:yyyy-MM-dd}", Eval("EmploymentDate")) %>'></asp:Label></td>
                                    <td style="width: 15%;">
                                        <asp:Label ID="lblResignationDate" runat="server" Text='<%#string.Format("{0:yyyy-MM-dd}", Eval("ResignationDate")) %>'></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </fieldset>

                </div>
                <div>
                    <fieldset style="margin-left: 60px;">
                        <%--<table class="" border="1" style="width:100%">--%>
                        <table class="table">
                            <tr>
                                <td colspan="3">本人承諾本表內所填各項符合事實，若有虛報愿受公司處分。
                                </td>
                                <td style="text-align: left;">簽名：</td>
                                <%--<td></td>--%>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">HR意見欄</td>
                                <td colspan="2" style="text-align: center;">用人單位意見欄（課級以上主管）</td>
                            </tr>
                            <tr>
                                <td colspan="2" style="width: 50%">&nbsp;</td>
                                <td colspan="2" style="width: 50%">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">簽名：</td>
                                <td style="text-align: left;">日期：</td>
                                <td style="text-align: left;">簽名：</td>
                                <td style="text-align: left;">日期：</td>
                            </tr>
                            <tr>
                                <td colspan="4">招聘流程：笔试—>面试—>体检—>入职手续办理（填写工作申請書）
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>                
            </div>
        </div>
    </form>
</body>
</html>