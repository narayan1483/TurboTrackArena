
//function checkCollision(player, enemy) {
//
//    // Center point of player
//    let playerCenterX = player.x + player.width / 2;
//    let playerCenterY = player.y + player.height / 2;
//
//    // Center point of enemy
//    let enemyCenterX = enemy.x + enemy.width / 2;
//    let enemyCenterY = enemy.y + enemy.height / 2;
//
//    // Distance between centers
//    let dx = playerCenterX - enemyCenterX;
//    let dy = playerCenterY - enemyCenterY;
//
//    let distance = Math.sqrt(dx * dx + dy * dy);
//
//    // Radius collision (adjust 30 if needed)
//    return distance < 30;
//}


function checkCollision(player, enemy) {

    // Hitbox shrink (andar ka area hi detect karega)
    const shrinkX = 15;
    const shrinkY = 25;

    let pLeft   = player.x + shrinkX;
    let pRight  = player.x + player.width - shrinkX;
    let pTop    = player.y + shrinkY;
    let pBottom = player.y + player.height - shrinkY;

    let eLeft   = enemy.x + shrinkX;
    let eRight  = enemy.x + enemy.width - shrinkX;
    let eTop    = enemy.y + shrinkY;
    let eBottom = enemy.y + enemy.height - shrinkY;

    return !(
        pRight < eLeft ||
        pLeft > eRight ||
        pBottom < eTop ||
        pTop > eBottom
    );
}