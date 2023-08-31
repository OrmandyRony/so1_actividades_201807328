# Crear un servicio systemd para imprimir un saludo y la fecha actual

Este es un ejemplo de cómo crear un servicio systemd en Linux para ejecutar un script que imprime un saludo y la fecha actual en el registro del sistema.

## Requisitos

Asegúrate de tener instalado systemd en tu sistema Linux. La mayoría de las distribuciones modernas ya lo tienen preinstalado.

## Pasos

### Paso 1: Crear un script

Crea un script que contenga el comando para imprimir el saludo y la fecha actual. Por ejemplo, crea un archivo llamado `saludo.sh` con el siguiente contenido:

``` bash
#!/bin/bash
echo "Hola, ¡hoy es \$(date +%Y-%m-%d)! Saludos desde systemd."
```

Luego
``` bash
chmod +x saludo.sh

### Paso 2: Crear el archivo de unidad systemd
Crea un archivo de unidad systemd llamado saludo.service. Puedes utilizar tu editor de texto favorito para crearlo

``` bash
sudo nano /etc/systemd/system/saludo.service
```
Agrega el siguiente contenido al archivo saludo.service:

``` bash
[Unit]
Description=Servicio de saludo y fecha

[Service]
ExecStart=/ruta/del/script/saludo.sh   # Reemplaza /ruta/del/script/ con la ruta completa al script
StandardOutput=journal

[Install]
WantedBy=multi-user.target
```

Asegúrate de reemplazar /ruta/del/script/ con la ruta completa al directorio donde se encuentra el script saludo.sh.

### Paso 3: Recarga systemd
Recarga los servicios systemd para que tome en cuenta el nuevo servicio que has creado:

sudo systemctl daemon-reload
### Paso 4: Habilita y ejecuta el servicio
Habilita el servicio para que se inicie automáticamente al arrancar el sistema:

``` bash
sudo systemctl enable saludo.service
```
Luego, puedes iniciar el servicio:
``` bash
sudo systemctl start saludo.service
```

### Paso 5: Ver la salida del servicio
Puedes ver la salida del servicio en el registro utilizando el siguiente comando:

``` bash
sudo journalctl -u saludo.service
```
### Paso 6: Detener el servicio (opcional)
Si deseas detener el servicio en cualquier momento, utiliza el siguiente comando:
``` bash
sudo systemctl stop saludo.service
```
