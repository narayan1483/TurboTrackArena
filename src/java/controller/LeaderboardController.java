package controller;

import dao.ScoreDAO;
import model.Score;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/leaderboard")
public class LeaderboardController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ScoreDAO scoreDAO = new ScoreDAO();
        List<Score> scores = scoreDAO.getTopScores();

        request.setAttribute("topScores", scores);
        request.getRequestDispatcher("leaderboard.jsp").forward(request, response);
    }
}