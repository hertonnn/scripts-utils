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
	#verifica possíveis mudanças
	if [ -z "$(git status --porcelain)" ] 
	then
		modified="false"
	else
		modified="true"
	fi
	
	repo_name=$(basename $(git rev-parse --show-toplevel))
	
	echo "$2 - Nome: $repo_name - Modificado: $modified"
	echo ""
	
}
commit_repo(){
	repo_path=$1
	read -p "Digite a mensagem de commit para o repositório $repo_path: " commit_msg
	cd "$repo_path" && cd .. && /usr/bin/git add -A && /usr/bin/git commit -m "$commit_msg" && /usr/bin/git push
}
update_all(){
	for path in $@; do
		commit_repo $path
	done
	echo "Repositório(s) atualizado(s) com sucesso!" 
}
# CODE-------------------------------------------------------------------- #
function menuprincipal(){
clear
echo " "
repository_current="/home/herton/Documentos"
name_file=".git"



# Use o comando find para procurar as pastas
found_dir=$(find "$repository_current" -type d -name "$name_file" 2>/dev/null)

# Verifica se a pasta foi encontrada
if [ -n "$found_dir" ]; then
	echo ATUALIZAÇÃO DE REPOSITÓRIOS DO GITHUB
	echo " "
	echo Foram encontrados os seguintes repositórios git:
	num=1
	for path in $found_dir; do
		inf_repo $path $num
		((num++))
	done
	echo "Press o número do repositório para atualizá-lo, zero(0) para atualizar todos os repositórios ou menos um (-1) para sair"
	read opcao
	
	if [ $opcao -eq -1 ]; then
		echo Saindo do sistema...
		sleep 2
		exit 0
	fi
	if [ $opcao -eq 0 ]; then
		update_all $found_dir
	else
		var=1
		for repo in $found_dir; do
			if [ $var -eq $opcao ]; then 
				commit_repo $repo
				echo "Repositório(s) atualizado(s) com sucesso!" 
				break
			fi
			((var++))
		done 
	fi
	
	menuprincipal
else
  echo Pastas .git não encontradas
  echo Saindo do sistema...
  sleep 2
  exit 0
fi

}
menuprincipal
#END --------------------------------------------------------------------- #

