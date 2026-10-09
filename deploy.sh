#!/bin/bash

echo "🎂 Birthday Surprise Website - Quick Deploy Script"
echo "=================================================="
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "❌ Git not initialized. Initializing now..."
    git init
    git add .
    git commit -m "Initial commit: Birthday surprise website"
fi

# Check if remote is set
if ! git remote get-url origin > /dev/null 2>&1; then
    echo ""
    echo "📝 Please enter your GitHub repository details:"
    echo ""
    read -p "GitHub Username: " username
    read -p "Repository Name: " reponame
    
    git remote add origin "https://github.com/$username/$reponame.git"
    echo "✅ Remote added!"
fi

# Rename branch to main if needed
current_branch=$(git branch --show-current)
if [ "$current_branch" != "main" ]; then
    echo "🔄 Renaming branch to 'main'..."
    git branch -M main
fi

# Push to GitHub
echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Done! Your code is now on GitHub!"
echo ""
echo "📋 Next steps:"
echo "1. Go to: https://github.com/YOUR-USERNAME/YOUR-REPO"
echo "2. Click 'Settings' → 'Pages'"
echo "3. Select 'main' branch as source"
echo "4. Wait 1-2 minutes"
echo "5. Your site will be live at: https://YOUR-USERNAME.github.io/YOUR-REPO/"
echo ""
echo "🎉 Happy Birthday! 💕"
