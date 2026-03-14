# 🏎️ TurboTrack Narayan

<div align="center">

![Banner](https://img.shields.io/badge/🏎️-TurboTrack%20Narayan-00ffff?style=for-the-badge)
![Java](https://img.shields.io/badge/Java-JSP%20%2F%20Servlet-007396?style=for-the-badge&logo=java&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache-Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![2D Game](https://img.shields.io/badge/2D-Racing%20Game-ff0066?style=for-the-badge)

**A 2D browser-based car racing game built with Java JSP & Servlet.
Dodge enemy cars, survive as long as possible & top the leaderboard!**

*Developed by **Narayan Prasad Maurya***

</div>

---

## 🎮 Game Preview

### 🏠 Home Screen
![Home Screen](https://raw.githubusercontent.com/narayan1483/TurboTrackArena/master/web/images/home.png)

### 👤 Login Pages
![Login Pages](https://raw.githubusercontent.com/narayan1483/TurboTrackArena/master/web/images/login.png)


### 📊 Player Dashboard
![Player Dashboard](https://raw.githubusercontent.com/narayan1483/TurboTrackArena/master/web/images/insidelogin.png)

### 🕹️ Gameplay
![Gameplay Screen](https://raw.githubusercontent.com/narayan1483/TurboTrackArena/master/web/images/playgame.png)

---

> 💡 **Tip:** Upload your screenshots directly to `web/images/` folder on GitHub using **"Add file → Upload files"** and they will automatically show here!

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🏎️ **2D Racing** | Top-down view racing game with smooth car movement |
| 🚗 **Enemy Cars** | Randomly spawning enemy cars to dodge |
| 💯 **Score System** | Real-time score tracking as you survive |
| 🏆 **Leaderboard** | Top players ranked by high score |
| 👤 **User Auth** | Register, Login & Profile management |
| 🔐 **Password Security** | Hashed passwords with PasswordUtil |
| 🔒 **Auth Filter** | Protected routes — login required to play |
| 🎨 **Neon Theme** | Cyberpunk-style neon cyan UI design |
| ⚙️ **Developer Credit** | *Developed by Narayan Prasad Maurya* |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | HTML5, CSS3, JavaScript, JSP |
| **Game Engine** | JavaScript Canvas (2D) |
| **Backend** | Java, JSP, Servlets |
| **Architecture** | MVC (Model-View-Controller) |
| **Database** | MySQL |
| **Server** | Apache Tomcat / TomEE |
| **IDE** | Apache NetBeans IDE 28 |
| **Security** | PasswordUtil (Hashing), AuthFilter |

---

## 📁 Project Structure

```
TurboTrackArena/
│
├── web/                            ← Web Pages (Frontend)
│   ├── css/
│   │   └── style.css               ← Neon theme styles
│   │
│   ├── images/
│   │   ├── player_car.png          ← Player car (blue/yellow)
│   │   ├── red.png                 ← Enemy car (red)
│   │   ├── blue.png                ← Car asset
│   │   ├── green.png               ← Car asset
│   │   ├── yellow.png              ← Car asset
│   │   ├── coin.jpg                ← Coin/score asset
│   │   └── logo.png                ← TurboTrack logo
│   │
│   ├── js/
│   │   ├── gameEngine.js           ← Core game loop & rendering
│   │   ├── collision.js            ← Collision detection
│   │   ├── scoreboard.js           ← Score management
│   │   ├── sound.js                ← Sound effects
│   │   └── validation.js           ← Form validation
│   │
│   ├── sounds/                     ← Game sound effects
│   │
│   ├── index.jsp                   ← Landing / Home page
│   ├── game.jsp                    ← Game screen
│   ├── dashboard.jsp               ← Player dashboard
│   ├── leaderboard.jsp             ← Top scores
│   ├── login.jsp                   ← Player login
│   ├── register.jsp                ← New player register
│   ├── profile.jsp                 ← Player profile
│   └── error.jsp                   ← Error page
│
├── src/
│   ├── controller/                 ← Servlet Controllers
│   │   ├── AuthFilter.java         ← Login protection filter
│   │   ├── LoginController.java
│   │   ├── LogoutController.java
│   │   ├── RegisterController.java
│   │   ├── GameController.java
│   │   ├── ScoreController.java
│   │   └── LeaderboardController.java
│   │
│   ├── dao/                        ← Data Access Layer
│   │   ├── UserDAO.java
│   │   ├── ScoreDAO.java
│   │   └── TopScore.java
│   │
│   ├── model/                      ← POJO Models
│   │   ├── User.java
│   │   └── Score.java
│   │
│   └── util/
│       ├── DBConnection.java       ← MySQL connection
│       └── PasswordUtil.java       ← Password hashing
│
├── build.xml
└── README.md
```

---

## ⚙️ Setup & Installation

### Prerequisites
- Java JDK 21+
- Apache Tomcat / TomEE
- MySQL Server 8.0+
- NetBeans IDE (recommended)
- `mysql-connector-j-9.5.0.jar`

### 1. Clone the Repository
```bash
git clone https://github.com/narayan1483/TurboTrackArena.git
cd TurboTrackArena
```

### 2. Database Setup
```sql
CREATE DATABASE turbotrack;
USE turbotrack;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Scores table
CREATE TABLE scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    score INT NOT NULL,
    played_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 3. Configure Database Connection
Edit `src/util/DBConnection.java`:
```java
private static final String URL  = "jdbc:mysql://localhost:3306/turbotrack";
private static final String USER = "your_mysql_username";
private static final String PASS = "your_mysql_password";
```

### 4. Add MySQL Connector JAR
Add `mysql-connector-j-9.5.0.jar` to project libraries.

### 5. Deploy on Tomcat
- Open project in **NetBeans IDE**
- Right-click → **Clean and Build**
- Run on **Apache Tomcat** (port 8082)
- Open: `http://localhost:8082/TurboTrackArena/`

---

## 🎮 How to Play

| Control | Action |
|---------|--------|
| `←` Left Arrow | Move car left |
| `→` Right Arrow | Move car right |

### Game Rules
1. Your car starts at the **bottom** of the track
2. **Enemy cars** come from the top — dodge them!
3. Survive as long as possible to increase your **score**
4. **Collision** with enemy = Game Over
5. **Login** to save your score to the leaderboard!

---

## 🔐 User Flow

```
Home Page (index.jsp)
       │
       ├──► Register ──► Login ──► Dashboard
       │                               │
       │              ┌────────────────┤
       │              │                │
       │          Start Game      Leaderboard
       │          (game.jsp)      (top scores)
       │              │
       │          Game Over
       │              │
       │        Score Saved to DB
       │
       └──► Profile (view/edit)
```

---

## 🏆 Leaderboard

- Top players ranked by **highest score**
- Auto-saves score on **Game Over**
- Only **best score** per player saved

---

## 🚀 Future Plans

- [ ] Multiple car skins to choose
- [ ] Power-ups (speed boost, shield, slow-mo)
- [ ] Multiple difficulty levels
- [ ] Sound effects & background music
- [ ] Mobile touch controls
- [ ] Multiplayer racing mode
- [ ] Daily/Weekly leaderboard challenges
- [ ] 3D upgrade version

---

## 👨‍💻 Developer

<div align="center">

**Narayan Prasad Maurya**

*Full Stack Java Developer | Game Dev | JSP | Servlet | MySQL*

⚡ *Built with passion for speed and racing* 🏎️

</div>

---

## 📄 License

This project is developed for educational and personal use.  
© 2026 Narayan Prasad Maurya. All rights reserved.

---

<div align="center">

🏁 **Start Your Engine · Hit the Track · Beat the Record** 🏁

⭐ *If you liked this project, give it a star on GitHub!* ⭐

</div>
