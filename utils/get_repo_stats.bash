#!/bin/bash
#check if a repo is using python or R and had a dockerfile 
# INPUT:folder
# OUTPUT:Yes/No for Python/R/Dockerfile/Dockta's .Dockerfile

function file_exists_in_repo() {
	folder=$1
	file2search=$2
	nfiles=$(find $folder -name "$file2search"|wc -l)
	if [ "$nfiles" == "0" ];then
		echo "NO"
	else
		echo "YES"
	fi
}

all_repo_urls_file="/home/kopardevn/GitRepos/Improving-Software-FAIRness-and-Reproducibility-with-Automated-Containerization-of-GitHub-Repositori/utils/all_git_urls.txt"
repo_clone_testing_folder="/home/kopardevn/scratch/Testing"

#print header
echo -ne "REPO\tORG\tPYTHON\tR\tDockerfile\tDocktaDockerfile\n"

while read repo_url;do
	repo_name=$(echo $repo_url|awk -F"/" '{print $NF}'|sed "s/.git//g")
	repo_org=$(echo $repo_url|awk -F"/" '{print $(NF-1)}')
	subfolder=$(echo $repo_name|awk '{print tolower($0)}')
	folder="${repo_clone_testing_folder}/${subfolder}"
	#is_python=$(file_exists_in_repo $folder ".requirements.txt")
	is_python=$(file_exists_in_repo $folder "*requirements.txt")
	#is_R=$(file_exists_in_repo $folder "DESCRIPTION")
	is_R=$(file_exists_in_repo $folder "*DESCRIPTION")
	has_Dockerfile=$(file_exists_in_repo $folder "Dockerfile")
	has_dockta_Dockerfile=$(file_exists_in_repo $folder ".Dockerfile")
	echo -ne "$repo_name\t$repo_org\t$is_python\t$is_R\t$has_Dockerfile\t$has_dockta_Dockerfile\n"
#	exit
done < $all_repo_urls_file


