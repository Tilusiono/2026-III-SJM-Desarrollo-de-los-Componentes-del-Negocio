$branch = "bernabe-inche"
$path = "pages/$branch"

Write-Host "Sync main -> $branch (CONTROLADO)"

# 1. actualizar main
git checkout main
git pull origin main

# 2. ir a rama alumno
git checkout $branch
git pull origin $branch

# 3. LIMPIAR TODO lo peligroso primero
git rm -r --ignore-unmatch git
git rm -r --ignore-unmatch pages

# 4. TRAER SOLO lo permitido (NO usar ".")
git checkout main -- $path
git checkout main -- npm profile demo docs

# 5. agregar SOLO lo necesario
git add $path npm profile demo docs

# 6. commit
if (git status --porcelain) {
    git commit -m "Sincronizar branch -> $branch desde main"
    git push origin $branch
    Write-Host "✔ $branch actualizado"
}
else {
    Write-Host "⏭ Sin cambios en $branch"
}

# 7. volver a main
git checkout main