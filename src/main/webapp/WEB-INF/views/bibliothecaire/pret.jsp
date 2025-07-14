<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="com.bibliotheque.models.Livre" %>
<%@ page import="com.bibliotheque.models.Exemplaire" %>
<%@ page import="com.bibliotheque.models.TypePret" %>
<%@ page import="com.bibliotheque.models.Restriction" %>
<%@ page import="com.bibliotheque.models.Adherent"%>
<%
  
  List<TypePret> types = (List<TypePret>) request.getAttribute("types");
  Exemplaire exemplaire = (Exemplaire) request.getAttribute("exemplaire");
  List<Adherent> adherents = (List<Adherent>) request.getAttribute("adherents");
  Livre livre = (Livre) request.getAttribute("livre");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/css/pret.css">
    </head>
    <body>

        <div class="container">


            <div class="modal-content">
                <h1>Formulaire de prêt</h1>

                <form action method="post" class="form">
                    
                   

                    <div class="form-group">
                        <label for id="text"><b>Exemplaire N°<%=exemplaire.getNumeroExemplaire() %></b> pour le livre
                            <b>"<%= livre.getTitre() %>"</b> </label>
                        <label for id="text">Age minimal requis : <%=livre.getRestriction().getAge() %><b>
                                ans</b></label>
                    </div>

                    <div class="form-group">

                        <div class="custom-select">
                            <input type="hidden" id="select-value"
                                name="id_adherent">
                            <label for="idAdherent">
                                L'adhérent
                            </label>
                            <div class="select-selected">
                                <span
                                    class="selected-text">Sélectionnez</span>
                                <img
                                    src="<%= request.getContextPath() %>/icons/raphael--arrowdown.svg"
                                    class="arrow-icon">
                            </div>
                            <ul class="select-options">
                                <% for (Adherent adherent : adherents) {%>
                                  <li data-value="<%= adherent.getIdAdherent() %>"><%=adherent.getUtilisateur().getNom() %></li>
                                <% }%>
                            </ul>

                        </div>
                    </div>


                    <div class="form-group">

                        <div class="custom-select">
                            <input type="hidden" id="select-value"
                                name="id_type_pret">
                            <label for="TypePret">
                                Choissisez votre type de prêt
                            </label>
                            <div class="select-selected">
                                <span
                                    class="selected-text">Sélectionnez</span>
                                <img
                                    src="<%= request.getContextPath() %>/icons/raphael--arrowdown.svg"
                                    class="arrow-icon">
                            </div>
                            <ul class="select-options">
                                <% for (TypePret type : types) {%>
                                  <li data-value="<%= type.getIdTypePret() %>"><%=type.getNom() %></li>
                                <% }%>
                            </ul>

                        </div>
                    </div>

                    <div class="form-group" id="date_retour"
                        style="display: none;">
                        <label for>Date de retour</label>
                        <input type="date">
                    </div>

                    <div class="button">
                        <input type="submit" value="Valider">
                    </div>

                </form>
            </div>
        </div>
<script>
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
  });


  // Ferme si on clique en dehors
  document.addEventListener("click", (e) => {
    if (!select.contains(e.target)) {
      options.style.display = "none";
      arrow.style.transform = "rotate(0deg)";
    }
  });


document.addEventListener("DOMContentLoaded", () => {
  const dateRetourDiv = document.getElementById("date_retour");
  const typePretInput = document.getElementById("select-value");
  const selectOptions = document.querySelectorAll(".select-options li");
  const selectedText = document.querySelector(".selected-text");

  selectOptions.forEach((option) => {
    option.addEventListener("click", () => {
      const value = option.getAttribute("data-value");
      const text = option.textContent;

      typePretInput.value = value;
      selectedText.textContent = text;

      // Afficher ou cacher la date de retour
      if (value === "1") {
        dateRetourDiv.style.display = "";
      } else if (value === "2") {
        dateRetourDiv.style.display = "none";
      }
    });
  });
});

        </script>
    </body>
</html>