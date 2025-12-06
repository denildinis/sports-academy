<!doctype html>
<html lang="pt">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="icon" href="./frontend/assets/favicons/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="./frontend/assets/css/pages/cadastrar/index.css" />
  <title>Cadastro | Sports Academy</title>
</head>
<body>
  <section class="form-container">
    <img src="./frontend/assets/images/logo.svg" alt="logo" class="logo" />
    <h1>Seu talento merece estar aqui!</h1>

    <form onsubmit="cadastrarJogador(event)">
      <div class="field">
        <div class="icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 24 24">
            <path d="M12 12.75A5.25 5.25 0 1 0 6.75 7.5 5.25 5.25 0 0 0 12 12.75zm0-9A3.75 3.75 0 1 1 8.25 7.5 3.75 3.75 0 0 1 12 3.75zm9 14.49a6.91 6.91 0 0 0-6.61-5H9.62a6.92 6.92 0 0 0-6.61 5H3a2.75 2.75 0 0 0 2.64 3.51h12.7A2.75 2.75 0 0 0 21 18.24zm-1.64 1.51a1.25 1.25 0 0 1-1 .5H5.65a1.25 1.25 0 0 1-1.2-1.59 5.4 5.4 0 0 1 5.17-3.9h4.76a5.39 5.39 0 0 1 5.17 3.91 1.24 1.24 0 0 1-.2 1.08z"/>
          </svg>
        </div>
        <label for="nome">Nome</label>
        <input type="text" id="nome" name="nome" placeholder="Ex: Denil Dinis" required autocomplete="off" spellcheck="false" />
      </div>

      <div class="field">
        <div class="icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 512 512">
            <path d="M446 40h-46V16c0-8.836-7.163-16-16-16s-16 7.164-16 16v24H144V16c0-8.836-7.163-16-16-16s-16 7.164-16 16v24H66C29.607 40 0 69.607 0 106v340c0 36.393 29.607 66 66 66h380c36.393 0 66-29.607 66-66V106c0-36.393-29.607-66-66-66zM66 72h46v16c0 8.836 7.163 16 16 16s16-7.164 16-16V72h224v16c0 8.836 7.163 16 16 16s16-7.164 16-16V72h46c18.748 0 34 15.252 34 34v38H32v-38c0-18.748 15.252-34 34-34zm380 408H66c-18.748 0-34-15.252-34-34V176h448v270c0 18.748-15.252 34-34 34z"/>
          </svg>
        </div>
        <label for="dataNascimento">Data de Nascimento</label>
        <input type="text" id="dataNascimento" name="dataNascimento" placeholder="dd/mm/aaaa" required maxlength="10" />
      </div>

      <div class="field">
        <div class="icon">
          <svg xmlns="http://www.w3.org/2000/svg" width="512" height="512" viewBox="0 0 368.16 368.16">
            <path d="M184.08 0c-74.992 0-136 61.008-136 136 0 24.688 11.072 51.24 11.536 52.36 3.576 8.488 10.632 21.672 15.72 29.4l93.248 141.288c3.816 5.792 9.464 9.112 15.496 9.112s11.68-3.32 15.496-9.104l93.256-141.296c5.096-7.728 12.144-20.912 15.72-29.4.464-1.112 11.528-27.664 11.528-52.36 0-74.992-61.008-136-136-136zM293.8 182.152c-3.192 7.608-9.76 19.872-14.328 26.8l-93.256 141.296c-1.84 2.792-2.424 2.792-4.264 0L88.696 208.952c-4.568-6.928-11.136-19.2-14.328-26.808-.136-.328-10.288-24.768-10.288-46.144 0-66.168 53.832-120 120-120s120 53.832 120 120c0 21.408-10.176 45.912-10.28 46.152z"/>
            <path d="M184.08 64.008c-39.704 0-72 32.304-72 72s32.296 72 72 72 72-32.304 72-72-32.296-72-72-72zm0 128c-30.872 0-56-25.12-56-56s25.128-56 56-56 56 25.12 56 56-25.128 56-56 56z"/>
          </svg>
        </div>
        <label for="municipio">Município</label>
        <select id="municipio" name="municipio" required>
          <option value="">Selecione o município</option>
          <?php
            include("./backend/connection.php");
            $stmt = $conn->prepare("SELECT DISTINCT municipio FROM clubes ORDER BY municipio ASC");
            $stmt->execute();
            $municipios = $stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($municipios as $row) {
              echo '<option value="'.$row['municipio'].'">'.$row['municipio'].'</option>';
            }
          ?>
        </select>
      </div>

      <button type="submit">Cadastrar</button>
    </form>
  </section>

  <script src="./frontend/assets/js/pages/register-player.js"></script>
</body>
</html>
