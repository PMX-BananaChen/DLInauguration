<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BatchPrint_IDL.aspx.cs" Inherits="DLInauguration.IDL.BatchPrint_IDL" %>

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
    <title>批量打印</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="formbody">
            <div class="formtitle">
                <span>IDL員工詳細信息</span>
                <div style="float: right;">
                    <input type="button" style="width: 50px; height: 25px; color: #fff; background: url(../images/btnbg.png);" onclick="print()" value="打印" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../InaugrationRecords_IDL.aspx">

                        <input style="width: 50px; height: 25px; color: #fff; background: url(../images/btnbg.png);" type="button" value="返回" /></a>
                </div>
            </div>
            <div id="dlForm">
                <asp:Repeater ID="rptForm" runat="server" OnItemDataBound="rptForm_ItemDataBound">
                    <ItemTemplate>
                        <div style="margin-top: 80px; margin-bottom: 10px; font-size: 30px; text-align: center; font-weight: bold;">
                            工作申请书（间接员工用）
                        </div>
                        <div>
                            <fieldset style="margin-left: 60px;">
                                <table class="table">
                                    <tr>

                                        <td class="auto-style9">報到日</td>
                                        <td class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                        </td>
                                        <td rowspan="5" class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td colspan="4" class="auto-style9" style="text-align: center">履歷來源</td>

                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="auto-style27">部門</td>
                                        <td style="text-align: left;" class="auto-style28"></td>
                                        <td style="text-align: left;" class="auto-style8" rowspan="2">網絡</td>
                                        <td style="text-align: left;" class="auto-style8" rowspan="2">人才<br />
                                            &nbsp;市場</td>
                                        <td style="text-align: left;" class="auto-style8" rowspan="2">內部<br />
                                            介紹</td>
                                        <td style="text-align: left;" class="auto-style4" rowspan="2">其他</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="auto-style29">職稱</td>
                                        <td style="text-align: left;" class="auto-style30"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="auto-style11">離職日</td>
                                        <td style="text-align: left;" class="auto-style12"></td>
                                        <td style="text-align: left;" class="auto-style8" rowspan="2"></td>
                                        <td style="text-align: left;" class="auto-style8" rowspan="2"></td>
                                        <td style="text-align: left;" class="auto-style8" rowspan="2"></td>
                                        <td style="text-align: left;" class="auto-style4" rowspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="auto-style13">離職原因</td>
                                        <td style="text-align: left;" class="auto-style6"></td>
                                    </tr>
                                </table>



                            </fieldset>
                        </div>
                        <div>
                            <fieldset style="margin-left: 60px;">
                                <%--<table class="" border="1" style="width:100%">--%>
                                <table style="width: 90%; margin-left: 30px; line-height: 30px;" border="0">
                                    <tr style="border: 0;">
                                        <td style="text-align: left; width: 80%;">&nbsp;</td>

                                        <td style="text-align: left; border: solid 1px #cbcbcb;" class="auto-style16">&nbsp;&nbsp;工號：<asp:Label ID="lblEmpNo" runat="server" Width="144px"></asp:Label>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                        <div>
                            <fieldset style="margin-left: 60px;">
                                <table class="table">
                                    <tr>
                                        <td class="auto-style19" style="width: 20%">中文姓名:</td>
                                        <td class="auto-style18">
                                            <asp:Label ID="lblName" runat="server" Width="300px"></asp:Label></td>
                                        <td class="auto-style20" style="width: 20%">英文姓名:</td>
                                        <td class="auto-style19">
                                            <asp:Label ID="EngName" runat="server" Width="300px"></asp:Label></td>

                                        <td rowspan="6" style="width: 20%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style19">出生日期:</td>
                                        <td class="auto-style18">
                                            <asp:Label ID="lblBirthDay" runat="server"></asp:Label></td>
                                        <td class="auto-style20">電&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;話:</td>
                                        <td class="auto-style19">
                                            <asp:Label ID="lblPhoneNum" runat="server"></asp:Label></td>

                                    </tr>

                                    <tr>
                                        <td class="auto-style19">出生地点:</td>
                                        <td class="auto-style18">
                                            <asp:Label ID="lblBornAddress" runat="server"></asp:Label></td>
                                        <td class="auto-style20">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机:</td>
                                        <td class="auto-style19">
                                            <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style19">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;別:</td>
                                        <td class="auto-style18">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label></td>
                                        <td class="auto-style20">婚姻狀況:</td>
                                        <td class="auto-style19">
                                            <asp:Label ID="lblMarriage" runat="server"></asp:Label></td>

                                    </tr>



                                    <tr>
                                        <td class="auto-style19">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;貫:</td>
                                        <td class="auto-style18">
                                            <asp:Label ID="lblProvince" runat="server"></asp:Label></td>
                                        <td class="auto-style20">國&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;籍:</td>
                                        <td class="auto-style19">
                                            <asp:Label ID="lblCountry" runat="server"></asp:Label></td>

                                    </tr>



                                    <tr>

                                        <td class="auto-style19">身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高:</td>
                                        <td class="auto-style18">
                                            <asp:Label ID="lblStature" runat="server"></asp:Label></td>
                                        <td class="auto-style20">體&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重:</td>
                                        <td class="auto-style19">
                                            <asp:Label ID="lblWeight" runat="server"></asp:Label></td>
                                    </tr>

                                    <tr>
                                        <td class="auto-style19">身份證號:</td>
                                        <td colspan="4">
                                            <asp:Label ID="lblIdentityNo" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style19">電子郵件:</td>
                                        <td colspan="4">
                                            <asp:Label ID="lblEmail" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style19">現在住址:</td>
                                        <td colspan="4">
                                            <asp:Label ID="lblNowAddress" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style19">戶籍住址:</td>
                                        <td colspan="4">
                                            <asp:Label ID="lblKosekiAddress" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                            </fieldset>


                            <fieldset style="margin-left: 60px;">
                                <legend style="font-size: 15px;">教育程度</legend>
                                <table class="tablelist">
                                    <tr>
                                        <th>最高學歷
                                        </th>
                                        <th class="auto-style32">畢業學校
                                        </th>
                                        <th>所屬科系
                                        </th>
                                        <th>入學日期
                                        </th>
                                        <th>畢業日期
                                        </th>
                                    </tr>

                                    <tr>
                                        <td class="auto-style31">
                                            <asp:Label ID="lblEducation" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style33">
                                            <asp:Label ID="lblSchool" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lblSubject" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lblEntranceDate" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style31">
                                            <asp:Label ID="lblGraduationDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                            </fieldset>

                        </div>




                        <div>

                            <fieldset style="margin-left: 60px;">
                                <legend style="font-size: 15px;">語言程度</legend>
                                <table class="tablelist">
                                    <tr>
                                        <th style="text-align: center">語言
                                        </th>
                                        <th style="text-align: center">聽
                                        </th>
                                        <th style="text-align: center">說
                                        </th>
                                        <th style="text-align: center">讀
                                        </th>
                                        <th style="text-align: center">寫
                                        </th>

                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: center">
                                            <asp:Label ID="lblLanguage" runat="server"></asp:Label>
                                        </td>
                                        <%--<asp:Label ID="lblSchool" runat="server"></asp:Label>--%><%--<asp:Label ID="lblSite" runat="server"></asp:Label>--%>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lbllisten" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lbltalk" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblread" runat="server"></asp:Label>
                                        </td>
                                        <td style="width: 20%;">
                                            <asp:Label ID="lblwrite" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>

                        <div>
                            <fieldset style="margin-left: 60px;">
                                <legend style="font-size: 15px;">履歷(包括現在職業以年月先後順序詳列履歷)</legend>
                                <asp:Repeater ID="RptWorkexperience" runat="server">
                                    <HeaderTemplate>
                                        <table class="tablelist">

                                            <tr>
                                                <th style="text-align: center" class="auto-style22">任職開始時間
                                                </th>
                                                <th style="text-align: center" class="auto-style6">任職結束時間
                                                </th>
                                                <th style="text-align: center" class="auto-style23">職務名稱
                                                </th>
                                                <th style="text-align: center">公司名稱及地址
                                                </th>
                                                <th style="text-align: center" class="auto-style21">主管姓名/職稱
                                                </th>
                                                <th style="text-align: center" class="auto-style20">待遇
                                                </th>
                                                <th style="text-align: center">離職原因
                                                </th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <tr>
                                            <td class="auto-style22">
                                                <asp:Label ID="EmploymentDate" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd}", Eval("EmploymentDate"))  %>'></asp:Label>
                                            </td>

                                            <td class="auto-style6">
                                                <asp:Label ID="ResignationDate" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd}", Eval("ResignationDate"))  %>'></asp:Label>
                                            </td>
                                            <td class="auto-style23">
                                                <asp:Label ID="Job" runat="server" Text='<%#Eval("Job") %>'></asp:Label>
                                            </td>
                                            <td style="width: 20%;">
                                                <asp:Label ID="Company" runat="server" Text='<%#Eval("Company") %>'></asp:Label>
                                            </td>
                                            <td class="auto-style21">
                                                <asp:Label ID="Manager" runat="server" Text='<%#Eval("Manager") %>'></asp:Label>
                                            </td>

                                            <td class="auto-style20">
                                                <asp:Label ID="Salary" runat="server" Text='<%#Eval("Salary") %>'></asp:Label>
                                            </td>
                                            <td style="width: 20%;">
                                                <asp:Label ID="reason" runat="server" Text='<%#Eval("reason") %>'></asp:Label>
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
                                <legend style="font-size: 15px;">重要受訓記錄/ 證照/ 執照</legend>
                                <asp:Repeater ID="RptLicense" runat="server">
                                    <HeaderTemplate>
                                        <table class="tablelist">

                                            <tr>
                                                <th style="text-align: center" class="auto-style22">號  碼
                                                </th>
                                                <th style="text-align: center" class="auto-style6">訓練/證照名稱
                                                </th>
                                                <th style="text-align: center" class="auto-style23">承辦單位
                                                </th>
                                                <th style="text-align: center">受訓開始期間
                                                </th>
                                                <th style="text-align: center" class="auto-style21">受訓結束期間
                                                </th>
                                                <th style="text-align: center" class="auto-style20">
                                                總時數
                                                         
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <tr>
                                            <td class="auto-style22">
                                                <asp:Label ID="Number" runat="server" Text='<%#Eval("Number") %>'></asp:Label>
                                            </td>

                                            <td class="auto-style6">
                                                <asp:Label ID="License" runat="server" Text='<%#Eval("License") %>'></asp:Label>
                                            </td>
                                            <td class="auto-style23">
                                                <asp:Label ID="Unit" runat="server" Text='<%#Eval("Unit") %>'></asp:Label>
                                            </td>
                                            <td style="width: 20%;">
                                                <asp:Label ID="StartDate" runat="server" Text='<%#String.Format("{0:yyyy-MM-dd}", Eval("StartDate")) %>'></asp:Label>
                                            </td>
                                            <td class="auto-style21">
                                                <asp:Label ID="EndDate" runat="server" Text=' <%#String.Format("{0:yyyy-MM-dd}", Eval("EndDate")) %>'></asp:Label>
                                            </td>

                                            <td class="auto-style20">
                                                <asp:Label ID="Hour" runat="server" Text='<%#Eval("Hour") %>'></asp:Label>
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
                                <legend style="font-size: 15px;"></legend>
                                <table class="tablelist">
                                    <tr>
                                        <td colspan="6" class="auto-style22">詳述工作經驗(請說明工作中最熟悉之部份)
                                     <br />
                                            <asp:Label ID="lblExpectWorks" runat="server" Height="36px" Width="1124px"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="auto-style34">申請何種工作:

                                    <asp:Label ID="lblExpectWork" runat="server" Width="190px"></asp:Label>

                                            <br />

                                        </td>
                                        <td colspan="3" class="auto-style34">希望最低薪金:

                                    <asp:Label ID="lblLowSalary" runat="server" Width="152px"></asp:Label>

                                            <br />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">社交活動及嗜好:
                                
                                    <asp:Label ID="lblHobbies" runat="server" Width="190px"></asp:Label>

                                            <br />
                                        </td>


                                    </tr>

                                </table>
                            </fieldset>
                        </div>



                        <div>
                            <fieldset style="margin-left: 60px;">
                                <legend style="font-size: 15px;">家庭狀況(包括父母、配偶、子女)</legend>
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
                                                <th>联系方式
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

                            <fieldset style="margin-left: 100px;">
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
                                <legend style="font-size: 15px;">請列舉能提供有關填表人之品性及能力資料之朋友三人</legend>
                                <asp:Repeater ID="rptFriend" runat="server">
                                    <HeaderTemplate>
                                        <table class="tablelist">
                                            <tr>
                                                <th>姓名
                                                </th>
                                                <th>職業
                                                </th>
                                                <th>地址
                                                </th>
                                                <th>電話
                                                </th>

                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td style="width: 15%;">
                                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>'></asp:Label></td>
                                            <td style="width: 15%;">
                                                <asp:Label ID="lblOccupation" runat="server" Text='<%#Eval("Occupation")%>'></asp:Label></td>
                                            <td style="width: 15%;">
                                                <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                                            </td>
                                            <td style="width: 15%;">
                                                <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber")%>'></asp:Label></td>

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
                            &nbsp;

                        </div>

                        <div>
                            <fieldset style="margin-left: 60px;">
                                <table class="table">
                                    <tr>
                                        <td colspan="4"><b><span>本人允審查本表內所填各項，如有虛報情事願受解職處分.</span></b></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">本人簽名：</td>
                                        <td>日期：</td>
                                    </tr>
                                    <%--  <tr>
                                <td colspan="2" style="text-align: center;">HR建議</td>
                                <td colspan="2" style="text-align: center;">用人單位建議</td>
                            </tr>
                            <tr>
                                <td style="text-align: left;" class="auto-style35">職等：</td>
                                <td style="text-align: left;" class="auto-style35">薪資：</td>
                                <td style="text-align: left;" class="auto-style35">職等：</td>
                                <td style="text-align: left;" class="auto-style35">薪資：</td>
                            </tr>
                            <tr>
                                    <td colspan="2" style="width: 50%">簽名：</td>
                                <td colspan="2" style="width: 50%">簽名：</td>
                            </tr>--%>

                                    <tr>
                                        <td colspan="4" style="width: 50%">HR建議</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">職等：</td>
                                        <td style="text-align: left;">薪資：</td>
                                        <td colspan="2" style="width: 50%">簽名：</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="width: 50%">用人單位建議</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">職等：</td>
                                        <td style="text-align: left;">薪資：</td>
                                        <td colspan="2" style="width: 50%">簽名：</td>
                                    </tr>


                                    <tr>
                                        <td colspan="4" style="width: 50%">HR確認</td>


                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">職等：</td>
                                        <td style="text-align: left;">薪資：</td>
                                        <td colspan="2" style="width: 50%">簽名</td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                        <div style="page-break-after: always"></div>
                        <div style="text-align: end;">表單文號: 1H4-012&nbsp;&nbsp;REV:1</div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>
