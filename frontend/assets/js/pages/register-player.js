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

function getFormData() {
  return {
    nome: document.getElementById('nome').value,
    data_nascimento: document.getElementById('dataNascimento').value,
    municipio: document.getElementById('municipio').value
  }
}

async function cadastrarJogador(event) {
  event.preventDefault()

  const formData = getFormData()
  if (!isValidDate(formData.data_nascimento)) {
    alert('Data de nascimento inválida')
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
      alert('Atleta cadastrado com sucesso!')
    } else {
      alert('Erro ao cadastrar atleta: ' + data.message)
    }
  } catch (error) {
    console.error('Erro:', error)
    alert('Ocorreu um erro inesperado.')
  }
}
