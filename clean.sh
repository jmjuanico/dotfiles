#!/bin/bash
############################
# .make.sh
# Get branches to delete
############################

exclude_branches="master|staging|release|backup"
all_branches=$(git branch -vv | cut -c 3- | awk '{print $1}')
target_branches=$(echo ${all_branches} | grep -Ev ${exclude_branches})
echo ${target_branches}


