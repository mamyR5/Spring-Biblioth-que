<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bibliotheque.models.Livre" %>
<% List<Livre> livres = (List<Livre>)request.getAttribute("livres"); %>
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
                    <td><%= livre.getNbExemplaire() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
