<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espace Étudiant - ${etudiant.prenom} ${etudiant.nom}</title>

    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #34495e;
            --accent-color: #3498db;
            --light-bg: #ecf0f1;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar-custom {
            background-color: var(--primary-color);
            padding: 1rem;
        }

        .student-info-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .student-info-card:hover {
            transform: translateY(-5px);
        }

        .quick-stats {
            background: white;
            border-radius: 15px;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .quick-stats:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }

        .stat-icon {
            font-size: 2.5rem;
            color: var(--accent-color);
            margin-bottom: 1rem;
        }

        .action-btn {
            transition: all 0.3s ease;
            border-radius: 10px;
            padding: 12px 24px;
        }

        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-section {
            background: var(--primary-color);
            color: white;
            padding: 2rem;
            border-radius: 15px;
            margin-bottom: 2rem;
        }

        .upcoming-exams {
            background: white;
            border-radius: 15px;
            padding: 20px;
            margin-top: 2rem;
        }

        .exam-item {
            border-left: 4px solid var(--accent-color);
            padding: 15px;
            margin: 10px 0;
            background: #f8f9fa;
            transition: all 0.3s ease;
        }

        .exam-item:hover {
            transform: translateX(10px);
            background: #e9ecef;
        }
    </style>
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-graduation-cap me-2"></i>Espace Étudiant
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/notifications">
                            <i class="fas fa-bell me-1"></i>Notifications
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt me-1"></i>Déconnexion
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <!-- Profile Section -->
        <div class="profile-section">
            <div class="row align-items-center">
                <div class="col-md-2 text-center">
                    <i class="fas fa-user-circle fa-5x mb-3"></i>
                </div>
                <div class="col-md-10">
                    <h1 class="mb-0">Bienvenue, ${etudiant.prenom} ${etudiant.nom}</h1>
                    <p class="lead mb-0">CNE: ${etudiant.cne}</p>
                    <small><i class="fas fa-calendar me-2"></i>Date de naissance:
                        <fmt:formatDate value="${etudiant.dateNaissance}" pattern="dd MMMM yyyy"/>
                    </small>
                </div>
            </div>
        </div>

        <!-- Quick Stats -->
        <div class="row g-4 mb-4">
            <div class="col-md-4">
                <div class="quick-stats text-center">
                    <i class="fas fa-clipboard-check stat-icon"></i>
                    <h3>0</h3>
                    <p class="text-muted mb-0">Examens à venir</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="quick-stats text-center">
                    <i class="fas fa-calendar-check stat-icon"></i>
                    <h3>0</h3>
                    <p class="text-muted mb-0">Absences ce semestre</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="quick-stats text-center">
                    <i class="fas fa-graduation-cap stat-icon"></i>
                    <h3>0</h3>
                    <p class="text-muted mb-0">Modules validés</p>
                </div>
            </div>
        </div>

        <!-- Actions rapides -->
        <div class="row g-4 mb-4">
            <div class="col-md-4">
                <a href="${pageContext.request.contextPath}/student/exams"
                   class="btn btn-primary action-btn w-100">
                    <i class="fas fa-file-alt me-2"></i>Mes Examens
                </a>
            </div>
            <div class="col-md-4">
                <a href="${pageContext.request.contextPath}/student/absences"
                   class="btn btn-info action-btn w-100">
                    <i class="fas fa-calendar-alt me-2"></i>Mes Absences
                </a>
            </div>
            <div class="col-md-4">
                <a href="${pageContext.request.contextPath}/student/profile/edit"
                   class="btn btn-secondary action-btn w-100">
                    <i class="fas fa-user-edit me-2"></i>Modifier mon profil
                </a>
            </div>
        </div>

        <!-- Examens à venir -->
        <div class="upcoming-exams">
            <h4 class="mb-4"><i class="fas fa-calendar me-2"></i>Prochains Examens</h4>
            <c:if test="${not empty examens}">
                <c:forEach items="${examens}" var="examen">
                    <div class="exam-item">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h5 class="mb-1">${examen.module}</h5>
                                <p class="mb-0 text-muted">
                                    <i class="fas fa-clock me-2"></i>${examen.date} - Durée: ${examen.duree}min
                                </p>
                            </div>
                            <div>
                                <span class="badge bg-primary">${examen.salle}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty examens}">
                <div class="alert alert-info">
                    <i class="fas fa-info-circle me-2"></i>Aucun examen programmé pour le moment.
                </div>
            </c:if>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>