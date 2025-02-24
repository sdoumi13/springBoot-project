<!-- usermenu.jsp -->
<div class="sidebar-menu">
    <div class="user-profile p-3 text-center">
        <div class="mb-3">
            <i class="fas fa-user-circle fa-3x text-white"></i>
        </div>
        <h6 class="text-white mb-2">
            <s:authentication property="principal.firstName" />
            <s:authentication property="principal.lastName" />
        </h6>
    </div>

    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/prof/home">
                <i class="fas fa-home me-2"></i>
                Tableau de bord
            </a>
        </li>

        <!-- Menu Examens -->
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/prof/listeExamens.jsp">
                <i class="fas fa-file-alt me-2"></i>
                Mes Examens
            </a>
        </li>

        <!-- Menu Éléments Pédagogiques -->
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/prof/listElements.jsp">
                <i class="fas fa-book me-2"></i>
                Éléments Pédagogiques
            </a>
        </li>

        <!-- Autres options -->
        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/prof/planning">
                <i class="fas fa-calendar-alt me-2"></i>
                Planning
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link text-white" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-sign-out-alt me-2"></i>
                Déconnexion
            </a>
        </li>
    </ul>
</div>

<!-- Style pour le menu -->
<style>
    .sidebar-menu {
        height: 100%;
        background-color: var(--primary-blue);
    }

    .nav-link {
        padding: 12px 20px;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        background-color: var(--hover-blue);
        padding-left: 25px;
    }

    .nav-link.active {
        background-color: var(--hover-blue);
        border-left: 4px solid white;
    }
</style>