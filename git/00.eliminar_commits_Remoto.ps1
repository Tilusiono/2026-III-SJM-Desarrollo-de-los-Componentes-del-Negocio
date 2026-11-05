#git reset --hard HEAD~1
#git push origin main --force


$branches = git branch -r | ForEach-Object {
    $_.Trim() -replace "origin/",""
} | Where-Object {
    $_ -notmatch "HEAD"
}

foreach ($branch in $branches) {

    Write-Host "`n=== Procesando $branch ==="

    git checkout $branch

    # traer estado remoto
    git fetch origin $branch
    git reset --hard HEAD~1

    # fuerza push SOLO de esa rama
    git push origin $branch --force

    Write-Host "✔ $branch actualizado"
}

git checkout main