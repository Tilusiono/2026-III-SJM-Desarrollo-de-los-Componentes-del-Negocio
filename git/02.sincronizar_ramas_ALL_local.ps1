git checkout main
git fetch --all --prune


git branch -r | Where-Object {$_ -notmatch "HEAD"} | ForEach-Object {
    $branch = $_.Trim() -replace "origin/",""
    if (-not (git branch --list $branch)) {
        git checkout -b $branch origin/$branch
    }
}


git branch --format="%(refname:short)" | ForEach-Object {
    git checkout $_
    git pull
}
git checkout main