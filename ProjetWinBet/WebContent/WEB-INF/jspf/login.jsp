<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title><spring:message code="login.title" /></title>
<link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>
		<spring:message code="login.title" />
	</h2>
	<c:if test="${param.error}">
		<span class="error"><spring:message code="login.inconnu" /></span>
	</c:if>
	<c:if test="${param.logout}">
		<span class="error"><spring:message code="login.logout" /></span>
	</c:if>
	<form method="POST" action="<c:url value="/login" />">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<label for="username"><spring:message code="login.username" /></label>
		<input type="text" name="username" value="">
		<br>
		<label for="password"><spring:message code="login.password" /></label>
		<input type="password" name="password" value="">
		<br>
		<input type="submit" value="<spring:message code="login.submit" />" />
	</form>
</body>
</html>