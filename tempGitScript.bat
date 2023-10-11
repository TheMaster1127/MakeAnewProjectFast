cd C:\Users\The_M\OneDrive\Desktop\GitHub Projects\MakeAnewProjectFast
git init

git branch -m main

git add .

git commit -m "Initial commit"

git branch -m master main



set GITHUB_TOKEN=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

hub create
hub create

git config --global user.name "TheMaster1127"
git config --global user.email "Dzemilefere@gmail.com"

git remote add origin https://github.com/TheMaster1127/MakeAnewProjectFast.git

git clone https://github.com/TheMaster1127/MakeAnewProjectFast.git


hub api -X PATCH -H "Authorization: token $GITHUB_TOKEN" -F ""This is a new project called MakeAnewProjectFast"" /repos/TheMaster1127/MakeAnewProjectFast

