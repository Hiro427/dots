#!/bin/bash

# Function to check if repos are clean or dirty
function check_repos {
  # REPOS_FILE="$REPO_FPATH"  # Replace with the path to your repos file

  for line in $(cat "$REPO_FPATH"); do
    cd "$line" || continue
    if [[ -n "$(git status -s)" ]]; then 
        echo "  Clean "
      return
    fi
  done 
  echo "  Dirty "
}

# Run the function
check_repos

