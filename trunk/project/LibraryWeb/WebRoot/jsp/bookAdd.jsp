<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Book edit page</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
  </head>
  <body>
	<form name="edit" action="bookEdit" method="post">
		<table border="1">
			<tbody>
				<tr>
					<td>Author:</td>
					<td><input type="text" name="author" value=""></td>		
					</tr><tr>		
					<td>Title:</td>	
					<td><input type="text" name="title" value=""></td>
					</tr><tr>
					<td>Available:</td>
					<td><input type="checkbox" name="available" value="true"></td>
					</tr><tr>	
					<td colspan="2"><input type="submit" name="btnSave" value="Save"></td>
				</tr>
			</tbody>
		</table>
	</form>
  </body>
</html>
