<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Successful</title>
</head>
<body>

You have registered successfully</br>

Your name is <%= request.getParameter("name")  %> </br>

Your language is <%= request.getParameter("surname")  %> </br>

You will write about 
<% for( String topic: request.getParameterValues("topics")){
	out.println(topic + ", ");
	}
%> </br>

</body>
</html>