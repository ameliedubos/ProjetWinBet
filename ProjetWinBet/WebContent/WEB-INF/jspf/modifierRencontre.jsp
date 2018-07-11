<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Formulaire des rencontres</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value="/static/css/styles.css" />" rel="stylesheet">
</head>
<body>
<div class="container">
<br>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand titre"><spring:message code="accueil.titre" /></a>
    </div>
    <ul class="nav navbar-nav">
    <li class="active"><a href="<c:url value="/admin/goToAccueil" />">Accueil</a></li>
       <li class="active"><a href="<c:url value="/admin/goToMenuAdmin" />">Mon Menu</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/logout" />"><span class="glyphicon glyphicon-log-out"></span> <spring:message code="accueil.deconnecter" /></a></li>
    </ul>
  </div>
</nav>


	<div align="center">
		<h1>
			<spring:message code="modifierRencontre.titre" />
			<br>
			<br>
		</h1>
	</div>
	<br>
	<form method="POST" action="goToValidSport" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<div align="center">
		<form:label path="rencontre.equipe1.sport.id"><spring:message code="modifierRencontre.sport" /></form:label>
		<c:out value="${sport}" />
		</div>
	</form>
		
	<form method="POST" action="${pageContext.request.contextPath}/admin/modifier" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<form:hidden path="rencontre.id"/>
		<div align="center">
			<TABLE class="tablecreerrencontre"><!-- Tableau 4 colonnes et 6 lignes -->
				<tr>					
					<td nowrap>
					<form:label path="rencontre.equipe1.id">
							<spring:message code="creerRencontre.equipe1" />
					</form:label>
						</td>
					<td></td>
					<td nowrap><form:label path="rencontre.equipe2.id">
							<spring:message code="creerRencontre.equipe2" />
							</form:label></td>
					<td></td>
				</tr>
				<tr>
 					<td><c:out value="${equipe1}" /><form:input type="hidden" path="rencontre.equipe1.id" class="form-control" /></td>
					<td><form:errors path="rencontre.equipe1.id" cssClass="errors" /></td>
					<td><c:out value="${equipe2}" /><form:input type="hidden" path="rencontre.equipe2.id" class="form-control" /></td>
					<td><form:errors path="rencontre.equipe2.id" cssClass="errors" /></td>
				</tr>
				<tr>					
					<td nowrap><form:label path="rencontre.cote1">
							<spring:message code="creerRencontre.coteDomicile" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="rencontre.cote2">
							<spring:message code="creerRencontre.coteExterieure" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><form:input path="rencontre.cote1" class="form-control" required="required"/></td>
					<td><form:errors path="rencontre.cote1" cssClass="errors" /></td>
					<td><form:input path="rencontre.cote2" class="form-control" required="required"/></td>
					<td><form:errors path="rencontre.cote2" cssClass="errors" /></td>
				</tr>
				<tr>					
					<td nowrap><form:label path="rencontre.dateDebut">
							<spring:message code="creerRencontre.dateDebut" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="rencontre.dateFin">
							<spring:message code="creerRencontre.dateFin" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td>
					<%-- <fmt:formatDate type = "both" timeStyle = "short" value="${now}"/> --%>
					<form:input type="date" path="rencontre.dateDebut" class="form-control" required="required" />
					</td>
					<td></td>
					<td><form:input type="date" path="rencontre.dateFin" class="form-control" required="required"/></td>
					<td></td>
				</tr>
				<tr>
				<td colspan="4"><form:errors path="rencontre.dateDebut" cssClass="errors" />
				<form:errors path="rencontre.dateFin" cssClass="errors" /></td>
				</tr>
			</TABLE>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-primary" value="Valider" align="center" />&nbsp;&nbsp;
			<a class="btn btn-danger" href="<c:url value="/admin/goToMenuAdmin" />">Annuler</a>
		</div>
	</form>
	</div>
</body>
</html>