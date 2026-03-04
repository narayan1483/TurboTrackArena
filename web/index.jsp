<!DOCTYPE html>
<html>
<head>
<title>TurboTrack Arena</title>

<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

<style>

body{
margin:0;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:black;
font-family:'Orbitron',sans-serif;
color:white;
overflow:hidden;
}

/* moving road background */

body::before{
content:"";
position:absolute;
width:100%;
height:200%;
background: repeating-linear-gradient(
0deg,
#111 0px,
#111 40px,
#000 40px,
#000 80px
);
animation:roadMove 5s linear infinite;
opacity:0.25;
}
@keyframes roadMove{
0%{
transform:translateX(0);
}
100%{
transform:translateX(-80px);
}
}
/* center road line */

body::after{
content:"";
position:absolute;
top:120px;
height:6px;
width:200%;
background: repeating-linear-gradient(
90deg,
white 0px,
white 40px,
transparent 40px,
transparent 80px
);
animation:roadMove 3s linear infinite;
}

/* container */

.container{
text-align:center;
z-index:3;
position:relative;
}

/* logo */

.logo{
width:300px;
animation:logoGlow 2s infinite alternate;
}

@keyframes logoGlow{
from{filter:drop-shadow(0 0 5px cyan);}
to{filter:drop-shadow(0 0 25px cyan);}
}

/* title */

.title{
color:#00f7ff;
font-size:40px;
text-shadow:
0 0 10px cyan,
0 0 20px cyan,
0 0 40px cyan;
margin-top:20px;
}

/* start button */

.startBtn{
display:inline-block;
margin-top:40px;
padding:18px 40px;
background:#00f7ff;
color:black;
text-decoration:none;
font-weight:bold;
border-radius:10px;
font-size:18px;
transition:0.3s;
box-shadow:0 0 20px #00f7ff;
}

.startBtn:hover{
transform:scale(1.1);
box-shadow:0 0 40px #00f7ff;
}

/* car animation */

.car{
position:absolute;
top:-20px;      /* line ke upar lane ke liye */
left:-150px;
width:120px;

transform: rotate(90deg);

animation:carMove 6s linear infinite;
}

@keyframes carMove{

0%{
left:-150px;
}

100%{
left:110%;
}

}


.carred{
position:absolute;
top:70px;        /* road line level */
right:-150px;    /* right side se start */
width:120px;

transform: rotate(90deg);

animation:carMoveRed 6s linear infinite;
}

@keyframes carMoveRed{

0%{
right:-150px;
}

100%{
right:110%;
}

}


</style>

</head>

<body>

<div class="container">

<img src="images/logo.png" class="logo">

<h1 class="title">
Welcome to TurboTrack Narayan
</h1>

<a href="login.jsp" class="startBtn">
START GAME
</a>

</div>

<!-- racing car -->
<img src="images/player_car.png" class="car">
<img src="images/red.png" class="carred">


</body>
</html>