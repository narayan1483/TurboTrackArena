function updateScore(points) {
    let scoreElement = document.getElementById("score");
    let current = parseInt(scoreElement.innerText);
    scoreElement.innerText = current + points;
}