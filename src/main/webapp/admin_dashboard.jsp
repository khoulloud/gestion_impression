<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <style>
        /* Styles personnalisés */
        body {
            background-color: #f3f3f3; /* Couleur de fond douce */
            color: #333; /* Couleur du texte principale */
        }
        .navbar {
            background-color: #007bff; /* Fond de la barre de navigation */
        }
        .navbar-brand, .navbar-nav .nav-link, .navbar-text {
            color: #007bff; /* Couleur du texte de la barre de navigation */
        }
        .container {
            background-color: #fff; /* Couleur de fond du conteneur */
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Légère ombre */
        }
        .form-control {
            background-color: #f8f9fa; /* Couleur de fond pour les champs de formulaire */
            color: #333; /* Couleur du texte pour les champs de formulaire */
            border: 1px solid #ced4da; /* Bordure légère */
        }
        .form-group label {
            color: #333; /* Couleur du texte pour les étiquettes */
        }
        .btn-primary, .btn-success, .btn-danger, .btn-secondary, .btn-warning {
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
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">Tableau de bord Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <span class="navbar-text">
                        Bienvenue, ${sessionScope.user.username}
                    </span>
                </li>
                <li class="nav-item">
                    <a href="<%= request.getContextPath() %>/logout" class="btn btn-secondary ml-3">Déconnexion</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <!-- Bloc Créer Utilisateur -->
            <div class="col-md-6">
                <div class="block">
                    <h2>Créer Utilisateur</h2>
                    <form action="manage_users" method="post" class="mb-4">
                        <input type="hidden" name="action" value="create">
                        <div class="form-group">
                            <label for="username">Nom d'utilisateur :</label>
                            <input type="text" id="username" name="username" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mot de passe :</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="role">Rôle :</label>
                            <select id="role" name="role" class="form-control">
                                <option value="teacher">Enseignant</option>
                                <option value="agent">Agent</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Créer Utilisateur</button>
                    </form>
                </div>
            </div>

            <!-- Bloc Activer/Désactiver Utilisateur -->
            <div class="col-md-6">
                <div class="block">
                    <h2>Activer/Désactiver Utilisateur</h2>
                    <form action="manage_users" method="post" class="mb-3">
                        <input type="hidden" name="action" value="activate">
                        <div class="form-group">
                            <label for="user_id">ID Utilisateur :</label>
                            <input type="number" id="user_id" name="user_id" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-success">Activer Utilisateur</button>
                    </form>
                    <form action="manage_users" method="post" class="mb-3">
                        <input type="hidden" name="action" value="deactivate">
                        <div class="form-group">
                            <label for="user_id2">ID Utilisateur :</label>
                            <input type="number" id="user_id2" name="user_id2" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-danger">Désactiver Utilisateur</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
