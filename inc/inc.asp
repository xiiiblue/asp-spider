<%
if not session("login")=1 then
Response.Write "<Script Language=JavaScript>alert('�Ƿ��û������ȵ�¼��');window.close();</Script>"
End If
session.timeout=120
%>
