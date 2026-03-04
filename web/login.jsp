<!DOCTYPE html>
<html>
<head>
<title>TurboTrack Arena - Login</title>

<link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@500&display=swap" rel="stylesheet">

<style>

body{
margin:0;
height:100vh;
display:flex;
justify-content:center;
align-items:center;
font-family:'Orbitron',sans-serif;
background:#000;
overflow:hidden;
color:white;
}

/* ROAD BACKGROUND */

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
opacity:0.3;
}

@keyframes roadMove{
0%{
transform:translateX(0);
}
100%{
transform:translateX(-80px);
}
}
/* ROAD CENTER LINE */

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


/* LOGIN CARD */

.login-box{
position:relative;
width:380px;
padding:40px;
background:rgba(0,0,0,0.65);
border-radius:15px;
text-align:center;
backdrop-filter:blur(10px);
box-shadow:0 0 40px cyan;
z-index:2;
}

/* TITLE */

.login-box h1{
margin-bottom:30px;
color:#00f7ff;
text-shadow:0 0 20px cyan;
}

/* INPUT */

.input-box{
width:100%;
padding:12px;
margin:12px 0;
border:none;
border-radius:8px;
background:#1a1a1a;
color:white;
font-size:14px;
outline:none;
transition:0.3s;
}

.input-box:focus{
box-shadow:0 0 12px cyan;
background:#000;
}

/* BUTTON */

.login-btn{
margin-top:20px;
padding:12px 40px;
background:#00f7ff;
border:none;
border-radius:8px;
font-weight:bold;
cursor:pointer;
transition:0.3s;
}

.login-btn:hover{
background:#00ffff;
box-shadow:0 0 20px cyan;
transform:scale(1.05);
}

/* REGISTER */

.register{
margin-top:15px;
font-size:14px;
}

.register a{
color:#ff00ff;
text-decoration:none;
}

.register a:hover{
text-decoration:underline;
}

/* CAR ANIMATION */

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



</style>

</head>

<body>

<!-- MOVING CAR -->
<img src="images/player_car.png" class="car">

<div class="login-box">

<h1>Login</h1>

<form action="login" method="post">

<input type="email" name="email" placeholder="Enter Email" class="input-box">

<input type="password" name="password" placeholder="Enter Password" class="input-box">

<button class="login-btn">Login</button>

</form>

<div class="register">
Don't have account? <a href="register.jsp">Register</a>
</div>

<br>

<a href="index.jsp" class="back-btn">Back to Home</a>

</div>
</body>
</html>