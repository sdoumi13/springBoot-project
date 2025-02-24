<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cr�er un Groupe</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Cr�er un Groupe</h2>

        <form:form modelAttribute="groupeModel" method="post" action="${pageContext.request.contextPath}/admin/Groupe/addGroupe">
            <div class="form-group">
                <label for="nomGroupe">Nom du Groupe:</label>
                <form:input path="nomGroupe" id="nomGroupe" class="form-control" placeholder="Entrez le nom du groupe"/>
            </div>
            <div class="form-group">
                <label>Type de Groupe:</label>
                <div class="form-check">
                    <form:radiobutton path="typeGroupe" value="filiere" class="form-check-input" id="filiere"/>
                    <label for="filiere" class="form-check-label">Fili�re</label>
                </div>
                <div class="form-check">
                    <form:radiobutton path="typeGroupe" value="departement" class="form-check-input" id="departement"/>
                    <label for="departement" class="form-check-label">D�partement</label>
                </div>
                <div class="form-check">
                    <form:radiobutton path="typeGroupe" value="aleatoire" class="form-check-input" id="aleatoire"/>
                    <label for="aleatoire" class="form-check-label">Al�atoire</label>
                </div>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <form:textarea path="description" id="description" class="form-control" placeholder="Entrez une description"/>
            </div>
            <div class="form-group">
                <label for="enseignantIds">Enseignants:</label>
                <form:select path="enseignantIds" multiple="true" class="form-control">
                    <c:forEach var="enseignant" items="${enseignants}">
                        <form:option value="${enseignant.idPersonne}">
                            ${enseignant.nom} ${enseignant.prenom} (${enseignant.idPersonne})
                        </form:option>
                    </c:forEach>
                </form:select>
                <small class="form-text text-muted">S�lectionnez les enseignants du groupe</small>
            </div>
            <div class="form-group">
                <label for="nouvelEnseignantId">Nouvel Enseignant:</label>
                <input type="text" name="nouvelEnseignantId" id="nouvelEnseignantId" class="form-control" placeholder="ID de l'enseignant � ajouter">
            </div>
            <button type="submit" class="btn btn-primary">Ajouter Groupe</button>
        </form:form>
    </div>
</body>
</html>
