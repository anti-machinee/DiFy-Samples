for repo in */; do
    echo "Processing repository: $repo"
    
    cd "$repo" || { echo "Failed to enter $repo"; continue; }
    
    for branch in $(git branch -r | grep -v '\->'); do
        git checkout --track ${branch#origin/} || git checkout ${branch#origin/};
        git pull;
    done
    
    cd ..
done
