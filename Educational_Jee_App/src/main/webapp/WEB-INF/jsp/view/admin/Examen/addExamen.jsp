<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Examen</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- Icônes FontAwesome -->

    <style>
        body {
            background-color: #f4f7fc;
        }
        .container {
            max-width: 800px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #2c3e50;
        }
        label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-primary {
            background: #007bff;
            border: none;
            transition: 0.3s ease;
        }
        .btn-primary:hover {
            background: #0056b3;
            transform: scale(1.05);
        }
        .btn-danger {
            background: #e74c3c;
            transition: 0.3s ease;
        }
        .btn-danger:hover {
            background: #c0392b;
            transform: scale(1.05);
        }
        .form-select {
            cursor: pointer;
        }
    </style>
</head>

<body>
    <!-- Menu de navigation -->
    <jsp:include page="../../fragments/menu.jsp"/>

<div class="container">
    <h2><i class="fas fa-calendar-plus"></i> Ajouter un Examen</h2>
    <div class="card p-4 shadow">
        <form:form modelAttribute="examen" method="post" action="${pageContext.request.contextPath}/admin/Examen/addExamen" enctype="multipart/form-data">

            <!-- Date de l'examen -->
            <div class="mb-3">
                <label for="dateExam"><i class="fas fa-calendar-alt"></i> Date :</label>
                <form:input path="dateExam" id="dateExam" class="form-control" placeholder="YYYY-MM-DD"/>
                <form:errors path="dateExam" cssClass="text-danger"/>
            </div>

            <!-- Heure de début -->
            <div class="mb-3">
                <label for="heureDebut"><i class="fas fa-clock"></i> Heure de Début :</label>
                <form:input path="heureDebut" id="heureDebut" class="form-control" placeholder="HH:MM"/>
                <form:errors path="heureDebut" cssClass="text-danger"/>
            </div>

            <!-- Semestre -->
            <div class="mb-3">
                <label for="semestre"><i class="fas fa-graduation-cap"></i> Semestre :</label>
                <form:select path="semestre" id="semestre" class="form-select">
                    <option value="semestre1">Semestre 1</option>
                    <option value="semestre2">Semestre 2</option>
                </form:select>
            </div>

            <!-- Session -->
            <div class="mb-3">
                <label for="session"><i class="fas fa-user-clock"></i> Session :</label>
                <form:select path="session" id="session" class="form-select">
                    <option value="session normale">Session Normale</option>
                    <option value="session rattrapage">Session Rattrapage</option>
                </form:select>
            </div>

            <!-- Type d'examen -->
            <div class="mb-3">
                <label for="typeExamen"><i class="fas fa-file-alt"></i> Type :</label>
                <form:input path="typeExamen" id="typeExamen" class="form-control" placeholder="Examen final, test..."/>
            </div>

            <!-- Epreuve -->
            <div class="mb-3">
                <label for="epreuve"><i class="fas fa-book"></i> Épreuve :</label>
                <form:input path="epreuve" id="epreuve" class="form-control" placeholder="Matière concernée"/>
            </div>

            <!-- Durée prévue -->
            <div class="mb-3">
                <label for="dureePrevue"><i class="fas fa-hourglass-half"></i> Durée Prévue (minutes) :</label>
                <form:input path="dureePrevue" id="dureePrevue" class="form-control"/>
            </div>

            <!-- Sélection des Enseignants -->
            <div class="mb-3">
                <label for="enseignantIds"><i class="fas fa-chalkboard-teacher"></i> Enseignants :</label>
                <form:select path="enseignantIds" id="enseignantIds" class="form-select" multiple="true">
                    <c:forEach var="enseignant" items="${enseignants}">
                        <option value="${enseignant.idPersonne}">${enseignant.nom} ${enseignant.prenom}</option>
                    </c:forEach>
                </form:select>
            </div>

            <!-- Sélection des Salles -->
            <div class="mb-3">
                <label for="salleIds"><i class="fas fa-building"></i> Salles :</label>
                <form:select path="salleIds" id="salleIds" class="form-select" multiple="true">
                    <c:forEach var="salle" items="${salles}">
                        <option value="${salle.id_salle}">${salle.nom}</option>
                    </c:forEach>
                </form:select>
            </div>

            <!-- Sélection de l'Admin -->
            <div class="mb-3">
                <label for="adminId"><i class="fas fa-user-shield"></i> Admin :</label>
                <form:select path="adminId" id="adminId" class="form-select">
                    <c:forEach var="admin" items="${admins}">
                        <option value="${admin.idPersonne}">${admin.nom} ${admin.prenom}</option>
                    </c:forEach>
                </form:select>
            </div>

            <!-- Bouton de soumission -->
            <div class="d-flex justify-content-center">
                <button type="submit" class="btn btn-primary">Ajouter Examen</button>
            </div>

        </form:form>
    </div>
</div>

<script>
    function validateForm() {
        var salleSelect = document.getElementById("salleIds");
        if (salleSelect.selectedOptions.length === 0) {
            alert("Veuillez sélectionner au moins une salle.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
