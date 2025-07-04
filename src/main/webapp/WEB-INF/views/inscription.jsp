<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bibliotheque.models.TypeUtilisateur" %>
<%
  List<TypeUtilisateur> typesUtilisateurs = (List<TypeUtlisateur>) request.getAttribute("typesUtilisateurs");
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
            <form action="<%= request.getContextPath() %>/user/insert" method="post">
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

                <div class="custom-select">

                    <label for="role">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/carbon--user-role.svg">
                        Choissisez votre type d'utilisateur
                    </label>

                    <div class="select-selected">
                        <span class="selected-text">Sélectionnez</span>
                        <img src="<%= request.getContextPath()%>/icons/raphael--arrowdown.svg" class="arrow-icon">
                    </div>
                    <ul class="select-options">
                        <% for(TypeUtilisateur type : typesUtilisateurs) {%>
                          <li data-value="<%= type.getIdTypeUtilisateur() %>"><%= type.getNom() %></li>
                        <% } %>
                    </ul>
                </div>

                <!-- Pour afficher la valeur sélectionnée -->
                <input type="hidden" id="select-value" name="user">

                <!-- Conteneur où on affichera le select -->
                <div id="type-adherent-container">

                </div>



                <div class="form-group">
                    <label for="password">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/qlementine-icons--password-16.svg">
                        Mot de passe
                    </label>
                    <input type="password" id="password" name="MotDePasse" required>
                </div>

                

                <div class="form-group">
                    <label for="confirm-password">
                        <img class="icon" src="<%= request.getContextPath()%>/icons/qlementine-icons--password-16.svg">
                        Confirmer le mot de passe
                    </label>
                    <input type="password" id="confirm-password" name="confirm-password" required>
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

document.addEventListener("DOMContentLoaded", () => {
  const hiddenInput = document.getElementById("select-value");
    console.log("Valeur hiddenInput:", hiddenInput?.value);

  if (hiddenInput && hiddenInput.value.trim() === "1") {
    fetch("/api/type-adherents")
      .then(response => {
        if (!response.ok) throw new Error("Erreur réseau");
        return response.json();
      })
      .then(data => {
        afficherSelect(data);
      })
      .catch(error => {
        console.error("Erreur lors de la récupération :", error);
      });
  }
});

function afficherSelect(types) {
  const container = document.getElementById("type-adherent-container");

    const hiddenInput = document.createElement("input");
    hiddenInput.type = "hidden";
    hiddenInput.name = "typeAdherent"; // le nom du champ à envoyer
    container.appendChild(hiddenInput);

  // Crée le conteneur du custom select
  const customSelect = document.createElement("div");
  customSelect.classList.add("custom-select");

  // Élément affiché (select-selected)
  const selected = document.createElement("div");
  selected.classList.add("select-selected");
  selected.textContent = "-- Sélectionnez un type --";
  customSelect.appendChild(selected);

  // Conteneur options
  const optionsContainer = document.createElement("ul");
  optionsContainer.classList.add("select-options");
  optionsContainer.style.display = "none"; // caché par défaut

  // Ajout options en <li>
  types.forEach(type => {
    const li = document.createElement("li");
    li.setAttribute("data-value", type.id);
    li.textContent = type.nom;
    optionsContainer.appendChild(li);

    li.addEventListener("click", () => {
    selected.textContent = li.textContent;
    optionsContainer.style.display = "none";
      // Mettre à jour la valeur dans un input caché si besoin
    hiddenInput.value = li.getAttribute("data-value");  // <-- met à jour la valeur ici
    });
  });

  customSelect.appendChild(optionsContainer);
  container.appendChild(customSelect);

  // Toggle affichage options au clic sur selected
  selected.addEventListener("click", () => {
    optionsContainer.style.display = optionsContainer.style.display === "block" ? "none" : "block";
  });
}



  function verifierMotDePasse() {
    const motDePasse = document.getElementById("password");
    const confirmeMotDePasse = document.getElementById("confirm-password");
    const message = document.getElementById("erreurMotDePasse");

    if (motDePasse.value !== confirmeMotDePasse.value) {
      message.innerText = "Votre mot de passe n'est pas identique.";
    } else {
      message.innerText = ""; // efface le message si OK
    }
  }

  document.querySelectorAll(".custom-select").forEach(select => {
  const selected = select.querySelector(".select-selected");
  const options = select.querySelector(".select-options");
  const arrow = select.querySelector(".arrow-icon");
  const text = select.querySelector(".selected-text");
  const hiddenInput = select.querySelector("#select-value"); // mieux que document.getElementById

  selected.addEventListener("click", () => {
    const isOpen = options.style.display === "block";
    options.style.display = isOpen ? "none" : "block";
    arrow.style.transform = isOpen ? "rotate(0deg)" : "rotate(180deg)";
  });

  options.querySelectorAll("li").forEach(option => {
    option.addEventListener("click", () => {
      const value = option.getAttribute("data-value");
      text.textContent = option.textContent;
      if(hiddenInput) hiddenInput.value = value;
      options.style.display = "none";
      arrow.style.transform = "rotate(0deg)";
    });
  });

  // Ferme si on clique en dehors
  document.addEventListener("click", (e) => {
    if (!select.contains(e.target)) {
      options.style.display = "none";
      arrow.style.transform = "rotate(0deg)";
    }
  });
});


</script>
</body>
</html>
