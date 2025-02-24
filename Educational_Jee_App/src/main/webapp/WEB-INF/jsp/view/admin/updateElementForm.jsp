<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../fragments/adminHeader.jsp" />

<style>
    .container {
        margin-top: 20px;
    }

    .form-label {
        font-weight: bold;
    }

    .form-control {
        border-radius: 8px;
    }

    .form-check-input {
        margin-right: 5px;
    }

    .alert-success {
        text-align: center;
        font-weight: bold;
    }

    .btn {
        border-radius: 6px;
        padding: 8px 15px;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-secondary {
        background-color: #6c757d;
        border: none;
    }

    .btn-secondary:hover {
        background-color: #565e64;
    }

    .search-bar {
        margin-bottom: 15px;
    }

    .form-errors {
        color: red;
        font-size: 13px;
    }

</style>

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <jsp:include page="../fragments/menu.jsp" />
        </div>
    </nav>

    <h3 class="mt-4">
        <i class="fas fa-edit"></i> Mise à jour d'un Élément Pédagogique 📚
    </h3>

    <!-- Message de succès -->
    <c:if test="${not empty msg}">
        <div class="alert alert-success" role="alert">
            ✅ ${msg}
        </div>
    </c:if>

    <f:form action="${pageContext.request.contextPath}/admin/updateElement" method="POST" modelAttribute="elementModel" onsubmit="return confirmUpdate();">
        <f:hidden path="idElement" />
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label"><i class="fas fa-book"></i> Nom de la Matière Pédagogique</label>
                <f:input path="titre" type="text" class="form-control" placeholder="Nom de la matière" />
                <f:errors path="titre" class="form-errors" />
            </div>

            <div class="col-md-6">
                <label class="form-label"><i class="fas fa-layer-group"></i> Type Élément</label>
                <div class="form-check">
                    <f:radiobutton path="typeElement" value="module" class="form-check-input" id="module"/>
                    <label class="form-check-label" for="module">Module</label>
                </div>
                <div class="form-check">
                    <f:radiobutton path="typeElement" value="element" class="form-check-input" id="element"/>
                    <label class="form-check-label" for="element">Élément</label>
                </div>
                <f:errors path="typeElement" class="form-errors" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label"><i class="fas fa-graduation-cap"></i> Niveau</label>
                <f:select path="niveau" class="form-control">
                    <f:option value="" label="Sélectionner un Niveau" />
                    <f:option value="AP1" label="Année Préparatoire 1" />
                    <f:option value="AP2" label="Année Préparatoire 2" />
                    <f:option value="ID1" label="Ingénierie de Données 1" />
                    <f:option value="ID2" label="Ingénierie de Données 2" />
                    <f:option value="GI2" label="Génie Informatique 2" />
                </f:select>
                <f:errors path="niveau" class="form-errors" />
            </div>

            <div class="col-md-6">
                <label class="form-label"><i class="fas fa-chalkboard-teacher"></i> Enseignant</label>
                <input type="text" class="form-control search-bar" placeholder="🔎 Rechercher un enseignant..." id="searchInput">

                <f:select path="idPersonne" class="form-control" id="enseignantSelect">
                    <f:option value="" label="Sélectionner un Enseignant" />
                    <c:forEach items="${enseignants}" var="enseignant">
                        <f:option value="${enseignant.idPersonne}" label="${enseignant.nom} ${enseignant.prenom}" />
                    </c:forEach>
                </f:select>
                <f:errors path="idPersonne" class="form-errors" />
            </div>
        </div>

        <div class="text-end mt-3">
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Mettre à Jour</button>
            <button type="reset" class="btn btn-secondary"><i class="fas fa-undo"></i> Réinitialiser</button>
        </div>
    </f:form>
</div>

<!-- Script pour filtrer les enseignants -->
<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let input = this.value.toLowerCase();
        let options = document.querySelectorAll("#enseignantSelect option");

        options.forEach(option => {
            let text = option.textContent.toLowerCase();
            option.style.display = text.includes(input) || option.value === "" ? "" : "none";
        });
    });

    function confirmUpdate() {
        return confirm("Êtes-vous sûr de vouloir mettre à jour cet élément pédagogique ?");
    }
</script>

<jsp:include page="../fragments/adminfooter.jsp" />
