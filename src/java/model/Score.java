package model;

import java.sql.Timestamp;

public class Score {

    private int id;
    private int userId;
    private int score;
    private Timestamp playedAt;

    public Score() {}

    public Score(int userId, int score, Timestamp playedAt) {
        this.userId = userId;
        this.score = score;
        this.playedAt = playedAt;
    }

    public Score(int id, int userId, int score, Timestamp playedAt) {
        this.id = id;
        this.userId = userId;
        this.score = score;
        this.playedAt = playedAt;
    }

    public int getId() { return id; }
    public int getUserId() { return userId; }
    public int getScore() { return score; }
    public Timestamp getPlayedAt() { return playedAt; }

    public void setId(int id) { this.id = id; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setScore(int score) { this.score = score; }
    public void setPlayedAt(Timestamp playedAt) { this.playedAt = playedAt; }
}