package controller;

import dao.ScoreDAO;
import model.Score;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/saveScore")
public class ScoreController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int scoreValue = Integer.parseInt(request.getParameter("score"));

        HttpSession session = request.getSession(false);

        if (session != null) {

            User user = (User) session.getAttribute("user");

            if (user != null) {

                Score score = new Score(
                        user.getId(),
                        scoreValue,
                        new java.sql.Timestamp(System.currentTimeMillis())
                );

                ScoreDAO scoreDAO = new ScoreDAO();
                scoreDAO.saveScore(score);

                response.sendRedirect("leaderboard");
                return;
            }
        }

        response.sendRedirect("login.jsp");
    }
}