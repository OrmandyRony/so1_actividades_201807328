#!/bin/bash

# Leer la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de GitHub: " GITHUB_USER

# Consultar la URL de la API de GitHub
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_RESPONSE=$(curl -s $API_URL)

# Obtener los valores del JSON
github_user=$(echo $JSON_RESPONSE | jq -r '.login')
id=$(echo $JSON_RESPONSE | jq -r '.id')
created_at=$(echo $JSON_RESPONSE | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at."

# Crear el directorio /tmp/<fecha> si no existe
fecha=$(date +"%Y%m%d")
log_dir="/tmp/$fecha"
mkdir -p $log_dir

# Crear el archivo de log
log_file="$log_dir/saludos.log"
echo "Hola $github_user. User ID: $id. Cuenta fue creada el: $created_at." > $log_file

echo "Mensaje guardado en: $log_file"
