<%
strconnection="DSN=test3;UID=;PWD="
Set conn = Server.CreateObject("ADODB.Connection") 
conn.Open strConnection

strconnection="DSN=test0;UID=;PWD="
Set conn2 = Server.CreateObject("ADODB.Connection") 
conn2.Open strConnection

sql="select * from aaa"
set rs=conn.execute(sql)
while not rs.eof
	response.Write rs(0)&"<br>"
	sql="insert into h011 (SMT_news) values ('"&rs(0)&"')"
	conn2.execute(sql)
	rs.movenext()
wend
conn.close()
conn2.close()
%>
