<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bibliotheque.models.Livre" %>
<%@ page import="com.bibliotheque.models.Exemplaire" %>
<% List<Livre> livres = (List<Livre>)request.getAttribute("livres"); %>
<% List<Exemplaire> exemplaires = (List<Exemplaire>)request.getAttribute("exemplaires"); %>
<html>
<head>
    <title>Liste des Livres</title>
</head>
<body>
    <h1>Liste des Livres</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Titre</th>
                <th>Auteur</th>
                <th>Catégorie</th>
                <th>Date de Sortie</th>
                <th>Edition</th>
                <th>Restrcition Age</th>
                <th>Nombre d'exemplaires</th>
            </tr>
        </thead>
        <tbody>
            <% for(Livre livre : livres ) {%>
                <tr>
                    <td><%= livre.getIdlivre() %></td>
                    <td><%= livre.getTitre() %></td>
                    <td><%= livre.getAuteur().getNom() %></td>
                    <td><%= livre.getCategorie().getNom() %></td>
                    <td><%= livre.getDatesortie() %></td>                    
                    <td><%= livre.getEdition() %></td>    
                    <td><%= livre.getRestriction().getAge() %></td>                
                    <td><%= livre.getNbExemplaire() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <br>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Numéro Exemplaire</th>
                <th>Date d'ajout</th>
                <th>Status</th>
                <th>Livre</th>
            </tr>
        </thead>
        <tbody>
            <% for(Exemplaire exemplaire : exemplaires ) {%>
                <tr>
                    <td><%= exemplaire.getIdexemplaire() %></td>
                    <td><%= exemplaire.getNumeroExemplaire() %></td>
                    <td><%= exemplaire.getDateAjout() %></td>
                    <td><%= exemplaire.getStatus() %></td>
                    <td><%= exemplaire.getLivre().getTitre() %></td>                    
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
