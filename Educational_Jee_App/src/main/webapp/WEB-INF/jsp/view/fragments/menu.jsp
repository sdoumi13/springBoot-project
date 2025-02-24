<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Google Font pour les icônes -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
    <aside class="sidebar">
        <div class="sidebar-header">
            <img src="${pageContext.request.contextPath}/resources/img/UAE.png" alt="logo" />
            <h2>Exam App</h2>
        </div>

        <ul class="sidebar-links">
            <h4><span>Menu</span><div class="menu-separator"></div></h4>

            <li><a href="${pageContext.request.contextPath}/admin/showAdminHome">
                <span class="material-symbols-outlined"> dashboard </span>Home</a></li>

            <li>
                <a href="#" onclick="toggleSubMenu('person-management')">
                    <span class="material-symbols-outlined"> overview </span>Person Management</a>
                <ul id="person-management" class="sub-menu hidden">
                    <li><a href="${pageContext.request.contextPath}/admin/showForm?typePerson=2">Add Student</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/showForm?typePerson=1">Add Prof</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/showForm?typePerson=3">Add Cadre Admin</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/managePersons">Manage Persons</a></li>
                </ul>
            </li>

            <li>
                <a href="#" onclick="toggleSubMenu('account-management')">
                    <span class="material-symbols-outlined"> monitoring </span>Account Management</a>
                <ul id="account-management" class="sub-menu hidden">
                    <li><a href="${pageContext.request.contextPath}/admin/createAccounts">Create Accounts</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manageAccounts">List Accounts</a></li>
                </ul>
            </li>

            <h4><span>Services</span><div class="menu-separator"></div></h4>

            <li>
                <a href="#" onclick="toggleSubMenu('pedagogic-elements-management')">
                    <span class="material-symbols-outlined"> folder </span>Pedagogic Elements</a>
                <ul id="pedagogic-elements-management" class="sub-menu hidden">
                    <li><a href="${pageContext.request.contextPath}/admin/showFormm">Add/Update/Delete Element Pedagogic</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/manageElements">List Elements Pedagogic</a></li>
                </ul>
            </li>

            <li>
                <a href="#" onclick="toggleSubMenu('exam-management')">
                    <span class="material-symbols-outlined"> event_note </span>Exam Management</a>
                <ul id="exam-management" class="sub-menu hidden">
                    <li><a href="${pageContext.request.contextPath}/admin/Examen/showForm">Create Examen</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/Examen/manageExamens">List Examens</a></li>
                </ul>
            </li>

            <li>
                <a href="#" onclick="toggleSubMenu('export-data')">
                    <span class="material-symbols-outlined"> notifications_active </span>Export Data</a>
                <ul id="export-data" class="sub-menu hidden">
                    <li><a href="${pageContext.request.contextPath}/admin/exportAccounts">Export Accounts</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/exportPersons">Export Persons</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/exportElements">Export Elements Pedagogic</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/exportGroupe">Export Groups</a></li>
                </ul>
            </li>

            <h4><span>Account</span><div class="menu-separator"></div></h4>

            <li><a href="${pageContext.request.contextPath}/profile">
                <span class="material-symbols-outlined"> account_circle </span>Profile</a></li>

            <li>
                <f:form action="${pageContext.request.contextPath}/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <button type="submit" class="logout-btn">
                        <span class="material-symbols-outlined"> logout </span>Logout
                    </button>
                </f:form>
            </li>
        </ul>
    </aside>

    <script>
        function toggleSubMenu(id) {
            const subMenu = document.getElementById(id);
            subMenu.classList.toggle("hidden");
        }
        // Ouvrir/fermer la sidebar avec une animation
        document.addEventListener("DOMContentLoaded", function () {
            const sidebar = document.querySelector(".sidebar");
            sidebar.classList.add("show");
        });

        // Fonction pour animer les sous-menus
        function toggleSubMenu(id) {
            const subMenu = document.getElementById(id);
            if (subMenu.classList.contains("show")) {
                subMenu.style.maxHeight = "0";
                subMenu.style.opacity = "0";
                setTimeout(() => subMenu.classList.remove("show"), 300);
            } else {
                subMenu.classList.add("show");
                subMenu.style.maxHeight = subMenu.scrollHeight + "px";
                subMenu.style.opacity = "1";
            }
           }
    </script>
</body>
</html>
