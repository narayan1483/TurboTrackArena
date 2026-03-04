<%@ page import="java.util.List" %>
<%@ page import="model.Score" %>

<!DOCTYPE html>
<html>
<head>
    <title>Leaderboard</title>
    <link rel="stylesheet" href="css/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">
</head>
<body>

<h2>Top Scores</h2>

<table border="1">
    <tr>
        <th>Rank</th>
        <th>User ID</th>
        <th>Score</th>
        <th>Date</th>
    </tr>

<%
    List<Score> scores = (List<Score>) request.getAttribute("topScores");
    if (scores != null) {
        int rank = 1;
        for (Score s : scores) {
%>
<tr>
    <td><%= rank++ %></td>
    <td><%= s.getUserId() %></td>
    <td><%= s.getScore() %></td>
    <td><%= s.getPlayedAt() %></td>
</tr>
<%
        }
    }
%>

</table>

<br>
<a href="dashboard.jsp">Back to Dashboard</a>

</body>
</html>