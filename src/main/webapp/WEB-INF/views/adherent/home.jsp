<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.List" %>
<%@ page import="com.bibliotheque.models.Livre" %>
<%@ page import="com.bibliotheque.models.Exemplaire" %>
<% List<Livre> livres = (List<Livre>)request.getAttribute("livres"); %>
<% List<Exemplaire> exemplaires = (List<Exemplaire>)request.getAttribute("exemplaires"); %>

<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/home.css">
</head>
<body>
    <h1>Liste des Livres</h1>

    <div class="container">
        <% for(Livre livre : livres) { %>
            <div class="card">
                <div class="titre-container">
                    <div class="categorie"><%=livre.getCategorie().getNom() %></div>
                    <div class="titre"><%= livre.getTitre() %></div>
                </div>
                <div class="description">
                    <div class="auteur"><%= livre.getAuteur().getNom() %></div>
                    <div class="dateSortie"><%= livre.getDatesortie() %></div>
                </div>
            </div>            
        <% } %>
    </div>

    <h1>Liste des Exemplaires</h1>

     <div class="container">
        <% for(Exemplaire exemplaire : exemplaires) { %>
            <div class="card">
                <div class="titre-container">
                    <div class="categorie"><%=exemplaire.getLivre().getCategorie().getNom() %></div>
                    <div class="titre"><%= exemplaire.getLivre().getTitre() %></div>
                </div>
                <div class="description">
                    <div class="auteur">Exemplaire N°<%= exemplaire.getNumeroExemplaire() %></div>
                    <% if(exemplaire.getStatus().equals("Disponible")) {%>
                       <div class="Statut"><a href="<%=request.getContextPath() %>/user/pret?idLivre=<%=exemplaire.getLivre().getIdlivre()%>&&idExemplaire=<%=exemplaire.getIdExemplaire()%>"><%= exemplaire.getStatus() %></a></div>
                    <% } else {%>
                        <div class="Statut"><%= exemplaire.getStatus() %></div>
                    <% }%>
                </div>
            </div>            
        <% } %>
    </div>


</body>
</html>
