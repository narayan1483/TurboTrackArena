const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

let score = 0;
let speed = 5;
let gameOver = false;

const roadWidth = 400;
const roadHeight = 600;

let player = {
    x: 170,
    y: 500,
    width: 60,
    height: 100
};

let enemy = {
    x: Math.random() * 300,
    y: -120,
    width: 60,
    height: 100
};

let roadY = 0;

document.addEventListener("keydown", moveCar);

function moveCar(e) {
    if (e.key === "ArrowLeft" && player.x > 0) {
        player.x -= 20;
    }
    if (e.key === "ArrowRight" && player.x < roadWidth - player.width) {
        player.x += 20;
    }
}

function drawRoad() {
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, roadWidth, roadHeight);

    ctx.strokeStyle = "white";
    ctx.lineWidth = 5;

    for (let i = 0; i < 10; i++) {
        ctx.beginPath();
        ctx.moveTo(200, roadY + i * 80);
        ctx.lineTo(200, roadY + i * 80 + 40);
        ctx.stroke();
    }

    roadY += speed;
    if (roadY > 80) roadY = 0;
}

function drawCar(x, y, color) {
    ctx.fillStyle = color;
    ctx.fillRect(x, y, 60, 100);
}

function detectCollision() {
    return !(
        player.y > enemy.y + enemy.height ||
        player.y + player.height < enemy.y ||
        player.x > enemy.x + enemy.width ||
        player.x + player.width < enemy.x
    );
}

function updateGame() {
    if (gameOver) return;

    ctx.clearRect(0, 0, roadWidth, roadHeight);

    drawRoad();

    enemy.y += speed;

    if (enemy.y > roadHeight) {
        enemy.y = -120;
        enemy.x = Math.random() * 300;
        score += 10;
        document.getElementById("score").innerText = score;

        if (score % 50 === 0) {
            speed += 1; // speed increase
        }
    }

    drawCar(player.x, player.y, "lime");
    drawCar(enemy.x, enemy.y, "red");

    if (detectCollision()) {
        gameOver = true;
        alert("Game Over! Final Score: " + score);
        saveScore(score);
    }

    requestAnimationFrame(updateGame);
}

function saveScore(score) {
    fetch("GameController", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "score=" + score
    });
}

updateGame();