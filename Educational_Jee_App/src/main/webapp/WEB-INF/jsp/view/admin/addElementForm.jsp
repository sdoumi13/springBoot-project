<%@ page import="com.fstTanger.core.web.models.ElementModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../fragments/adminHeader.jsp" />

<style>
    /* Amélioration du tableau */
    table {
        width: 100%;
        border-radius: 8px;
        overflow: hidden;
        background-color: #ffffff; /* Fond blanc pour un look propre */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Ombre subtile */
        margin-top: 30px;
    }

    table th {
        background-color: #1a2a3d; /* Un bleu plus sombre pour une meilleure visibilité */
        color: bleu; /* Texte blanc */
        text-align: center;
        padding: 15px;
        font-size: 16px;
        font-weight: bold;
    }

    table td {
        text-align: center;
        background-color: grey; /* Couleur claire pour un contraste doux */
        vertical-align: middle;
        padding: 12px;
        font-size: 14px;
        color: #555555; /* Texte gris foncé pour une lecture facile */
        border-bottom: 1px solid #dee2e6; /* Ligne fine entre les lignes */
    }

    /* Effet de survol sur les lignes du tableau */
    table tr:hover {
        background-color: #e2e6ea; /* Survol léger pour améliorer l'interactivité */
        cursor: pointer;
    }

    /* Boutons dans le tableau */
    .table .btn {
        transition: background-color 0.3s ease, transform 0.3s ease;
        padding: 6px 12px;
        border-radius: 5px;
        font-size: 14px;
        margin: 2px;
    }

    .table .btn-danger {
        background-color: #e74c3c;
        color: white;
    }

    .table .btn-danger:hover {
        background-color: #c0392b;
        transform: scale(1.05); /* Effet d'agrandissement pour l'interactivité */
    }

    .table .btn-warning {
        background-color: #f39c12;
        color: white;
    }

    .table .btn-warning:hover {
        background-color: #e67e22;
        transform: scale(1.05);
    }

    /* Conteneur principal avec menu latéral */
    .container {
        margin-left: 80px; /* Ajuster l'espace pour le menu latéral */
        margin-top: 20px;
        padding-bottom: 60px; /* Espacement pour le footer */
    }

    /* Alignement du contenu au centre */
    h3 {
        text-align: center;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* Alignement du menu */
    .navbar {
        margin-bottom: 30px;
    }

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

<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <jsp:include page="../fragments/menu.jsp" />
        </div>
    </nav>

    <h3 class="mt-4">
        <i class="fas fa-plus-circle"></i> Ajout d'un Élément Pédagogique 📚
    </h3>

    <f:form action="addElement" method="POST" modelAttribute="elementModel">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

        <div class="row mb-3">
            <div class="col-md-6">
                <label class="form-label"><i class="fas fa-book"></i> Nom de la Matière Pédagogique</label>
                <f:input path="titre" type="text" class="form-control" placeholder="Nom de la matière" />
                <f:errors path="titre" class="text-danger" />
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
                <f:errors path="typeElement" class="text-danger" />
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label class="form-label"><i class="fas fa-graduation-cap"></i> Niveau</label>
                <f:select path="niveau" class="form-control">
                    <f:option value="" label="Sélectionner un Niveau" />
                    <f:option value="AP1" label="Année Préparatoire 1" />
                    <f:option value="AP2" label="Année Préparatoire 2" />
                    <f:option value="ID1" label="Ingénierie de Données 1" />
                    <f:option value="ID2" label="Ingénierie de Données 2" />
                    <f:option value="GI2" label="Génie Informatique 2" />
                    <f:option value="MSBD" label="Master Security IT & Big Data (SI&BD)" />
                </f:select>
                <f:errors path="niveau" class="text-danger" />
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
                <f:errors path="idPersonne" class="text-danger" />
            </div>
        </div>

        <div class="text-end mt-3">
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Ajouter</button>
            <button type="reset" class="btn btn-secondary"><i class="fas fa-undo"></i> Réinitialiser</button>
        </div>
    </f:form>

    <h3 class="mt-5"><i class="fas fa-list"></i> Liste des Éléments Pédagogiques</h3>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th scope="col">Niveau</th>
                <th scope="col">Type Élément</th>
                <th scope="col">Titre</th>
                <th scope="col">Enseignant</th>
                <th scope="col">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${elementList}" var="p">
                <tr>
                    <td><c:out value="${p.niveau}" /></td>
                    <td><c:out value="${p.typeElement}" /></td>
                    <td><c:out value="${p.titre}" /></td>
                    <td><c:out value="${p.idPersonne}" /></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/deleteElement/${p.idElement}" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i> Supprimer
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/updateEleForm/${p.idElement}" class="btn btn-warning btn-sm">
                            <i class="fas fa-edit"></i> Modifier
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div class="footer">
    <p>© 2025 - FSTT - Tous droits réservés</p>
</div>

<script>
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let input = this.value.toLowerCase();
        let options = document.querySelectorAll("#enseignantSelect option");

        options.forEach(option => {
            let text = option.textContent.toLowerCase();
            option.style.display = text.includes(input) || option.value === "" ? "" : "none";
        });
    });
</script>

<jsp:include page="../fragments/adminfooter.jsp" />
