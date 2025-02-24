<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Enseignants</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>P
<body>
    <div class="container mt-5">
        <h2>Liste des Enseignants</h2>
        <a href="${pageContext.request.contextPath}/admin/enseignant/add" class="btn btn-primary mb-3">Ajouter un Enseignant</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="enseignant" items="${enseignants}">
                    <tr>
                        <td>${enseignant.id}</td>
                        <td>${enseignant.nom} ${enseignant.prenom}</td>
                        <td>${enseignant.email}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/enseignant/edit/${enseignant.id}" class="btn btn-warning">Modifier</a>
                            <a href="${pageContext.request.contextPath}/admin/enseignant/delete/${enseignant.id}" class="btn btn-danger">Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
