<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400"
	rel="stylesheet">
	  <link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="./js/jquery.min.js" type="text/javascript"></script>
    <script src="./js/popper.min.js" type="text/javascript"></script>
    <script src="./js/bootstrap.min.js" type="text/javascript"></script>
	
	<style>
		:root {
 	    /* --body_gradient_left:#BFBFBF;
        --body_gradient_right: #F7FFF7;  */
        --form_bg: #BFBFBF;
        --input_hover: #BFBFBF;
        --input_bg:#F7FFF7;
        --submit_bg: #90303D;
        --submit_hover: #230444;
        --icon_color:#230444;
    }
     * {
        padding: 5px;
        margin: 0;
        box-sizing: border-box;
    }
    body {
        height: 100vh;
        font-family: 'Roboto',sans-serif;
        background-image: linear-gradient(to right, var(--body_gradient_left), var(--body_gradient_right)); 
        display:flex;
    }

    #form_wrapper {
        width: 1000px;
        height: 700px;
        margin:auto;
        background-color: var(--form_bg);
        border-radius: 50px;
        /* make it a grid container*/
        display: grid;
        /* with two columns of same width*/
        grid-template-columns: 1fr 1fr;
        /* with a small gap in between them*/
        grid-gap: 5vw;
        /* add some padding around */
        padding: 5vh 15px;
    }
     #form_left {
        /* center the image */
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #form_left img {
        width: 500px;
        height: 500px;
    }
    #form_right {
        display: grid;
        /* single column layout */
        grid-template-columns: 1fr;
        /* have some gap in between elements*/
        grid-gap: 20px;
        padding: 10% 5%;
        background-color:#CBD1CB;
    }
    .input_container {
        background-color: var(--input_bg);
        display: flex;
        align-items: center;
        padding-left: 20px;
    }

    .input_container:hover {
        background-color: var(--input_hover);
    }

    .input_container,
    #input_submit {
        height: 60px;
        /* make the borders more round */
        border-radius: 30px;
        width: 100%;
    }

    .input_field {
        /* customize the input tag with lighter font and some padding*/
        color: var(--icon_color);
        background-color: inherit;
        width: 90%;
        border: none;
        font-size: 1.3rem;
        font-weight: 400;
        padding-left: 30px;
    }

    .input_field:hover,
    .input_field:focus {
        /* remove the outline */
        outline: none;
    }

    #input_submit {
        /* submit button has a different color and different padding */
        background-color: var(--submit_bg);
        padding-left: 0;
        font-weight: bold;
        color: white;
        text-transform: uppercase;
    }

    #input_submit:hover {
        background-color: var(--submit_hover);
        /* simple color transition on hover */
        transition: background-color,
            1s;
        cursor: pointer;
    }
    
     h1,
    span {
        text-align: center;
    }

    
    #create_account {
        display: block;
        position: relative;
        top: 30px;
    }

    a {
        
        text-decoration: none;
        color: var(--submit_bg);
        font-weight: bold;
    }

    a:hover {
        color: var(--submit_hover);
    }

    i {
        color: var(--icon_color);
    }
       /* makes it responsive */
    @media screen and (max-width:768px) {
        #form_wrapper {
            grid-template-columns: 1fr;
            margin-left: 10px;
            margin-right: 10px;
        }
        /* display for small screen*/
        #form_left {
            display: none;
        }
    }
	
	
	</style>
</head>
<body>

<div id="form_wrapper">
            <div id="form_left">
                <img src="car3.jpeg" alt="noProfile.jpg">
            </div>
            <div id="form_right">
                <h1>Create Account</h1>
			<h2>${msg }</h2>
                <form:form action="newAccount" method="post">
                <div class="input_container">
                    
                    <i class="fas fa-user-tie"></i>
                    <input placeholder="User Name" type="text" name="userName" id="userName" class='input_field'>
                </div>
                <div class="input_container">
                    <i class="fas fa-envelope"></i>
                    <input placeholder="Email" type="email" name="email" id="email" class='input_field'>
                </div>
                <div class="input_container">
                    <i class="fas fa-lock"></i>
                    <input  placeholder="Password" type="password" name="password" id="password" class='input_field'>
                </div>
                <div class="input_container">
                   
                    <input placeholder="First Name" type="text" name="firstName" id="firstName" class='input_field'>
                </div>
                <div class="input_container">
                  
                    <input placeholder="Last Name" type="text" name="lastName" id="lastName" class='input_field'>
                </div>
                <input type="submit" value="Sign Up" id='input_submit' class='input_field'>
                </form:form>
               
            </div>
        </div>

</body>
</html>