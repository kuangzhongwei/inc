<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="YTC.back.admin.menu" %>
<html>
<head>
<title>menu</title>
<link rel="stylesheet" href="skin/css/base.css" type="text/css" />
<link rel="stylesheet" href="skin/css/menu.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<script language="javascript" type="text/javascript" src="skin/js/frame/menu.js"></script>
<base target="main" />
</head>
<body target="main">
<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
  <tr>
    <td style='padding-left:3px;padding-top:8px' valign="top">
	<!-- Item 1 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items1_1")'><b>���ò���</b></dt>
        <dd style='display:block' class='sitem' id='items1_1'>
          <ul class='sitemu'>
            <li>
              <div class='items'>
                <div class='fllct'><a href='archives.html' target='main'>��վ��Ŀ����</a></div>
                <div class='flrct'> <a href='archives.html' target='main'><img src='skin/images/frame/gtk-sadd.png' alt='������Ŀ' title='������Ŀ'/></a> </div>
              </div>
            </li>
            <li><a href='archives.html' target='main'>���е����б�</a> </li>
            <li>
              <div class='items'>
                <div class='fllct'><a href='archives.html' target='main'>���ݻ���վ</a></div>
                <div class='flrct'> <a href='archives.html' target='main'><img src='skin/images/frame/gtk-del.png' alt='��ջ���վ' title='��ջ���վ'/></a> </div>
              </div>
            </li>
          </ul>
        </dd>
      </dl>
      <!-- Item 1 End -->
      <!-- Item 2 Strat -->
      <dl class='bitem'>
        <dt onClick='showHide("items2_1")'><b>ϵͳ����</b></dt>
        <dd style='display:block' class='sitem' id='items2_1'>
          <ul class='sitemu'>
            <li><a href='http://www.865171.cn' target='_blank'>�ٷ���վ</a></li>
            <li><a href='http://www.865171.cn/admin-templates/' target='_blank'>�����̨ģ��</a></li>
          </ul>
        </dd>
      </dl>
      <!-- Item 2 End -->
	  </td>
  </tr>
</table>
</body>
</html>