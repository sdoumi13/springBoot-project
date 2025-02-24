<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Interactive Animation</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('/resources/img/3.png') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
        }

        .interactive-frame {
            position: relative;
            width: 500px;
            padding: 30px;
            border-radius: 15px;
            text-align: center;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            font-size: 20px;
            font-weight: bold;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            animation: moveAndChangeColor 5s infinite alternate;
        }

        @keyframes moveAndChangeColor {
            0% {
                transform: translateX(-200px);
                background: linear-gradient(135deg, #6a11cb, #2575fc);
            }
            50% {
                transform: translateX(0);
                background: linear-gradient(135deg, #ff416c, #ff4b2b);
            }
            100% {
                transform: translateX(200px);
                background: linear-gradient(135deg, #1cd8d2, #93edc7);
            }
        }

        .interactive-frame h3 {
            margin: 0;
            font-size: 28px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .interactive-frame p {
            margin-top: 10px;
            font-size: 16px;
            line-height: 1.5;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .interactive-frame a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 25px;
            background: white;
            color: #6a11cb;
            font-size: 16px;
            font-weight: bold;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .interactive-frame a:hover {
            background: #6a11cb;
            color: white;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="interactive-frame">
        <h3>Spring Web Java Application</h3>
        <p>This application was developed in an educational context at the Faculty of Sciences and Techniques, Tangier.</p>
        <a href="/showMyLoginPage">Access Here!</a>
    </div>
</body>
</html>
