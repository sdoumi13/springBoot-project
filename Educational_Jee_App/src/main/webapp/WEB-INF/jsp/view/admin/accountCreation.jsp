<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Personnes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* Ajout d'un espace sous la navbar */
        .content {
            padding: 20px;
            margin-top: 70px;
        }

        /* Centrage de la barre de recherche */
        .search-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .search-bar {
            width: 50%;
            max-width: 500px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            outline: none;
            text-align: center;
        }

        /* Style du tableau - aligné à droite */
        /* Style du tableau */
        .table-container {
            max-width: 1000px;
            margin-left: auto; /* Aligner le tableau à droite */
            margin-right: 0;  /* Enlever la marge droite */
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }


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

        /* Style des boutons d'actions */
        .actions-btn {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        /* Bouton 'Créer un compte' */
        .btn-create-account {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-create-account:hover {
            background-color: #0056b3;
            color: white;
        }

        /* Footer */
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

    <div class="content">
        <div class="table-container">
            <h3 class="text-center mb-4">
                <i class="fas fa-users"></i> Creer Compte pour se connecter
            </h3>

            <!-- Barre de recherche -->
            <div class="search-container">
                <input type="text" class="search-bar" placeholder="🔎 Rechercher une personne..." id="searchInput">
            </div>

            <!-- Tableau -->
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>CIN</th>
                        <th>Nom & Prénom</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="personTable">
                    <c:forEach items="${personList}" var="p">
                        <tr>
                            <td><c:out value="${p.cin}" /></td>
                            <td><c:out value="${p.nom} ${p.prenom}" /></td>
                            <td><c:out value="${p.email}" /></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/createAccountForm/${p.idPersonne}" class="btn-create-account">
                                    <i class="fas fa-plus"></i> Créer un compte
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
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
            const rows = document.querySelectorAll("#personTable tr");

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(input) ? "" : "none";
            });
        });
    </script>
</body>
</html>
