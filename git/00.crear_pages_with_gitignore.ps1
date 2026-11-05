git switch main
if ($LASTEXITCODE -ne 0) { throw "No se pudo cambiar a main." }

if (git status --porcelain) {
    throw "Hay cambios sin guardar. Haz commit o guárdalos antes de ejecutar el script."
}

$branches = git branch --format="%(refname:short)" |
    Where-Object { $_ -ne "main" }

foreach ($branch in $branches) {
    git switch $branch
    if ($LASTEXITCODE -ne 0) { throw "No se pudo cambiar a $branch." }

    $folder = Join-Path "pages" $branch
    $gitignore = Join-Path $folder ".gitignore"

    New-Item -ItemType Directory -Path $folder -Force | Out-Null

    if (-not (Test-Path $gitignore)) {
        Set-Content -Path $gitignore -Value "/node_modules/" -Encoding utf8
        Write-Host "Creado: $branch/$gitignore"
    }
    else {
        Write-Host "Ya existe: $branch/$gitignore"
    }
}

git switch main