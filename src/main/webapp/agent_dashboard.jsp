<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord de l'Agent</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Styles personnalisés */
        body {
            background-color: #f8f9fa; /* Couleur de fond légèrement blanche */
            color: #000; /* Couleur du texte noir */
        }
        .navbar {
            background-color: #007bff; /* Bleu pour la barre de navigation */
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: #fff; /* Texte blanc pour les éléments de la barre de navigation */
        }
        .navbar-text {
            color: #fff; /* Texte blanc pour le texte du navbar */
            font-weight: bold; /* Texte en gras */
        }
        .container {
            background: #fff; /* Arrière-plan blanc pour le conteneur */
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Ombre légère */
        }
        .table {
            background-color: #E9ECEF; /* Arrière-plan gris clair pour la table */
        }
        .thead-dark th {
            background-color: #007BFF; /* Bleu plus foncé pour les en-têtes de table */
            color: #fff; /* Texte blanc pour les en-têtes de table */
        }
        .btn-primary, .btn-success, .btn-danger {
            color: #fff; /* Texte blanc pour les boutons */
        }
    </style>
</head>
<body>
    <!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg">
    <span class="navbar-text">Tableau de bord de l'agent</span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="navbar-brand" href="#">Bienvenue, ${sessionScope.user.username}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-secondary text-white" href="<%= request.getContextPath() %>/logout">Déconnexion</a>
            </li>
        </ul>
    </div>
</nav>


    <div class="container">
        
        <h2>Tâches pour aujourd'hui</h2>
        <table class="table table-striped">
            <thead class="thead-light">
                <tr>
                    <th>Enseignant</th>
                    <th>Matière</th>
                    <th>Document PDF</th>
                    <th>Date d'impression</th>
                    <th>Nombre de copies</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="task" items="${requestScope.tasks}">
                    <tr>
                        <td>${task.teacherUsername}</td>
                        <td>${task.subjectName}</td>
                        <td><a href="${task.pdfDocument}" class="btn btn-warning">Voir le document</a></td>
                        <td>${task.printDate}</td>
                        <td>${task.numCopies}</td>
                        <td><button type="button" class="btn btn-success" onclick="markAsCompleted(${task.id})">Marquer comme terminé</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JS (optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function markAsCompleted(taskId) {
            // Code pour marquer la tâche comme terminée
        }
    </script>
</body>
</html>
