<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>README - Refatoração de UI com Atomic Design e Animações</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px 60px;
            max-width: 900px;
            width: 95%;
            text-align: center;
            border-left: 8px solid #007bff; /* Linha de destaque */
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: -50px;
            left: -50px;
            width: 150px;
            height: 150px;
            background: radial-gradient(circle, rgba(0,123,255,0.1) 0%, rgba(0,123,255,0) 70%);
            border-radius: 50%;
            z-index: 0;
        }

        .container::after {
            content: '';
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 150px;
            height: 150px;
            background: radial-gradient(circle, rgba(0,123,255,0.1) 0%, rgba(0,123,255,0) 70%);
            border-radius: 50%;
            z-index: 0;
        }

        h1 {
            color: #007bff;
            font-size: 2.8em;
            margin-bottom: 20px;
            font-weight: 700;
            letter-spacing: -1px;
            position: relative;
            z-index: 1;
        }

        h1 span {
            display: block;
            font-size: 0.6em;
            color: #6c757d;
            margin-top: 5px;
            font-weight: 400;
        }

        h2 {
            color: #0056b3;
            font-size: 1.8em;
            margin-top: 30px;
            margin-bottom: 15px;
            font-weight: 600;
            position: relative;
            z-index: 1;
        }

        p {
            font-size: 1.1em;
            margin-bottom: 25px;
            color: #555;
            position: relative;
            z-index: 1;
        }

        .authors {
            margin-top: 40px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            color: #777;
            font-size: 0.95em;
            font-weight: 300;
            position: relative;
            z-index: 1;
        }

        .authors strong {
            color: #007bff;
            font-weight: 600;
        }

        .badge {
            display: inline-block;
            background-color: #28a745;
            color: white;
            padding: 8px 15px;
            border-radius: 20px;
            font-size: 0.9em;
            font-weight: 600;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.2);
            position: relative;
            z-index: 1;
        }

        .footer-note {
            margin-top: 30px;
            font-size: 0.85em;
            color: #999;
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>
            🚀 Refatoração de UI com Atomic Design
            <span>e Animações em Flutter</span>
        </h1>
        <p>
            Este projeto apresenta a refatoração de um aplicativo de clima monolítico em uma estrutura modular e escalável.
            Utilizando os princípios do **Atomic Design**, a interface foi decomposta em componentes reutilizáveis:
            **Átomos**, **Moléculas** e **Organismos**, promovendo maior legibilidade, manutenção e reuso do código.
        </p>
        <p>
            Além da reestruturação, foram implementadas **animações fluidas** para aprimorar a experiência do usuário,
            adicionando dinamismo e um toque moderno à navegação do aplicativo.
        </p>

        <span class="badge">Projeto Concluído com Sucesso!</span>

        <div class="authors">
            Desenvolvido por:<br>
            <strong>Vitor Bobato</strong> e <strong>Paulo Cesar Cardoso Domingues</strong>
        </div>

        <p class="footer-note">
            Acreditamos que um bom design de código e uma experiência de usuário cativante
            são fundamentais para o sucesso de qualquer aplicação.
        </p>
    </div>
</body>
</html>
