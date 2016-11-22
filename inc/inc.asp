<%
if not session("login")=1 then
Response.Write "<Script Language=JavaScript>alert('非法用户！请先登录！');window.close();</Script>"
End If
session.timeout=120
%>
