<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Comptes Utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* Centrage général */
        body {
            background-color: #f5f5f5;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Conteneur du tableau */
        .table-container {
            max-width: 1000px;
            width: 100%;
            background-color: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 50px;
        }

        /* Barre de recherche centrée */
        .search-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-bar {
            width: 60%;
            max-width: 500px;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            text-align: center;
        }

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

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8f9fa;
        }

        /* Boutons d'actions */
        .btn-action {
            font-size: 14px;
            padding: 6px 12px;
            border-radius: 5px;
        }

        /* Footer bien aligné */
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
</head>
<body>

    <!-- Inclusion de la navbar -->
    <jsp:include page="../fragments/menu.jsp" />

    <div class="table-container">
        <h3 class="text-center mb-4">
            <i class="fas fa-user-shield"></i> Liste des Comptes Utilisateurs
        </h3>

        <!-- Barre de recherche centrée -->
        <div class="search-container">
            <input type="text" class="search-bar" placeholder="🔎 Rechercher un compte..." id="searchInput">
        </div>

        <!-- Tableau centré -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Login</th>
                    <th>Rôle</th>
                    <th>Nom</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="accountTable">
                <c:forEach items="${accountList}" var="a">
                    <tr>
                        <td><c:out value="${a.login}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${a.role.nomRole == 'ROLE_ADMIN'}">
                                    <span class="badge bg-primary">Administrateur</span>
                                </c:when>
                                <c:when test="${a.role.nomRole == 'ROLE_STUDENT'}">
                                    <span class="badge bg-success">Étudiant</span>
                                </c:when>
                                <c:when test="${a.role.nomRole == 'ROLE_CADRE_ADMIN'}">
                                    <span class="badge bg-warning">Cadre Admin</span>
                                </c:when>
                                <c:when test="${a.role.nomRole == 'ROLE_PROF'}">
                                    <span class="badge bg-danger">Professeur</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary"><c:out value="${a.role.nomRole}" /></span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><c:out value="${a.proprietaire.nom} ${a.proprietaire.prenom}" /></td>
                        <td><c:out value="${a.proprietaire.email}" /></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/updateAccount/${a.idCompte}"
                               class="btn btn-warning btn-sm btn-action">
                                ✏ Modifier
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/deleteAccount/${a.idCompte}"
                               class="btn btn-danger btn-sm btn-action">
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
        © 2025 - FSTT - Tous droits réservés
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById("searchInput").addEventListener("keyup", function() {
            const input = this.value.toLowerCase();
            const rows = document.querySelectorAll("#accountTable tr");

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(input) ? "" : "none";
            });
        });
    </script>
</body>
</html>
