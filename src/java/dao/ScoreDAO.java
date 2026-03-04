package dao;

import model.Score;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ScoreDAO {

    public void saveScore(Score score) {

        String sql = "INSERT INTO scores (user_id, score, played_at) VALUES (?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, score.getUserId());
            ps.setInt(2, score.getScore());
            ps.setTimestamp(3, score.getPlayedAt());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Score> getTopScores() {

        List<Score> list = new ArrayList<>();

        String sql = "SELECT * FROM scores ORDER BY score DESC LIMIT 10";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Score score = new Score(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("score"),
                        rs.getTimestamp("played_at")
                );

                list.add(score);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}