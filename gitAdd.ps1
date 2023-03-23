
param(
  [string]$nomePasta
)

if(-not $nomePasta) {
  Write-Error "Por favor, informe o nome da pasta como parâmetro."
  exit 1
}

param(
  [string]$nomePasta
)

New-Item -ItemType Directory -Path "C:\"

# Navega para a pasta do repositório
cd $nomePasta

$repoName = $nomePasta
$token = "seu-token-git"


# Define o cabeçalho HTTP para a solicitação
$header = @{
    Authorization = "Token $token"
    Accept = "application/vnd.github.v3+json"
}

# Define os dados da solicitação
$body = @{
    name = $repoName
    auto_init = $true
} | ConvertTo-Json

# Cria o novo repositório no GitHub
$response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $header -Body $body

git remote -v

git init

$commitMessage = "Criando o repositório"

echo "# $repoName" >> README.md
git add .
git commit -m $commitMessage

git clone  https://github.com/insira-seu-user-aqui/$repoName

