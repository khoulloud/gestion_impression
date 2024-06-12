<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Styles personnalisés */
        body {
            background-color: #f8f9fa; /* Couleur de fond légèrement blanche */
            color: #000; /* Couleur du texte noir */
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.7); /* Arrière-plan semi-transparent pour le formulaire */
            padding: 20px;
            border-radius: 10px;
        }
        .image-container {
            background-color: #333; /* Couleur de fond sombre pour le conteneur d'image */
            border-radius: 10px;
        }
        .image-container img {
            width: 100%; /* Assurez-vous que l'image remplit complètement son conteneur */
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Colonne de gauche avec l'image -->
            <div class="col-md-6">
                <div class="image-container">
                    <!-- Insérez ici le chemin de votre image -->
                    <img src="https://static.vecteezy.com/ti/vecteur-libre/p3/9249344-illustration-de-l-atelier-d-impression-avec-processus-de-production-dans-l-imprimerie-et-les-machines-pour-exploiter-les-imprimantes-de-gros-fichiers-dans-un-dessin-anime-de-style-plat-vectoriel.jpg" alt="Image">
                </div>
            </div>
            <!-- Colonne de droite avec le formulaire -->
            <div class="col-md-6 align-self-center">
                <div class="form-container">
                    <h1 class="mb-4 text-center">Connexion</h1>
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="username">Nom d'utilisateur :</label>
                            <input type="text" id="username" name="username" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mot de passe :</label>
                            <input type="password" id="password" name="password" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Connexion</button>
                    </form>
                    <c:if test="${param.error != null}">
                        
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
