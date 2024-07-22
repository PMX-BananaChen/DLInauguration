<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DLInauguration.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>員工入職管理系統 </title>
    <link href="style/Login.css" rel="stylesheet" />
    <script src="scripts/jquery/jquery-1.8.0.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnLogin").click(function () {
                var name = encodeURIComponent($("#account").val());
                var pwd = encodeURIComponent($("#pwd").val());
                if (name == "") {
                    alert("帳號不能為空，請重新輸入！");
                    $("#account").focus();
                    return;
                }
                if (pwd == "") {
                    alert("密碼不能為空，請重新輸入！");
                    $("#pwd").focus();
                    return;
                }
                
                $.ajax({
                    type: "post",
                    url: "Login.aspx/UserLogin",
                    data: "{userAccount:'" + name + "',password:'" + pwd + "'}",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        var $jsonObj = JSON.parse(data.d);  
                        if ($jsonObj["result"] == "true") {
                            if ($jsonObj["emptype"] == "DL")
                            {
                                window.location.href = "DL/InaugrationRecords.aspx?titleid=W0";
                            }
                            else if($jsonObj["titleid"] == "NW0")
                            {
                                window.location.href = "IDL/InaugrationRecords_IDL.aspx?titleid=NW0";
                            }
                            else
                            {
                                window.location.href = "IDL/InaugrationRecords_IDL.aspx?titleid=IDL";
                            }
                           
                        } else {
                            alert("登錄失敗，請重新操作!");
                        }                        
                    }

                });
            });

            $("#btnReset").click(function () {
                $("#account").val("").focus();
                $("#pwd").val("");
            });

            $(".tiptop a").click(function () {
                $(".tip").fadeOut(200);
            });
        });


    </script>
</head>
<body>
    <div class="content" id="divContent" runat="server">
        <div class="panel">
            <div class="group">
                <label style="font-size: 20px; text-align: center;">員工入職管理系統</label>
            </div>
            <div class="group">
                <label>帳號</label>
                <input id="account" placeholder="請輸入帳號" />
            </div>
            <div class="group">
                <label>密碼</label>
                <input id="pwd" placeholder="請輸入密碼" type="password" />
            </div>
            <div class="login">
                <button id="btnLogin">登錄</button>
            </div>
            <div class="reset">
                <button id="btnReset">重置</button>
            </div>
        </div>
        <div class="show">
            <label></label>
        </div>
        <div class="tip">
            <div class="tiptop"><span>提示信息</span><a></a></div>
            <div class="tipinfo">
                <span>
                    <img src="../Images/t03.png" /></span>
                <div class="tipright">
                    <p>
                        <asp:Label ID="lblMsg" runat="server"></asp:Label>
                    </p>
                    <cite></cite>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
