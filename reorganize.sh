#!/usr/bin/env bash
set -euo pipefail

# Usage:
# 1) git clone git@github.com:octaleadsprivatelimited-cloud/Famous-Pestcontrol.git
# 2) cd Famous-Pestcontrol
# 3) chmod +x reorganize.sh
# 4) ./reorganize.sh
#
# This script creates (or switches to) branch reorganize/folder-structure,
# creates directories, and git-moves common files into the new structure if they exist.
# REVIEW the changes (git status / git diff) before committing and pushing.

BRANCH="reorganize/folder-structure"
echo "Switching to branch ${BRANCH} (creating if missing)..."
if git show-ref --verify --quiet "refs/heads/${BRANCH}"; then
  git checkout "${BRANCH}"
else
  git checkout -b "${BRANCH}"
fi

# Create directories
mkdir -p client/public client/src server/src config scripts docs tests assets

# Helper: move a file or directory with git mv if it exists
gmove() {
  src="$1"
  dst="$2"
  if [ -e "$src" ]; then
    echo "Moving $src -> $dst"
    mkdir -p "$(dirname "$dst")"
    git mv -k "$src" "$dst"
  else
    echo "Skipping $src (not found)"
  fi
}

# Heuristic moves - adjust to your repo structure if needed
# Frontend heuristics
gmove "index.html" "client/public/index.html"
gmove "favicon.ico" "client/public/favicon.ico"
gmove "public" "client/public"
gmove "dist" "client/dist" # build output — usually should be in .gitignore instead of committed
gmove "build" "client/build"
gmove "frontend" "client"
# If there is already a 'client' folder at root, the move will be skipped/harmless

# Backend heuristics
gmove "server.js" "server/src/server.js"
gmove "app.js" "server/src/app.js"
gmove "api" "server/src/api"
gmove "backend" "server"

# package.json placement heuristic
if [ -f "package.json" ]; then
  if [ -d "src" ] || [ -d "public" ] || [ -f "index.html" ]; then
    gmove "package.json" "client/package.json"
    gmove "package-lock.json" "client/package-lock.json"
    gmove "yarn.lock" "client/yarn.lock"
  else
    gmove "package.json" "server/package.json"
    gmove "package-lock.json" "server/package-lock.json"
    gmove "yarn.lock" "server/yarn.lock"
  fi
fi

# Common configuration files
gmove "docker-compose.yml" "config/docker-compose.yml"
# If you have multiple Dockerfiles, move/rename appropriately
if [ -f "Dockerfile" ]; then
  # prefer server/Dockerfile but keep a copy if needed
  git mv -k Dockerfile server/Dockerfile || true
fi
gmove "nginx.conf" "config/nginx.conf"
gmove ".env" "server/.env" || true
gmove ".env.example" "server/.env.example" || true

# Docs, scripts, tests, assets
gmove "README.md" "README.md" # skip if already in correct place
gmove "docs" "docs"
gmove "script" "scripts"
gmove "scripts" "scripts"
gmove "test" "tests"
gmove "tests" "tests"
gmove "images" "assets/images"
gmove "assets" "assets"

# Add .gitignore if missing (we don't overwrite existing .gitignore)
if [ ! -f ".gitignore" ]; then
  cat > .gitignore <<'EOF'
# Node
node_modules/
dist/
build/
.env

# Python
__pycache__/
*.pyc

# Misc
.DS_Store
.vscode/
.idea/
EOF
  git add .gitignore
  echo "Added .gitignore"
else
  echo ".gitignore already exists; not modifying it."
fi

echo ""
echo "Review the repository state now:"
git status --short
echo ""
echo "If all looks good run:"
echo "  git add -A"
echo "  git commit -m \"Reorganize repository folder structure\""
echo "  git push -u origin ${BRANCH}"
echo "Then open a PR (e.g. using GitHub UI or 'gh pr create')."

# End of script
