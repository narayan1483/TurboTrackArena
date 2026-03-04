let bgMusic = new Audio("sounds/bg.mp3");
let crashSound = new Audio("sounds/crash.mp3");
let coinSound = new Audio("sounds/coin.mp3");
let gameOverSound = new Audio("sounds/gameover.wav");
let buttonSound = new Audio("sounds/button.mp3");

bgMusic.loop = true;

function startMusic() {
    bgMusic.play().catch(() => {});
}

function playCrash() {
    crashSound.play();
}

function playCoin() {
    coinSound.play();
}

function playGameOver() {
    gameOverSound.play();
}

function playButton() {
    buttonSound.play();
}