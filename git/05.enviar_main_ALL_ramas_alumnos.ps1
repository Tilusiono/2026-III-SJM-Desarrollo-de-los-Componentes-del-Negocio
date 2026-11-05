# 1. actualizar main primero
git checkout main
git pull origin main

# 2. obtener ramas locales desde proyecto/
$branches = Get-ChildItem proyecto -Directory

foreach ($student in $branches) {

    $branch = $student.Name
    $path = "proyecto/$branch"

    Write-Host "`n============================"
    Write-Host "Sync -> $branch"
    Write-Host "============================"

    # ir a rama del alumno
    git checkout $branch
    git pull origin $branch

    # 🔥 limpiar cosas peligrosas
    git rm -r --ignore-unmatch git
    git rm -r --ignore-unmatch pages
    git rm -r --ignore-unmatch proyecto

    # 🔥 traer SOLO lo permitido desde main
    git checkout main -- $path
    git checkout main -- npm profile docs 

    # agregar SOLO lo necesario
    git add $path npm profile docs 

    # commit si hay cambios
    if (git status --porcelain) {
        git commit -m "Sincronizar branch -> $branch desde main"
        git push origin $branch
        Write-Host "✔ $branch actualizado"
    }
    else {
        Write-Host "⏭ Sin cambios en $branch"
    }
}

# volver a main
git checkout main