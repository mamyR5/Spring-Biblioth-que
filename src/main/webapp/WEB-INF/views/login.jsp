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
        <form action="<%=request.getContextPath() %>/user/login" method="post">
            <div class="form-group">
                <label for="email" class="email">
                    <img class="icon" src="<%= request.getContextPath() %>/icons/line-md--email-plus-filled.svg">
                    Email
                </label>
                <input type="email" class="email" name="Email" id="email" required>
            </div>

            <div class="form-group">
                <label for="password" class="email">
                    <img class="icon" src="<%=request.getContextPath() %>/icons/qlementine-icons--password-16.svg">
                    Mot de passe
                </label>
                <div class="input-icon">
                    <input type="password" class="email" id="password" name="MotDePasse" required>
                    <span class="toggle-password" onclick="togglePassword()">
                        <img id="toggleIcon" src="<%=request.getContextPath() %>/icons/ooui--eye-closed.svg" alt="Afficher le mot de passe">
                    </span>
                </div>
                <input type="hidden" id="eye-closed" value="<%=request.getContextPath() %>/icons/ooui--eye-closed.svg">
                <input type="hidden" id="eye-opened" value="<%=request.getContextPath() %>/icons/el--eye-open.svg">
            </div>

            <div id="inscription">
                <a href="<%= request.getContextPath()%>/user/inscription" id="lien-inscription">Pas encore inscrit?</a>
            </div>

            
            <div class="erreur" id="erreurMotDePasse">
                <% if(session.getAttribute("messageErreur")!=null) {%>
                    <%= session.getAttribute("messageErreur") %>
                <% }%>
            </div>
        
            <div class="button">
                <input type="submit" value="Se connecter">
            </div>
        </form>
      </div>
    </div>
<script>
  function togglePassword() {
    const passwordInput = document.getElementById("password");
    const toggleIcon = document.getElementById("toggleIcon");
    const pathIconClosed = document.getElementById("eye-closed");
    const pathIconOpened = document.getElementById("eye-opened");


    if (passwordInput.type === "password") {
      passwordInput.type = "text";
      toggleIcon.src = pathIconClosed.value;
      toggleIcon.alt = "Cacher le mot de passe";
    } else {
        passwordInput.type = "password";
        toggleIcon.src = pathIconOpened.value;
        toggleIcon.alt = "Afficher le mot de passe";
    }
  }
</script>
</body>
</html>