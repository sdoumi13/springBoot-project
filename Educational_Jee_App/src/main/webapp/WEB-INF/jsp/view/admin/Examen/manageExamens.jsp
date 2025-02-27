<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des Examens</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
</head>
<body>

    <!-- Menu de navigation -->
    <jsp:include page="../../fragments/menu.jsp"/>

    <div class="container mt-5">
        <h2>Liste des Examens</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Heure de D�but</th>
                    <th>Semestre</th>
                    <th>Session</th>
                    <th>Type</th>
                    <th>Epreuve</th>
                    <th>Dur�e Pr�vue</th>
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
                        <td>${examen.dureePrevue}</td>
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
                                        ${admin.nom} ${admin.prenom}<br/>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/Examen/edit/${examen.id}" class="btn btn-warning">�diter</a>
                            <a href="${pageContext.request.contextPath}/admin/Examen/delete/${examen.id}" class="btn btn-danger">Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
