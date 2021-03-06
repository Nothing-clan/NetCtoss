﻿<%@ page import="com.zwy.work.entity.Admin" %>
<%@ page import="com.zwy.work.entity.Role" %>
<%@ page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>达内－NetCTOSS</title>
    <link type="text/css" rel="stylesheet" media="all" href="styles/global.css"/>
    <link type="text/css" rel="stylesheet" media="all" href="styles/global_color.css"/>
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/all.js"></script>
    <script language="javascript" type="text/javascript">
        //保存成功的提示消息
        function showResult() {
            showResultDiv(true);
            window.setTimeout("showResultDiv(false);", 3000);
        }

        function showResultDiv(flag) {
            var divResult = document.getElementById("save_result_info");
            if (flag)
                divResult.style.display = "block";
            else
                divResult.style.display = "none";
        }

        function validate() {
            var hasSelected = false;
            var isValidate = true;
            $(".required").each(function () {
                if ($(this).val() == "") {
                    $(this).siblings(".validate_msg").addClass("error_msg");
                    isValidate = false;
                    return false;
                } else {
                    $(this).siblings(".validate_msg").removeClass("error_msg");
                }
            });

            $(".select_role").each(function () {
                if ($(this).is(":checked")) {
                    hasSelected = true;
                    //结束循环
                    return false;
                }
            });
            if (!hasSelected) {
                $(".validate_msg_tiny").addClass("error_msg");
            } else {
                $(".validate_msg_tiny").removeClass("error_msg");
            }

            if (!limit30Validate($("input[name=adminName]").val())) {
                $("input[name=adminName]").siblings(".validate_msg").addClass("error_msg");
            }
            if (!phoneValidate($("input[name=telephone]").val())) {
                $("input[name=telephone]").siblings(".validate_msg").addClass("error_msg");
            }
            if (!emailValidate($("input[name=email]").val())) {
                $("input[name=email]").siblings(".validate_msg").addClass("error_msg");
            }
            if ($(".error_msg").length == 0) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body>
<!--Logo区域开始-->
<div id="header">
    <%@ include file="../logo.jsp" %>
</div>
<!--Logo区域结束-->
<!--导航区域开始-->
<div id="navi">
    <%@include file="../menu.jsp" %>
</div>
<!--导航区域结束-->
<!--主要区域开始-->
<div id="main">
    <div id="save_result_info" class="save_success">保存成功！</div>
    <form action="modifyAdmin.do" method="post" class="main_form" onsubmit="return validate()">
        <%
            Admin adminInfo = (Admin) request.getAttribute("adminInfo");
            List<Role> totalRoles = (List<Role>) request.getAttribute("totalRoles");
        %>
        <div class="text_info clearfix"><span>姓名：</span></div>
        <input type="hidden" value="<%=adminInfo.getAdminId()%>" name="adminId"/>
        <div class="input_info">
            <input type="text" value="<%=adminInfo.getAdminName()%>" name="adminName"/>
            <span class="required">*</span>
            <div class="validate_msg_long validate_msg">30长度以内的汉字、字母、数字的组合</div>
        </div>
        <div class="text_info clearfix"><span>管理员账号：</span></div>
        <div class="input_info">
            <input type="text" readonly="readonly" class="readonly" value="<%=adminInfo.getAdminCode()%>"
                   name="adminCode"/></div>
        <div class="text_info clearfix"><span>电话：</span></div>
        <div class="input_info">
            <input type="text" value="<%=adminInfo.getTelephone()%>" name="telephone"/>
            <span class="required">*</span>
            <div class="validate_msg_medium validate_msg">正确的电话号码格式：手机或固话</div>
        </div>
        <div class="text_info clearfix"><span>Email：</span></div>
        <div class="input_info">
            <input type="text" class="width200" value="<%=adminInfo.getEmail()%>" name="email"/>
            <span class="required">*</span>
            <div class="validate_msg_medium validate_msg">50长度以内，正确的 email 格式</div>
        </div>
        <div class="text_info clearfix"><span>角色：</span></div>
        <div class="input_info_high">
            <div class="input_info_scroll">
                <ul>
                    <%
                        for (int i = 0; i < totalRoles.size(); i++) {
                    %>
                    <li><input type="checkbox" class="select_role" name="selectRolesId"
                               value="<%=totalRoles.get(i).getRoleId()%>"
                            <% for (Role role : adminInfo.getAdminRoles()) {
                                if (totalRoles.get(i).getRoleId().equals(role.getRoleId())) {
                                    out.print("checked");
                                }
                            }
                            %>
                    /><%=totalRoles.get(i).getRoleName()%>
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <span class="color:red;font-size: 10pt;">*</span>
            <div class="validate_msg_tiny validate_msg">至少选择一个</div>
        </div>
        <div class="button_info clearfix">
            <input type="submit" value="保存" class="btn_save"/>
            <input type="button" value="取消" class="btn_save" onclick="location.href='findAdmins.do'"/>
        </div>
    </form>
</div>
<!--主要区域结束-->
<div id="footer">
    <span>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</span>
    <br/>
    <span>版权所有(C)加拿大达内IT培训集团公司 </span>
</div>
</body>
</html>
