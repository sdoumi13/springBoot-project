<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>

    <!-- Google Fonts for Icons -->
    <link
        rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />

    <style>
        /* Styles du conteneur principal */
        .main-container {
            margin-left: 260px; /* Espace pour le sidebar */
            padding: 20px;
            transition: margin-left 0.4s;
        }

        /* Styles des cartes de statistiques */
        .stats-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .stat-card {
            background: linear-gradient(135deg, #1c1f2b, #3a3f5e);
            color: #fff;
            padding: 20px;
            border-radius: 8px;
            width: 23%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-card span {
            font-size: 40px;
        }

        .stat-card h3 {
            margin: 0;
            font-size: 22px;
        }

        .stat-card p {
            margin: 0;
            font-size: 14px;
            opacity: 0.8;
        }

        /* Styles pour les graphiques */
        .chart-container {
            margin-top: 30px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .chart-box {
            flex: 1;
            min-width: 400px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
        }

        canvas {
            width: 100% !important;
            max-height: 300px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .stat-card {
                width: 48%; /* Cards will take up less space on smaller screens */
            }

            .chart-box {
                min-width: 300px;
            }
        }

        @media (max-width: 480px) {
            .stat-card {
                width: 100%; /* Cards will take full width on very small screens */
            }
        }
    </style>
</head>
<body>

    <!-- Inclusion du menu latéral et navbar -->
    <jsp:include page="../fragments/menu.jsp" />

    <!-- Contenu principal -->
    <div class="main-container">
        <h1>Admin Dashboard</h1>

        <!-- Cartes de statistiques -->
        <div class="stats-cards">
            <div class="stat-card">
                <div>
                    <h3>22</h3>
                    <p>Utilisateurs inscrits</p>
                </div>
                <span class="material-symbols-outlined"> group </span>
            </div>

            <div class="stat-card">
                <div>
                    <h3>45</h3>
                    <p>Examens programmés</p>
                </div>
                <span class="material-symbols-outlined"> event </span>
            </div>

            <div class="stat-card">
                <div>
                    <h3>6</h3>
                    <p>Professeurs enregistrés</p>
                </div>
                <span class="material-symbols-outlined"> school </span>
            </div>

            <div class="stat-card">
                <div>
                    <h3>3</h3>
                    <p>Groupes actifs</p>
                </div>
                <span class="material-symbols-outlined"> groups </span>
            </div>
        </div>

        <!-- Conteneur des graphiques -->
        <div class="chart-container">
            <div class="chart-box">
                <h3>Évolution des Utilisateurs</h3>
                <canvas id="lineChart"></canvas>
            </div>
            <div class="chart-box">
                <h3>Répartition des Utilisateurs</h3>
                <canvas id="doughnutChart"></canvas>
            </div>
        </div>
    </div>

    <!-- Importation de Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        // Graphique en ligne (Évolution des utilisateurs)
        const lineCtx = document.getElementById('lineChart').getContext('2d');
        const lineChart = new Chart(lineCtx, {
            type: 'line',
            data: {
                labels: ['Sept', 'Oct', 'Nov', 'Déc', 'Jan', 'Fév'],
                datasets: [{
                    label: 'Nouveaux Utilisateurs',
                    data: [11, 1, 0, 6, 4, 0],
                    borderColor: '#3a3f5e',
                    backgroundColor: 'rgba(58, 63, 94, 0.2)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                },
                scales: {
                    y: { beginAtZero: true }
                },
                animation: {
                    duration: 2000,
                    easing: 'easeInOutBounce'
                }
            }
        });

        // Graphique en Doughnut (Répartition des utilisateurs)
        const doughnutCtx = document.getElementById('doughnutChart').getContext('2d');
        const doughnutChart = new Chart(doughnutCtx, {
            type: 'doughnut',
            data: {
                labels: ['Étudiants', 'Professeurs', 'Admins'],
                datasets: [{
                    data: [14, 6, 2],
                    backgroundColor: ['#6c5ce7', '#fd79a8', '#00cec9']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'bottom' }
                },
                animation: {
                    animateRotate: true,
                    animateScale: true
                }
            }
        });
    </script>

</body>
</html>
