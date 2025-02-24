<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<jsp:include page="../fragments/adminHeader.jsp" />

<div class="container mt-5">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <jsp:include page="../fragments/menu.jsp" />
        </div>
    </nav>

    <div class="page-header mb-4">
        <h3 class="text-center">Création d'un Compte</h3>
    </div>

    <!-- Formulaire pour la création de compte -->
    <div class="form-container">
        <f:form action="${pageContext.request.contextPath}/admin/addAccount"
                method="POST" modelAttribute="accountModel">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <f:hidden path="personId"/>

            <div class="row">
                <div class="col-md-6">
                    <label for="roleSelect">Choisir le Role d'utilisateur</label>
                    <f:select path="roleId" class="form-control" id="roleSelect" multiple="false">
                        <f:options items="${roleList}" itemValue="idRole" itemLabel="nomRole" />
                    </f:select>
                </div>
            </div>

            <div class="button-container text-right mt-4">
                <button type="submit" class="btn btn-primary btn-lg" style="transition: 0.3s;">Créer</button>
                <button type="reset" class="btn btn-secondary btn-lg" style="transition: 0.3s;">Réinitialiser</button>
            </div>
        </f:form>
    </div>

    <!-- Footer -->
    <div class="footer">
        © 2025 - FSTT - Tous droits réservés
    </div>
</div>

<!-- Styles CSS pour animations et améliorations d'affichage -->
<style>
    .container {
        margin-top: 60px;
    }

    /* Animation du formulaire */
    .form-container {
        animation: fadeIn 1s ease-out;
    }

    /* Animation de la page */
    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 1;
        }
    }

    /* Style des boutons */
    .btn-lg {
        padding: 12px 20px;
        font-size: 16px;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-secondary {
        background-color: #6c757d;
        border: none;
        border-radius: 5px;
        transition: 0.3s;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
    }

    /* Style du header de la page */
    .page-header {
        text-align: center;
        margin-top: 50px;
        animation: slideIn 1s ease-out;
    }

    /* Animation pour le header */
    @keyframes slideIn {
        0% {
            transform: translateY(-30px);
            opacity: 0;
        }
        100% {
            transform: translateY(0);
            opacity: 1;
        }
    }
    .footer {
        background-color: #343a40;
        color: white;
        text-align: center;
        padding: 15px 0;
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        font-size: 14px;
    }
</style>

<!-- Scripts JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>

</script>

