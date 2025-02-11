#!/bin/bash

# List of folders to exclude (add folder names as needed)
EXCLUDE_FOLDERS=("dify" "dify-docs")

# List of branches to pull when the repo is excluded
EXCLUDED_BRANCHES=("main" "dev" "develop")

# Iterate over all directories
for repo in */; do
    # Check if the folder should be excluded
    if [[ " ${EXCLUDE_FOLDERS[@]} " =~ " ${repo%/} " ]]; then
        echo "Skipping other branches, only pulling ${EXCLUDED_BRANCHES[*]} for folder: $repo"

        # Enter the repository folder
        cd "$repo" || { echo "Failed to enter $repo"; continue; }

        # Process only the excluded branches (main, dev, develop)
        for branch in "${EXCLUDED_BRANCHES[@]}"; do
            if git show-ref --verify --quiet "refs/remotes/origin/$branch"; then
                echo "Pulling branch: $branch"
                # Checkout remote branch and pull
                git checkout -B "$branch" origin/"$branch"
                git pull
            else
                echo "Branch $branch does not exist in $repo"
            fi
        done
        
        # After pulling, checkout the main branch to return to the main line of development
        if git show-ref --verify --quiet "refs/remotes/origin/main"; then
            echo "Switching back to the main branch"
            git checkout main || git checkout origin/main
        else
            echo "Main branch does not exist in $repo"
        fi

        # Go back to the parent directory
        cd ..
        continue
    fi

    echo "Processing repository: $repo"

    # Enter the repository folder
    cd "$repo" || { echo "Failed to enter $repo"; continue; }

    # Process all remote branches (excluding symbolic refs like HEAD)
    for branch in $(git branch -r | grep -v '\->'); do
        # Checkout and pull each branch
        git checkout -B "${branch#origin/}" origin/"${branch#origin/}"
        git pull
    done

    # After pulling all branches, checkout the main branch to return to the main line of development
    if git show-ref --verify --quiet "refs/remotes/origin/main"; then
        echo "Switching back to the main branch"
        git checkout main || git checkout origin/main
    else
        echo "Main branch does not exist in $repo"
    fi

    # Go back to the parent directory
    cd ..
done
