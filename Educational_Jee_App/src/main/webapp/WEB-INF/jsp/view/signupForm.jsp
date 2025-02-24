<!doctype html>
<html lang="en">
<head>
    <title>Sign Up Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu|Rubik:400,500&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Rubik', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url('/resources/img/3.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .signup-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            padding: 40px;
            text-align: center;
            width: 100%;
            max-width: 450px;
            animation: fadeIn 1.5s ease;
        }

        .signup-container h1 {
            font-size: 26px;
            color: #4f46a5;
            margin-bottom: 10px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        .signup-container h4 {
            font-size: 14px;
            font-weight: normal;
            color: rgba(0, 0, 0, 0.6);
            margin-bottom: 20px;
        }

        .form-field {
            height: 46px;
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-field:focus {
            border-color: #4f46a5;
            outline: none;
        }

        .signup-container button {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .signup-container button:hover {
            background: linear-gradient(to right, #2575fc, #6a11cb);
            transform: scale(1.05);
        }

        .signup-container a {
            display: block;
            margin-top: 10px;
            font-size: 12px;
            color: #4f46a5;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .signup-container a:hover {
            color: #6a11cb;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(-20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h1>Sign Up</h1>
        <h4>Create your account</h4>
        <form action="${pageContext.request.contextPath}/registerUser" method="POST">
            <input class="form-field" type="text" name="username" placeholder="Username" required>
            <input class="form-field" type="email" name="email" placeholder="Email" required>
            <input class="form-field" type="password" name="password" placeholder="Password" required>
            <input class="form-field" type="password" name="confirmPassword" placeholder="Confirm Password" required>
            <button type="submit">SIGN UP</button>
            <a href="${pageContext.request.contextPath}/showMyLoginPage">Already have an account? Log in</a>
        </form>
    </div>
</body>
</html>
