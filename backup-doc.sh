#!/usr/bin/env bash
# -------------------------------------------------#
#
# Script Name: backup-doc.sh
# Description: backup of my documents
# Written by:  Herton Silveira
# Maintenance: Herton Silveira
# -------------------------------------------------#
# VARIABLES ---------------------------------------#

# Diretório do backup
backup_path="/home/herton/Documentos"

# Diretório destino do backup
external_storage="/run/user/1000/gvfs/google-drive:host=gmail.com,user=hertonsilva44/0ABmPl3nXfM6IUk9PVA/1AYysO84ZQXhQrVECZrPpMDm8XqVoU9Lo"

# Formato do arquivo
date_format=$(date "+%d-%m-%Y")
# Compactando com tar e comprimindo com o gz
final_archive="backup-$date_format.tar.gz"

# Aonde os arquivos de Log serão armazenados
log_file="/home/herton/Documentos/PROGRAMAÇÃO/scripts-utils/logs_backups/daily_logs.log"

if [ ! -d "$external_storage" ]; then
	printf "[$date_format] THERE IS NOT PATH in: $external_storage CHECK IT.\n" >> $log_file
	exit 1
fi

# CODE ---------------------------------------------#
# c - create
# z - compressão com gz
# S - backup de espaços não vazios
# p - preservar permissões
# f - arquivo final
if tar -czSpf "$external_storage/$final_archive" "$backup_path"; then
	printf "[$date_format] BACKUP SUCESS.\n" >> $log_file
else
	printf "[$date_format] BACKUP ERROR.\n" >> $log_file

# excluir backups com mais de 10 dias
find $external_storage -mtime +10 -delete
