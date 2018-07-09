<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
	<div align="center">
		<h1>
			<spring:message code="creerRencontre.titre" />
			<br>
			<br>
		</h1>
	</div>
	<br>
	<form method="POST" action="creer" modelAttribute="rencontre">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div align="center">
		<spring:message code="creerRencontre.choixSport" />
		</div>
		<div align="center">
			<TABLE BORDER=0><!-- Tableau 4 colonnes et 6 lignes -->
				<tr>					
					<td nowrap><form:label path="rencontre.equipe1.nom">
							<spring:message code="creerRencontre.equipe1" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="rencontre.equipe2.nom">
							<spring:message code="creerRencontre.equipe2" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><form:input path="rencontre.equipe1.nom" class="form-control" /></td>
					<td><form:errors path="rencontre.equipe1.nom" cssClass="errors" /></td>
					<td><form:input path="rencontre.equipe2.nom" class="form-control" /></td>
					<td><form:errors path="rencontre.equipe2.nom" cssClass="errors" /></td>
				</tr>
				<tr>					
					<td nowrap><form:label path="rencontre.cote1">
							<spring:message code="creerRencontre.cote" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
					<td nowrap><form:label path="rencontre.cote2">
							<spring:message code="creerRencontre.cote" />
							<span class="required">*</span>
						</form:label></td>
					<td></td>
				</tr>
				<tr>
					<td><form:input path="rencontre.cote1" class="form-control" /></td>
					<td><form:errors path="rencontre.cote1" cssClass="errors" /></td>
					<td><form:input path="rencontre.cote2" class="form-control" /></td>
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
					<td><form:input path="rencontre.dateDebut" class="form-control" /></td>
					<td><form:errors path="rencontre.dateDebut" cssClass="errors" /></td>
					<td><form:input path="rencontre.dateFin" class="form-control" /></td>
					<td><form:errors path="rencontre.dateFin" cssClass="errors" /></td>
				</tr>
			</TABLE>
		</div>
		<br>
		<div align="center">
			<input type="submit" class="btn btn-success" value="Valider" align="center" />
			<br>
			<br>
			<a href="goToMenuAdmin">Retour</a>
		</div>
	</form>
</body>
</html>