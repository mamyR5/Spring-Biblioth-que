<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bibliotheque.models.TypeUtilisateur" %>
<%@ page import="com.bibliotheque.models.TypeAdherent" %>
<%
  List<TypeUtilisateur> typesUtilisateurs = (List<TypeUtilisateur>) request.getAttribute("typesUtilisateurs");
  List<TypeAdherent> typesAdherents = (List<TypeAdherent>) request.getAttribute("typesAdherents");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Inscription</title>
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/inscription.css">
    <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css">
</head>
<body>
    <div class="container">
        <div id="card" class="box">
            <h1>BiblioTech</h1>
            <p>
                Créez un compte pour accéder à toutes les fonctionnalités de la bibliothèque en ligne.
            </p>
            <p>
                Consultez, réservez, empruntez… le tout en quelques clics via votre espace personnel.
            </p>
        </div>
        <div id="form" class="box">
            <h1>Inscription</h1>
            <form action="<%= request.getContextPath() %>/user/insert" method="post" id="monFormulaire">
                <div class="form-group">
                    <label for="nom">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/icon-park-solid--edit-name.svg">
                        Nom
                    </label>
                    <input type="text" id="nom" name="Nom" required>
                </div>

                <div class="form-group">
                    <label for="email">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/line-md--email-plus-filled.svg">
                        Email
                    </label>
                    <input type="email" id="email" name="Email" required>
                </div>

                 <div class="form-group">
                    <label for="Telephone">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/bi--telephone-fill.svg">
                        Téléphone
                    </label>
                    <input type="text" id="Telephone" name="Telephone" required>
                </div>

                <div class="form-group">
                    <label for="Adresse">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/line-md--email-plus-filled.svg">
                        Adresse
                    </label>
                    <input type="text" id="Adresse" name="Adresse" required>
                </div>

                <div class="custom-select" data-target="custom-select-adherent" data-trigger-value="1">
                    <label for="role">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/carbon--user-role.svg">
                        Choissisez votre type d'utilisateur
                    </label>

                    <div class="select-selected">
                        <span class="selected-text">Sélectionnez</span>
                        <img src="<%= request.getContextPath()%>/icons/raphael--arrowdown.svg" class="arrow-icon">
                    </div>
                    <ul class="select-options">
                      <% if(typesUtilisateurs !=null) {%>
                        <% for(TypeUtilisateur type : typesUtilisateurs) {%>
                          <li data-value="<%= type.getIdTypeUtilisateur() %>"><%= type.getNom() %></li>
                        <% } %>
                      <% } else{%>
                        Null ilay idTypeUtilisateur
                      <% } %>
                    </ul>
                    <!-- Pour afficher la valeur sélectionnée -->
                    <input type="hidden" id="select-user" name="idTypeUtilisateur">
                </div>



                  <div class="custom-select" id="custom-select-adherent" style="display: none;">
                    <label for="role">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/carbon--user-role.svg">
                        Choissisez votre type d'adhérent
                    </label>

                    <div class="select-selected">
                        <span class="selected-text">Sélectionnez</span>
                        <img src="<%= request.getContextPath()%>/icons/raphael--arrowdown.svg" class="arrow-icon">
                    </div>
                    <ul class="select-options">
                    <% if(typesAdherents!= null) {%>
                        <% for(TypeAdherent type : typesAdherents) {%>
                          <li data-value="<%= type.getIdTypeAdherent() %>"><%= type.getNom() %></li>
                        <% } %>
                      <% } else {%>
                        Null ilay idTypeAdherent
                      <% }%>
                    </ul>
                      <input type="hidden" id="select-adherent" name="idTypeAdherent">
                  </div>


                <!-- Pour afficher la valeur sélectionnée -->



                <div class="form-group">
                        <input type="hidden" id="eye-closed"
                            value="<%= request.getContextPath() %>/icons/ooui--eye-closed.svg">
                        <input type="hidden" id="eye-opened"
                            value="<%= request.getContextPath() %>/icons/el--eye-open.svg">
                        <label for="password" class="email">
                            <img class="icon"
                                src="<%= request.getContextPath() %>/icons/qlementine-icons--password-16.svg">
                            Mot de passe
                        </label>
                        <div class="input-icon">
                            <input type="password" class="email" id="password"
                                required>
                            <span class="toggle-password"
                                onclick="togglePassword(this)">
                                <img id="toggleIcon"
                                    src="<%= request.getContextPath() %>/icons/ooui--eye-closed.svg"
                                    alt="Afficher le mot de passe">
                            </span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="email">
                            <img class="icon"
                                src="<%= request.getContextPath() %>/icons/qlementine-icons--password-16.svg">
                            Confirmer le mot de passe
                        </label>
                        <div class="input-icon">
                            <input type="password" class="email" id="password"
                                required>
                            <span class="toggle-password"
                                onclick="togglePassword(this)">
                                <img id="toggleIcon"
                                    src="<%= request.getContextPath() %>/icons/ooui--eye-closed.svg"
                                    alt="Afficher le mot de passe">
                            </span>
                        </div>
                    </div>

                <div class="erreur" id="erreurMotDePasse">
                </div>

                <div class="form-group">
                    <label for="password">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/cil--birthday-cake.svg">
                        Date de naissance
                    </label>
                    <input type="date" id="dateNaissance" name="DateNaissance" required>
                </div>

                <div id="inscription">
                    <a href="<%= request.getContextPath()%>/" id="lien-inscription">Déjà inscrit ? Se connecter</a>
                </div>

                <div class="button">
                    <input type="submit" onclick="verifierMotDePasse()" value="S'inscrire">
                </div>
            </form>
        </div>
    </div>
<script>

 function togglePassword(toggleElement) {
    const passwordInput = toggleElement.previousElementSibling;
    const toggleIcon = toggleElement.querySelector("img");
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

  document.addEventListener("DOMContentLoaded", () => {
    const userInput = document.getElementById("select-user");
    const adherentSelect = document.getElementById("custom-select-adherent");
    const adherentInput = document.getElementById("select-adherent");

    function toggleAdherentSelect() {
      if (userInput.value === "1") {
        adherentSelect.style.display = "block";
      } else {
        adherentSelect.style.display = "none";
        adherentInput.value = ""; // reset
      }
    }

    // écoute les changements (depuis le script de sélection personnalisé)
    userInput.addEventListener("change", toggleAdherentSelect);

    // déclenche au chargement si déjà sélectionné
    toggleAdherentSelect();
  });


  /*function verifierMotDePasse() {
    const motDePasse = document.getElementById("password");
    const confirmeMotDePasse = document.getElementById("confirm-password");
    const message = document.getElementById("erreurMotDePasse");

    if (motDePasse.value !== confirmeMotDePasse.value) {
      message.innerText = "Votre mot de passe n'est pas identique.";
    } else {
      message.innerText = ""; // efface le message si OK
    }
  }*/
 document.addEventListener("DOMContentLoaded", () => {
  const motDePasse = document.getElementById("password");
  const confirmeMotDePasse = document.getElementById("confirm-password");
  const message = document.getElementById("erreurMotDePasse");
  const formulaire = document.getElementById("monFormulaire");

  function verifierMotDePasse() {
    if (motDePasse.value !== confirmeMotDePasse.value) {
      message.innerText = "Votre mot de passe n'est pas identique.";
      return false;
    } else {
      message.innerText = "";
      return true;
    }
  }

  // Bloque la soumission si les mots de passe ne correspondent pas
  formulaire.addEventListener("submit", (event) => {
    if (!verifierMotDePasse()) {
      event.preventDefault(); // empêche l'envoi du formulaire
    }
  });

  // On peut aussi afficher le message dès la saisie
  motDePasse.addEventListener("input", verifierMotDePasse);
  confirmeMotDePasse.addEventListener("input", verifierMotDePasse);
});

document.addEventListener("DOMContentLoaded", () => {
  // Gestion des custom selects
  document.querySelectorAll(".custom-select").forEach(select => {
    const selected = select.querySelector(".select-selected");
    const options = select.querySelector(".select-options");
    const arrow = select.querySelector(".arrow-icon");
    const text = select.querySelector(".selected-text");
    const hiddenInput = select.querySelector("input[type=hidden]");

    selected.addEventListener("click", () => {
      const isOpen = options.style.display === "block";
      options.style.display = isOpen ? "none" : "block";
      if (arrow) arrow.style.transform = isOpen ? "rotate(0deg)" : "rotate(180deg)";
    });

    options.querySelectorAll("li").forEach(option => {
      option.addEventListener("click", () => {
        const value = option.getAttribute("data-value");
        text.textContent = option.textContent;
        if (hiddenInput) {
          hiddenInput.value = value;
          hiddenInput.dispatchEvent(new Event("change")); // 🔥 déclenche manuellement l’événement
        }
        options.style.display = "none";
        if (arrow) arrow.style.transform = "rotate(0deg)";
      });
    });

    // Ferme si on clique en dehors
    document.addEventListener("click", (e) => {
      if (!select.contains(e.target)) {
        options.style.display = "none";
        if (arrow) arrow.style.transform = "rotate(0deg)";
      }
    });
  });

  // Partie logique : afficher le select d’adhérent si le user sélectionné est 1
  const selectUserInput = document.getElementById("select-user");
  const adherentDiv = document.getElementById("custom-select-adherent");
  const adherentInput = document.getElementById("select-adherent");

  // Au chargement de la page
  if (selectUserInput && adherentDiv) {
    toggleAdherentDiv(selectUserInput.value);
  }

  // Lors du changement
  if (selectUserInput) {
    selectUserInput.addEventListener("change", () => {
      toggleAdherentDiv(selectUserInput.value);
    });
  }

  function toggleAdherentDiv(value) {
    if (value === "1") {
      adherentDiv.style.display = "block";
    } else {
      adherentDiv.style.display = "none";
      if (adherentInput) adherentInput.value = "";
    }
  }
});
</script>

</script>
</body>
</html>
