<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

</head>
</head>
<body>
<section>
<article>
	<div class="container" align="center">
	<form action="login" method="post" onsubmit="return loginValid();">
		<table class="table table-hover">
			<tr >
				<th>
					ID
				</th>
				<td>
					<input type="text" name="userid" id="userid" onkeydown="hanBlock(this);" style="ime-mode:disabled;" />
				</td>
			</tr>
			<tr>
				<th>
					Password
				</th>
				<td>
					<input type="password" name="userpw" id="userpw" />
				</td>
			</tr>	
		</table>
		<div class="container" align="center">
			<button type="submit" class="btn btn-primary">Login</button>
			<button type="button" class="btn btn-default" onclick="return home()">Home</button>
		</div>
	</form>
	</div>
</article>
</section>

<footer>
	
</footer>
</body>
</html>