git checkout main
git fetch --prune

git branch -vv | Select-String "gone" | ForEach-Object {
    $branch = ($_ -split '\s+')[1]
    git branch -D $branch
}