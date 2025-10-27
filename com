git init — make repo locally.

git clone <repo-url> — copy from GitHub.

git status — see file changes.

git add . — stage all files.

git commit -m "message" — save changes locally.

git branch / git checkout -b feature — make or switch branch.

git pull origin main — get remote changes.

git push origin <branch> — send local changes to GitHub.

git remote add origin <url> — link local repo to GitHub (first time).

git log --oneline — view commit history.
