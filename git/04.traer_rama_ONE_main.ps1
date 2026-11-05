git checkout main
git pull origin main

$branch = "bernabe-inche"
$allowedPath = "pages/$branch"

Write-Host ""
Write-Host "Procesando rama: $branch"

git fetch origin $branch

# Verifica si existe la carpeta en la rama
git ls-tree -d $branch $allowedPath | Out-Null

if ($LASTEXITCODE -ne 0) {
    Write-Host "⏭ $branch no tiene carpeta $allowedPath. Se omite."
    exit
}

# Borra la carpeta actual en main para que quede igual a la versión final del alumno
if (Test-Path $allowedPath) {
    Remove-Item $allowedPath -Recurse -Force
}

# Copia SOLO la versión final de pages/$branch desde la rama hacia main
git restore --source=$branch --worktree --staged $allowedPath

git add -A $allowedPath

$changes = git status --porcelain -- $allowedPath

if ($changes) {
    git commit -m "Actualizar versión final de $branch"
    git push origin main
    Write-Host "✔ Se copió la versión final de $allowedPath a main."
} else {
    Write-Host "⏭ $branch no tiene cambios nuevos en $allowedPath."
}

git checkout main