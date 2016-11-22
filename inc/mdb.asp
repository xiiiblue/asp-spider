<%
strconnection="DRIVER={MySQL ODBC 3.51 Driver}; SERVER=localhost; DATABASE=sch2; UID=root;PASSWORD=123456; OPTION=3"
Set conn = Server.CreateObject("ADODB.Connection") 
conn.Open strConnection
%>