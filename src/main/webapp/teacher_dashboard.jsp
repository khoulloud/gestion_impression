<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord Enseignant</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS et dépendances -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <style>
        /* Styles personnalisés */
        body {
            background-color: #f3f3f3; /* Couleur de fond douce */
            color: #333; /* Couleur du texte principale */
        }
        .container {
            background-color: #fff; /* Couleur de fond du conteneur */
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Légère ombre */
        }
        .form-group label {
            color: #333; /* Couleur du texte pour les étiquettes */
        }
        .btn-primary, .btn-secondary {
            color: #fff; /* Couleur du texte pour les boutons */
        }
        .block {
            background-color: #f8f9fa; /* Couleur de fond pour les blocs */
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand text-white" href="#">Tableau de bord Enseignant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <span class="nav-link text-white">Bienvenue, ${sessionScope.user.username} <span class="sr-only">(current)</span></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-secondary text-white" href="<%= request.getContextPath() %>/logout">Déconnexion</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Contenu -->
    <div class="container mt-5">
        <div class="block">
            
                <c:forEach var="subject" items="${requestScope.subjects}">
                    <li class="list-group-item">${subject.name}</li>
                </c:forEach>
            </ul>
            <h2>Demander une Impression</h2>
            <form action="request_print" method="post" enctype="multipart/form-data" class="mb-4">
                <div class="form-group">
                    <label for="subject_id">Matière :</label>
                    <select id="subject_id" name="subject_id" class="form-control">
                        <!-- Matières statiques -->
                        <option value="1">Mathématiques</option>
                        <option value="2">Sciences</option>
                        <option value="3">Histoire</option>
                        <option value="4">Littérature</option>
                        <!-- Matières dynamiques -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="pdf_document">Document PDF :</label>
                    <input type="file" id="pdf_document" name="pdf_document" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="print_date">Date d'Impression :</label>
                    <input type="datetime-local" id="print_date" name="print_date" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="num_copies">Nombre de Copies :</label>
                    <input type="number" id="num_copies" name="num_copies" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-warning">Demander Impression</button>
            </form>
        </div>
    </div>
</body>
</html>
