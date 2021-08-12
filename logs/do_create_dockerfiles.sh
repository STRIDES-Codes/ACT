#!/bin/bash

# USAGE: ./do_create_dockerfiles.sh

# Change directory to logs
cd "$(dirname "${BASH_SOURCE[0]}")"

# Create a tmp directory
# for cloning git repositories
mkdir -p "tmp/logs/"



echo -e "github_uri\trepo_name\tcreate_dockerfile_exit_code" > create_dockerfiles.log

while read repo; do 
    # Get name of the repository
    name=$(echo "$repo" | awk -F '/' '{print $NF}' | sed 's/.git$//')
    # Run ACT to create dockerfile
    # Get exitcode of command
    exitcode=$(../agct \
                    build \
                    --repo-url "${repo}" \
                    --img-name "${name}" \
                    --output "tmp" \
                    --skip-build \
                2> "tmp/logs/${name}.create_dockerfile.log" 1>&2; \
                echo $?);  
    # Print Github Repo, Repository name, 
    # and exit code of dockerfile creation 
    echo -e "${repo}\t${name}\t${exitcode}"
done < ../utils/all_git_urls.txt >> create_dockerfiles.log
