<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Professeur</title>

    <!-- Forcer l'encodage UTF-8 pour les ressources statiques -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" charset="UTF-8">

    <!-- Le reste du style reste identique, seul le header change -->
<style>
        :root {
            --sidebar-width: 250px;
            --header-height: 70px;
            --primary-blue: #1a237e;     /* Bleu très foncé */
            --secondary-blue: #283593;   /* Bleu foncé secondaire */
            --light-blue: #e8eaf6;       /* Bleu clair pour le fond */
            --hover-blue: #3949ab;       /* Bleu pour les survols */
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            background-color: var(--light-blue);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .wrapper {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: var(--sidebar-width);
            background: var(--primary-blue);
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            left: 0;
            top: 0;
            z-index: 1000;
            padding-top: var(--header-height);
        }

        .main-content {
            flex: 1;
            margin-left: var(--sidebar-width);
            padding: 30px;
            padding-top: calc(var(--header-height) + 30px);
        }

        .fixed-header {
            position: fixed;
            top: 0;
            right: 0;
            left: var(--sidebar-width);
            height: var(--header-height);
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            z-index: 999;
            padding: 0 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .welcome-banner {
            background: linear-gradient(135deg, var(--primary-blue), var(--secondary-blue));
            color: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: var(--primary-blue);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
            font-size: 1.2rem;
        }

        .card-body {
            padding: 25px;
        }

        .info-row {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid var(--light-blue);
            transition: all 0.3s ease;
        }

        .info-row:hover {
            background-color: var(--light-blue);
            transform: translateX(10px);
        }

        .info-icon {
            width: 45px;
            height: 45px;
            background-color: var(--primary-blue);
            color: white;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            transition: transform 0.3s ease;
        }

        .info-row:hover .info-icon {
            transform: rotate(360deg);
            background-color: var(--hover-blue);
        }

        .stat-box {
            background: white;
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            transition: all 0.3s ease;
            height: 100%;
        }

        .stat-box:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .stat-icon {
            font-size: 2.5rem;
            color: var(--primary-blue);
            margin-bottom: 15px;
            transition: transform 0.6s;
        }

        .stat-box:hover .stat-icon {
            transform: rotateY(180deg);
            color: var(--hover-blue);
        }

        .btn-custom {
            background-color: var(--primary-blue);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-custom:hover {
            background-color: var(--hover-blue);
            color: white;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .main-content {
                margin-left: 0;
            }

            .fixed-header {
                left: 0;
            }
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <!-- Menu latéral -->
        <div class="sidebar">
            <jsp:include page="../fragments/usermenu.jsp" />
        </div>

        <div class="main-content">
            <!-- Header fixe avec caractères spéciaux corrigés -->
            <header class="fixed-header">
                <h4 class="mb-0">
                    <i class="fas fa-chalkboard-teacher me-2"></i>
                    Espace Professeur
                </h4>
                <div>
                    <button class="btn btn-custom me-2">
                        <i class="fas fa-bell me-2"></i>
                        Notifications
                    </button>
                    <a href="logout" class="btn btn-custom">
                        <i class="fas fa-sign-out-alt me-2"></i>
                        D&eacute;connexion
                    </a>
                </div>
            </header>

            <!-- Bannière de bienvenue -->
            <div class="welcome-banner">
                <h3>Bienvenue dans votre espace professeur</h3>
                <p class="mb-0">
                    G&eacute;rez vos cours, suivez vos &eacute;tudiants et consultez vos statistiques en un coup d'&#339;il.
                </p>
            </div>

            <!-- Cartes d'information -->
            <div class="row g-4">
                <!-- Première carte -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-user-circle me-2"></i>
                            Informations Personnelles
                        </div>
                        <div class="card-body">
                            <div class="info-row">
                                <div class="info-icon">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <strong>Identifiant :</strong>
                                    <span class="ms-2"><s:authentication property="principal.username" /></span>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-icon">
                                    <i class="fas fa-envelope"></i>
                                </div>
                                <div>
                                    <strong>Adresse Email :</strong>
                                    <span class="ms-2"><s:authentication property="principal.email" /></span>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-icon">
                                    <i class="fas fa-id-card"></i>
                                </div>
                                <div>
                                    <strong>Nom et Pr&eacute;nom :</strong>
                                    <span class="ms-2">
                                        <s:authentication property="principal.firstName" />
                                        <s:authentication property="principal.lastName" />
                                    </span>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-icon">
                                    <i class="fas fa-user-tag"></i>
                                </div>
                                <div>
                                    <strong>R&ocirc;le :</strong>
                                    <span class="ms-2 badge" style="background-color: var(--primary-blue)">
                                        <s:authentication property="principal.authorities" />
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Deuxième carte -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-2"></i>
                            Aper&ccedil;u des Activit&eacute;s
                        </div>
                        <div class="card-body">
                            <div class="row g-4">
                                <div class="col-6">
                                    <div class="stat-box">
                                        <div class="stat-icon">
                                            <i class="fas fa-book-reader"></i>
                                        </div>
                                        <div class="h2 mb-2">0</div>
                                        <div class="text-muted">Cours Actifs</div>
                                        <small class="text-primary mt-2 d-block">Cliquez pour plus de d&eacute;tails</small>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stat-box">
                                        <div class="stat-icon">
                                            <i class="fas fa-users"></i>
                                        </div>
                                        <div class="h2 mb-2">0</div>
                                        <div class="text-muted">&Eacute;tudiants Inscrits</div>
                                        <small class="text-primary mt-2 d-block">Cliquez pour voir la liste</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
