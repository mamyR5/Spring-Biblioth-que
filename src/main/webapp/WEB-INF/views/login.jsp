<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="container">
      <div id="card" class="box">
        <h1>BiblioTech</h1>
        <p>
            Une gestion de bibliothèque en ligne. Entrez les details de votre identité.
        </p>
        <p>
            Grâce à une interface intuitive, les utilisateurs peuvent faire beaucoup 
            de chose en quelques clics.
        </p>
      </div>
      <div id="form" class="box">
        <h1>Login</h1>
        <form action="" method="get">
            <div class="form-group">
                <label for="email" class="email">
                    <img class="icon" src="<%= request.getContextPath() %>/icons/line-md--email-plus-filled.svg">
                    Email
                </label>
                <input type="email" class="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="email" class="email">
                    <img class="icon" src="<%= request.getContextPath() %>/icons/qlementine-icons--password-16.svg">
                    Mot de passe
                </label>
                <input type="password" class="password" id="password" required>
            </div>

            <div id="inscription">
                <a href="<%= request.getContextPath()%>/user/inscription" id="lien-inscription">Pas encore inscrit?</a>
            </div>
        
            <div class="button">
                <input type="submit" value="Se connecter">
            </div>
        </form>
      </div>
    </div>
</body>
</html>