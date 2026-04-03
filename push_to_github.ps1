# Script seguro y minimalista para subir a GitHub
# Uso: powershell -ExecutionPolicy Bypass -File push_to_github.ps1

$ErrorActionPreference = 'Stop'

# Cambia esto por tu usuario real
$githubUser = 'SoyRode'
$repoName = 'rode'
$projectDir = 'C:\AppCelulares\itp_irpf_calculator'

Write-Host 'Iniciando script de carga a GitHub...' -ForegroundColor Cyan

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host 'Error: git no está instalado o no está en PATH.' -ForegroundColor Red
    Write-Host 'Solución rápida: usa la interfaz web de GitHub para subir archivos manualmente.' -ForegroundColor Yellow
    exit 1
}

Set-Location $projectDir

# Configura identidad de git si faltan
if (-not (git config --global user.email)) {
    git config --global user.email "tu-email@ejemplo.com"
    Write-Host 'Se configuró user.email global con tu-email@ejemplo.com (ajusta si es necesario).' -ForegroundColor Yellow
}
if (-not (git config --global user.name)) {
    git config --global user.name "Tu Nombre"
    Write-Host 'Se configuró user.name global con "Tu Nombre" (ajusta si es necesario).' -ForegroundColor Yellow
}

if (-not (Test-Path .git)) {
    git init
}

$remoteUrl = "https://github.com/$githubUser/$repoName.git"

try {
    git remote remove origin 2>$null
} catch {
    # Ignorar si no existía
}

git remote add origin $remoteUrl

git checkout -B main

git add --all
try {
    git commit -m 'Initial commit - ITP IRPF Calculator'
} catch {
    Write-Host 'No hay cambios para commitear.' -ForegroundColor Yellow
}

git push -u origin main

Write-Host 'Subida completada.' -ForegroundColor Green
Write-Host "Revisa: https://github.com/$githubUser/$repoName/actions" -ForegroundColor Green
Write-Host 'Cuando Actions termine, descarga el APK desde Artifacts.' -ForegroundColor Green
