<%@page import="com.fstTanger.core.web.models.PersonModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../fragments/adminHeader.jsp" />


<style>
    /* Style du tableau */
    .table th {
        background-color: #212529;
        color: white;
        text-align: center;
    }
    .table td {
        text-align: center;
        vertical-align: middle;
    }
    .badge {
        font-size: 14px;
        padding: 5px 10px;
        border-radius: 8px;
    }
    .actions-btn {
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    .search-bar {
        width: 50%;
        margin-bottom: 15px;
    }
    /* Footer Fix */
    .footer {
        background-color: #343a40;
        color: white;
        text-align: center;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
    }
</style>

<div class="container mt-4">
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <jsp:include page="../fragments/menu.jsp" />
        </div>
    </nav>
    <h3 class="mb-3">
        <i class="fas fa-user-plus"></i> Ajouter un
        <c:choose>
            <c:when test="${personModel.typePerson == PersonModel.TYPE_PROF}">Professeur</c:when>
            <c:when test="${personModel.typePerson == PersonModel.TYPE_STUDENT}">Étudiant</c:when>
            <c:when test="${personModel.typePerson == PersonModel.TYPE_CADRE_ADMIN}">Cadre Administratif</c:when>
        </c:choose>
    </h3>

    <!-- Formulaire d'ajout -->
    <f:form action="addPerson" method="POST" modelAttribute="personModel">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div class="row mb-3">
            <div class="col-md-4">
                <label><b>CIN</b></label>
                <f:input path="cin" type="text" class="form-control" placeholder="CIN"/>
                <f:errors path="cin" class="text-danger"/>
            </div>
            <div class="col-md-4">
                <label><b>Nom</b></label>
                <f:input path="nom" type="text" class="form-control" placeholder="Nom"/>
                <f:errors path="nom" class="text-danger"/>
            </div>
            <div class="col-md-4">
                <label><b>Prénom</b></label>
                <f:input path="prenom" type="text" class="form-control" placeholder="Prénom"/>
                <f:errors path="prenom" class="text-danger"/>
            </div>
        </div>

        <f:hidden path="typePerson"/>

        <c:choose>
            <c:when test="${personModel.typePerson == PersonModel.TYPE_PROF}">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label><b>Spécialité</b></label>
                        <f:input path="specialite" type="text" class="form-control" placeholder="Spécialité"/>
                        <f:errors path="specialite" class="text-danger"/>
                    </div>
                </div>
            </c:when>

            <c:when test="${personModel.typePerson == PersonModel.TYPE_STUDENT}">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label><b>CNE</b></label>
                        <f:input path="cne" type="text" class="form-control" placeholder="CNE"/>
                        <f:errors path="cne" class="text-danger"/>
                    </div>
                </div>
            </c:when>

            <c:when test="${personModel.typePerson == PersonModel.TYPE_CADRE_ADMIN}">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label><b>Grade</b></label>
                        <f:input path="grade" type="text" class="form-control" placeholder="Grade"/>
                        <f:errors path="grade" class="text-danger"/>
                    </div>
                </div>
            </c:when>
        </c:choose>

        <div class="row mb-3">
            <div class="col-md-6">
                <label><b>Email</b></label>
                <f:input path="email" class="form-control" placeholder="Email"/>
                <f:errors path="email" class="text-danger"/>
            </div>
        </div>

        <div class="text-end">
            <button type="submit" class="btn btn-primary">Enregistrer</button>
            <button type="reset" class="btn btn-secondary">Annuler</button>
        </div>
    </f:form>
</div>

<!-- Liste des personnes -->
<div class="container mt-5">
    <h3>Liste des Personnes</h3>
    <input type="text" class="form-control search-bar" placeholder="🔎 Rechercher..." id="searchInput">

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Type</th>
                <th>CIN</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Email</th>
                <th>Téléphone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="personTable">
            <c:forEach items="${personList}" var="p">
                <tr>
                    <td>
                        <span class="badge bg-primary">${p.typePerson == 1 ? "Professeur" : (p.typePerson == 2 ? "Étudiant" : "Cadre Admin")}</span>
                    </td>
                    <td><c:out value="${p.cin}"/></td>
                    <td><c:out value="${p.nom}"/></td>
                    <td><c:out value="${p.prenom}"/></td>
                    <td><c:out value="${p.email}"/></td>
                    <td><c:out value="${p.telephone}"/></td>
                    <td class="actions-btn">
                        <a href="${pageContext.request.contextPath}/admin/updatePersonForm/${p.idPersonne}" class="btn btn-warning btn-sm">
                            ✏ Modifier
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/deletePerson/${p.idPersonne}" class="btn btn-danger btn-sm">
                            🗑 Supprimer
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer -->
<div class="footer">
    <p>© 2025 - FSTT - Tous droits réservés</p>
</div>

<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let input = this.value.toLowerCase();
        let rows = document.querySelectorAll("#personTable tr");

        rows.forEach(row => {
            let text = row.textContent.toLowerCase();
            row.style.display = text.includes(input) ? "" : "none";
        });
    });
</script>

<jsp:include page="../fragments/adminfooter.jsp" />
