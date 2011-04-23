
<%@ page language="java" import="java.util.*" %>
<%@ page import="de.laliluna.tutorial.library.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Book list page</title>
    
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
  	<table border="1">
  		<tbody>
  		<tr>
			<td>Author</td>
			<td>Book name</td>
			<td>Available</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	  <%
	  	Collection collection = (Collection)request.getAttribute("books");
	  	
	  	for (Iterator iter = collection.iterator(); iter.hasNext();) {
	  		Book element = (Book) iter.next();
			out.println("<tr>");
			out.println("<td>" + element.getAuthor() + "</td>");
			out.println("<td>" + element.getTitle() + "</td>");
			if(element.isAvailable())
				out.println("<td><input type=\"checkbox\" name=\"available\" value=\"true\" disabled checked></td>");
			else
				out.println("<td><input type=\"checkbox\" name=\"available\" value=\"true\" disabled></td>");
			
			out.println("<td><a href=\"bookEdit?do=edit&id=" + element.getId() + "\">Edit</a></td>");
			out.println("<td><a href=\"bookEdit?do=delete&id=" + element.getId() + "\">Delete</a></td>");
			out.println("</tr>");
	  	}
	  %>
  		</tbody>
  	</table>
  	<br>
  	<a href="bookEdit?do=add">Add a new book</a>
  </body>
</html>
