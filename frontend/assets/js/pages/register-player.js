const dataInput = document.getElementById('dataNascimento')
const form = document.querySelector('form')

dataInput.addEventListener('input', formatDateInput)
form.addEventListener('submit', cadastrarJogador)

function formatDateInput() {
  let value = this.value.replace(/\D/g, '')
  if (value.length > 8) value = value.slice(0, 8)

  let formatted = ''
  if (value.length >= 2) formatted += value.slice(0, 2) + '/'
  else formatted += value

  if (value.length >= 4) formatted += value.slice(2, 4) + '/'
  else if (value.length > 2) formatted += value.slice(2)

  if (value.length > 4) formatted += value.slice(4)

  this.value = formatted
}

function isValidDate(dateString) {
  const partes = dateString.split('/')
  if (partes.length !== 3) return false

  const dia = parseInt(partes[0], 10)
  const mes = parseInt(partes[1], 10)
  const ano = parseInt(partes[2], 10)
  const anoAtual = new Date().getFullYear()

  if (ano <= 0 || ano > anoAtual) return false
  if (mes < 1 || mes > 12) return false
  if (dia < 1 || dia > 31) return false

  return true
}

function calcularIdade(dateString) {
  const partes = dateString.split('/')
  if (partes.length !== 3) return 0

  const dia = parseInt(partes[0], 10)
  const mes = parseInt(partes[1], 10)
  const ano = parseInt(partes[2], 10)

  const hoje = new Date()
  let idade = hoje.getFullYear() - ano
  if (hoje.getMonth() + 1 < mes || (hoje.getMonth() + 1 === mes && hoje.getDate() < dia)) {
    idade--
  }
  return idade
}

function getFormData() {
  const dataInput = document.getElementById('dataNascimento').value
  const partes = dataInput.split('/')
  let dataFormatada = ''

  if (partes.length === 3) {
    const dia = partes[0].padStart(2, '0')
    const mes = partes[1].padStart(2, '0')
    const ano = partes[2]
    dataFormatada = `${ano}-${mes}-${dia}` // YYYY-MM-DD
  }

  return {
    nome: document.getElementById('nome').value,
    data_nascimento: dataFormatada,
    municipio: document.getElementById('municipio').value
  }
}

async function cadastrarJogador(event) {
  event.preventDefault()

  const formData = getFormData()
  const idade = calcularIdade(document.getElementById('dataNascimento').value)

  if (!isValidDate(document.getElementById('dataNascimento').value)) {
    alert('Data de nascimento inválida')
    return
  }

  if (idade > 29) {
    alert('Atleta não pode ter mais de 29 anos para se cadastrar.')
    return
  }

  try {
    const response = await fetch('./backend/register-player.php', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(formData)
    })
    const data = await response.json()

    if (data.success) {
      alert(`Atleta cadastrado com sucesso! Categoria: ${data.categoria}`)
    } else {
      alert('Erro ao cadastrar atleta: ' + data.message)
    }
  } catch (error) {
    console.error('Erro:', error)
    alert('Ocorreu um erro inesperado.')
  }
}
