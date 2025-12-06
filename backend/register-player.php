<?php
include("./connection.php");

$json = file_get_contents("php://input");
$data = json_decode($json, true);

$nome = $data["nome"];
$dataNascimento = $data["data_nascimento"];
$municipio = $data["municipio"];

function calcularIdade($dataNascimento) {
    $hoje = new DateTime();
    $nascimento = DateTime::createFromFormat('d/m/Y', $dataNascimento);
    if (!$nascimento) return false;
    return $hoje->diff($nascimento)->y;
}

function categoriaEtaria($idade) {
    if ($idade <= 12) return "Infantil";
    if ($idade <= 17) return "Juvenil";
    return "Senior";
}

$idade = calcularIdade($dataNascimento);
if ($idade === false) {
    echo json_encode(["success"=>false, "message"=>"Data de nascimento inválida"]);
    exit;
}

$categoriaNome = categoriaEtaria($idade);

$stmtCat = $conn->prepare("SELECT id FROM categorias WHERE nome = ?");
$stmtCat->execute([$categoriaNome]);
$categoria = $stmtCat->fetch(PDO::FETCH_ASSOC);

if (!$categoria) {
    echo json_encode(["success"=>false, "message"=>"Categoria não encontrada"]);
    exit;
}

$stmt = $conn->prepare("SELECT * FROM clubes WHERE municipio = ? AND total_atletas < total_vagas ORDER BY id ASC LIMIT 1");
$stmt->execute([$municipio]);
$clube = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$clube) {
    $stmt = $conn->prepare("SELECT * FROM clubes WHERE total_atletas < total_vagas ORDER BY id ASC LIMIT 1");
    $stmt->execute();
    $clube = $stmt->fetch(PDO::FETCH_ASSOC);
}

if (!$clube) {
    echo json_encode(["success"=>false, "message"=>"Não há vagas disponíveis no momento"]);
    exit;
}

$query = $conn->prepare("INSERT INTO atletas(nome, data_nascimento, municipio, categoria_id, clube_id) VALUES(?,?,?,?,?)");

if($query->execute([$nome, $dataNascimento, $municipio, $categoria['id'], $clube['id']])) {
    $update = $conn->prepare("UPDATE clubes SET total_atletas = total_atletas + 1 WHERE id = ?");
    $update->execute([$clube['id']]);

    echo json_encode([
        "success"=>true,
        "message"=>"Atleta cadastrado com sucesso",
        "clube"=>$clube['nome'],
        "categoria"=>$categoriaNome
    ]);
} else {
    echo json_encode(["success"=>false, "message"=>"Erro ao cadastrar atleta"]);
}
?>
