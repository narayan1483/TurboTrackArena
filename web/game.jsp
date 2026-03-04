
<!DOCTYPE html>
<html>
<head>
    <title>TurboTrack Arena</title>
    <style>
        body {
            background: black;
            text-align: center;
            color: white;
        }
        canvas {
            background: #111;
            display: block;
            margin: auto;
            border: 3px solid cyan;
        }
    </style>
</head>
<body>

<h2>TurboTrack Arena</h2>
<h3>Score: <span id="score">0</span></h3>

<canvas id="gameCanvas" width="400" height="600"></canvas>

<script src="js/collision.js"></script>

<script>

const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

let score;
let speed;
let gameRunning;

//const lanes = [70, 170, 270];
const lanes = [40, 130, 220, 310];

let currentLane = 1;

const playerWidth = 45;
const playerHeight = 85;
const enemyWidth = 45;
const enemyHeight = 85;

let playerX;
let playerTargetX;   // ? added for smooth movement
let playerY;

let roadOffset;
let enemies;

const playerImg = new Image();
playerImg.src = "images/player_car.png";

const enemyImages = [];

const enemy1 = new Image();
enemy1.src = "images/red.png";

const enemy2 = new Image();
enemy2.src = "images/yellow.png";

const enemy3 = new Image();
enemy3.src = "images/green.png";

const enemy4 = new Image();
enemy4.src = "images/blue.png";

enemyImages.push(enemy1, enemy2, enemy3, enemy4);

function initGame() {

    score = 0;
    speed = 4;
    gameRunning = true;

    currentLane = 1;
    playerX = lanes[currentLane];
    playerTargetX = playerX;   // ? important
    playerY = 480;

    roadOffset = 0;

 enemies = [
 { lane:0, y:-100, img: enemyImages[Math.floor(Math.random()*enemyImages.length)] },
 { lane:1, y:-300, img: enemyImages[Math.floor(Math.random()*enemyImages.length)] },
 { lane:2, y:-500, img: enemyImages[Math.floor(Math.random()*enemyImages.length)] }
];

    document.getElementById("score").innerText = score;

    requestAnimationFrame(gameLoop);
}

document.addEventListener("keydown", function(e) {

    if (!gameRunning) return;

    if (e.key === "ArrowLeft" && currentLane > 0) {
        currentLane--;
        playerTargetX = lanes[currentLane];   // ? changed
    }

    if (e.key === "ArrowRight" && currentLane < 3) {
        currentLane++;
        playerTargetX = lanes[currentLane];   // ? changed
    }

});

function drawRoad() {

    ctx.fillStyle = "#111";
    ctx.fillRect(0, 0, 400, 600);

    ctx.fillStyle = "white";
    ctx.fillRect(0, 0, 10, 600);
    ctx.fillRect(390, 0, 10, 600);

    ctx.strokeStyle = "white";
    ctx.lineWidth = 5;

   for (let i = -1; i < 10; i++) {

    // lane 1
    ctx.beginPath();
    ctx.moveTo(100, roadOffset + i * 80);
    ctx.lineTo(100, roadOffset + i * 80 + 40);
    ctx.stroke();

    // lane 2
    ctx.beginPath();
    ctx.moveTo(200, roadOffset + i * 80);
    ctx.lineTo(200, roadOffset + i * 80 + 40);
    ctx.stroke();

    // lane 3
    ctx.beginPath();
    ctx.moveTo(300, roadOffset + i * 80);
    ctx.lineTo(300, roadOffset + i * 80 + 40);
    ctx.stroke();

}
    roadOffset += speed;
    if (roadOffset > 80) roadOffset = 0;
}

function gameLoop() {

    if (!gameRunning) return;

    ctx.clearRect(0, 0, 400, 600);

    drawRoad();

    // ? Smooth movement (speed control here)
    if (playerX < playerTargetX) {
        playerX += 2;   // Change 2 to 1 for slower movement
    }
    else if (playerX > playerTargetX) {
        playerX -= 2;
    }

//    ctx.drawImage(playerImg, playerX+8, playerY+8, playerWidth-16, playerHeight-16);
ctx.drawImage(playerImg, playerX, playerY, playerWidth, playerHeight);

    for (let i = 0; i < enemies.length; i++) {

        let enemyX = lanes[enemies[i].lane];
        let enemyY = enemies[i].y;

//      ctx.drawImage(enemies[i].img, enemyX+8, enemyY+8, enemyWidth-16, enemyHeight-16);
ctx.drawImage(enemies[i].img, enemyX, enemyY, enemyWidth, enemyHeight);

        enemies[i].y += speed;

        if (enemies[i].y > 600) {
            enemies[i].y = -100;
            enemies[i].lane = Math.floor(Math.random() * 4);
            score += 10;
            document.getElementById("score").innerText = score;
            speed += 0.01;
        }

        let player = {
            x: playerX,
            y: playerY,
            width: playerWidth,
            height: playerHeight
        };

        let enemy = {
            x: enemyX,
            y: enemyY,
            width: enemyWidth,
            height: enemyHeight
        };

        if (checkCollision(player, enemy)) {

            gameRunning = false;

            setTimeout(() => {
                if (confirm("Game Over! Score: " + score + "\nRestart?")) {
                    initGame();
                }
            }, 100);

            return;
        }
    }

    requestAnimationFrame(gameLoop);
}

window.onload = function() {
    initGame();
};

</script>

</body>
</html>