<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Formulaire Enseignant</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2><c:choose>
                <c:when test="${enseignant.id != null}">Modifier</c:when>
                <c:otherwise>Ajouter</c:otherwise>
            </c:choose> un Enseignant</h2>
        <form:form modelAttribute="enseignant" method="post" action="${pageContext.request.contextPath}/admin/enseignant/<c:choose>
                <c:when test="${enseignant.id != null}">edit/${enseignant.id}</c:when>
                <c:otherwise>add</c:otherwise>
            </c:choose>">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <form:input path="nom" id="nom" class="form-control"/>
                <form:errors path="nom" cssClass="text-danger"/>
            </div>
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom</label>
                <form:input path="prenom" id="prenom" class="form-control"/>
                <form:errors path="prenom" cssClass="text-danger"/>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <form:input path="email" id="email" class="form-control"/>
                <form:errors path="email" cssClass="text-danger"/>
            </div>
            <button type="submit" class="btn btn-primary">Soumettre</button>
        </form:form>
    </div>
</body>
</html>
