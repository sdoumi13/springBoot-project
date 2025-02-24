<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Examens</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #f4f7fc;
        }
        .container {
            margin-top: 50px;
            max-width: 90%;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 20px;
        }
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }
        .table thead {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table tbody tr {
            text-align: center;
        }
        .btn-action {
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 5px;
            margin: 3px;
        }
        .btn-edit {
            background-color: #ffc107;
            color: black;
        }
        .btn-edit:hover {
            background-color: #e0a800;
        }
        .btn-delete {
            background-color: #dc3545;
            color: white;
        }
        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

    <!-- Menu de navigation -->
    <jsp:include page="../../fragments/menu.jsp"/>

    <div class="container">
        <h2><i class="fas fa-calendar-alt"></i> Liste des Examens</h2>

        <div class="table-responsive">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Heure de Début</th>
                        <th>Semestre</th>
                        <th>Session</th>
                        <th>Type</th>
                        <th>Epreuve</th>
                        <th>Durée</th>
                        <th>Enseignants</th>
                        <th>Salles</th>
                        <th>Admin</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="examen" items="${examens}">
                        <tr>
                            <td>${examen.id}</td>
                            <td>${examen.dateExam}</td>
                            <td>${examen.heureDebut}</td>
                            <td>${examen.semestre}</td>
                            <td>${examen.session}</td>
                            <td>${examen.typeExamen}</td>
                            <td>${examen.epreuve}</td>
                            <td>${examen.dureePrevue} min</td>
                            <td>
                                <c:forEach var="enseignantId" items="${examen.enseignantIds}">
                                    <c:forEach var="enseignant" items="${enseignants}">
                                        <c:if test="${enseignant.idPersonne == enseignantId}">
                                            ${enseignant.nom} ${enseignant.prenom}<br/>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="salleId" items="${examen.salleIds}">
                                    <c:forEach var="salle" items="${salles}">
                                        <c:if test="${salle.id_salle == salleId}">
                                            ${salle.nom}<br/>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="adminId" items="${examen.adminIds}">
                                    <c:forEach var="admin" items="${admins}">
                                        <c:if test="${admin.idPersonne == adminId}">
                                            ${admin.nom} ${admin.prenom}
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/Examen/edit/${examen.id}" class="btn btn-edit btn-action">Éditer</a>
                                <a href="${pageContext.request.contextPath}/admin/Examen/delete/${examen.id}" class="btn btn-delete btn-action">Supprimer</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>
