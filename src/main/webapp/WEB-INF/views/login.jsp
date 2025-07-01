<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
    <title>Login</title>
</head>
<body>
    <div class="form-container">
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email"/>
        </div>
        <div class="form-group">
            <label>Mot de passe</label>
            <input type="password" name="mdp"/>
        </div>
        <button type="submit" class="submit-btn">Connexion</button>
</div>

</body>
</html>