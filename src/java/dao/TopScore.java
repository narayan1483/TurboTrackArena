package model;

public class TopScore {

    private String username;
    private int score;
    private String date;

    public TopScore(String username, int score, String date) {
        this.username = username;
        this.score = score;
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public int getScore() {
        return score;
    }

    public String getDate() {
        return date;
    }
}