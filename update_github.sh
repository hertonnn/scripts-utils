#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Script Name:   update-github.sh
# Descripition:  Automate updating my repositories that are on my local machine
# Written by:    Herton Silveira
# Maintenance:   Herton Silveira
# FUNCTIONS -------------------------------------------------------------- #
inf_repo(){
	cd "$path"
	cd ..
	#verify possible updates
	if [ -z "$(git status --porcelain)" ] 
	then
		modified="false"
	else
		modified="true"
	fi
	
	repo_name=$(basename $(git rev-parse --show-toplevel))
	
	echo "$2 - Name: $repo_name - Modified: $modified"
	echo ""
	
}
commit_repo(){
	repo_path=$1
	read -p "Enter the mensage for this commit $repo_path: " commit_msg
	cd "$repo_path" && cd .. && /usr/bin/git add -A && /usr/bin/git commit -m "$commit_msg" && /usr/bin/git push
}
update_all(){
	for path in $@; do
		commit_repo $path
	done
	echo "Reposity modified successfully!" 
}
# CODE-------------------------------------------------------------------- #
function menu(){
clear
echo " "
repository_current="/home/herton/Documentos"
name_file=".git"



# Use the "find" command to search the folder 
found_dir=$(find "$repository_current" -type d -name "$name_file" 2>/dev/null)

# Check if the folder was found
if [ -n "$found_dir" ]; then
	echo UPDATE GITHUB REPOSITORIES!
	echo " "
	echo Found github repositories
	num=1
	for path in $found_dir; do
		inf_repo $path $num
		((num++))
	done
	echo "Enter the repository number to update, zero to update all repositories, or -1 to exit"
	read option
	
	if [ $option -eq -1 ]; then
		echo Exiting the system...
		sleep 2
		exit 0
	fi
	if [ $option -eq 0 ]; then
		update_all $found_dir
	else
		var=1
		for repo in $found_dir; do
			if [ $var -eq $option ]; then 
				commit_repo $repo
				echo "Repositories updated successfully!" 
				break
			fi
			((var++))
		done 
	fi
	
	menu
else
  echo Do not found the git folders or No git folders found
  echo Exiting the system...
  sleep 2
  exit 0
fi

}
menu
#END --------------------------------------------------------------------- #

