package controller;

import dao.ScoreDAO;
import model.Score;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/game")
public class GameController extends HttpServlet {

    // open game page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
        } else {
            request.getRequestDispatcher("game.jsp").forward(request, response);
        }
    }

    // save score
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) return;

        User user = (User) session.getAttribute("user");

        int scoreValue = Integer.parseInt(request.getParameter("score"));

        Score score = new Score();
        score.setUserId(user.getId());
        score.setScore(scoreValue);
        score.setPlayedAt(new Timestamp(System.currentTimeMillis()));

        ScoreDAO dao = new ScoreDAO();
        dao.saveScore(score);

        response.getWriter().write("saved");
    }
}