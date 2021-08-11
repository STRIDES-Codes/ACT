#!/bin/bash
# use GH api to get the list of urls for all repository created by a user or org
#
# bash get_git_urls_for_org.bash > all_git_urls.txt
#

#CNTX={users|orgs};
#NAME={username|orgname}; 

function print_git_urls() {
# GH curl api is limited to unauthorized 60 calls per hour
# Hence, authorizing with my PAT
CNTX=$1
NAME=$2
for PAGE in `seq 1 10`;do
curl -u "kopardev:$PAT" "https://api.github.com/$CNTX/$NAME/repos?page=$PAGE&per_page=100" 2>/dev/null |
  grep -e 'git_url*' |
  cut -d \" -f 4
done
}

# testing with my repos 
#CNTX=users
#NAME=kopardev
#print_git_urls $CNTX $NAME

# printing STRIDES repo urls
CNTX=orgs
NAME=STRIDES-Codes
print_git_urls $CNTX $NAME 

# printing NCBI-Codeathons repo urls
CNTX=orgs
NAME=NCBI-Codeathons
print_git_urls $CNTX $NAME 


# printing NCBI-Codeathons repo urls
CNTX=orgs
NAME=NCBI-Hackathons
print_git_urls $CNTX $NAME 


