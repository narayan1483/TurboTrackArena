<!DOCTYPE html>
<html>
<head>
<title>Register - TurboTrack Narayan</title>

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
overflow:hidden;
}

/* animated road background */

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
opacity:0.35;
}

@keyframes roadMove{
0%{transform:translateY(0);}
100%{transform:translateY(80px);}
}

/* register box */

.registerBox{

background:rgba(10,20,40,0.9);
padding:50px;
border-radius:12px;
text-align:center;
width:380px;
box-shadow:0 0 40px #00f7ff;
z-index:2;
}

/* title */

.title{

color:#00f7ff;
font-size:32px;
margin-bottom:30px;
text-shadow:0 0 15px cyan;

}

/* inputs */

input{

width:100%;
padding:15px;
margin:15px 0;
border:none;
border-radius:8px;
background:#111;
color:white;
font-size:15px;
outline:none;
box-shadow:0 0 10px #00f7ff;

}

/* button */

button{

margin-top:20px;
padding:15px 40px;
background:#00f7ff;
border:none;
border-radius:10px;
font-weight:bold;
font-size:16px;
cursor:pointer;
transition:0.3s;
box-shadow:0 0 20px cyan;

}

button:hover{

transform:scale(1.08);
box-shadow:0 0 40px cyan;

}

/* login text */

.loginText{

margin-top:25px;
color:white;

}

.loginText a{

color:#ff00ff;
text-decoration:none;

}

.loginText a:hover{

text-decoration:underline;

}

</style>

</head>

<body>

<div class="registerBox">

<div class="title">Create Account</div>

<form action="register" method="post">

<input type="text" name="username" placeholder="Username" required>

<input type="email" name="email" placeholder="Email" required>

<input type="password" name="password" placeholder="Password" required>

<button type="submit">Register</button>

</form>
<div class="loginText">

Already have account?
<a href="login.jsp">Login</a>

</div>

</div>

</body>
</html>