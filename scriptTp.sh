# !/bin/bash

# Configurar la zona horaria en Argentina

timedatectl set-timezone America/Argentina/Buenos_Aires

echo "Cambio de zona horaria: "
timedatectl
echo "-------------------------------------"

# Cambiar nombre del host

hostnamectl set-hostname bootcampwebexperto

echo "Nombre del host: "
hostnamectl

echo "-------------------------------------"

# Crear un usuario sudo webexpertosudo

usernamesudo="webexpertosudo"
passsudo="webexpsudo"
#if id "$usernamesudo" &> /dev/null; then
#	echo "El usuario $usernamesudo ya fue creado"
#else
	adduser --gecos "" --disabled-password $usernamesudo
	echo "$usernamesudo:$passsudo" | chpasswd
	usermod -aG sudo webexpertosudo
	echo "Usuario sudo $usernamesudo creado"
	echo "Contraseña de usuario sudo: $passsudo    (recuerde  cambiarla por seguridad)"
#fi
echo "-------------------------------------"


# Crear un usuario para conexion ssh

usernamessh="webexpertossh"
passssh="webexpssh"
#if id "$usernamessh" &> /dev/null; then
#	echo "El usuario $usernamessh ya fue creado"
#else
	adduser --gecos "" --disabled-password $usernamessh
	echo "$usernamessh:$passssh" | chpasswd
	echo "AllowUsers $usernamessh" >> /etc/ssh/sshd_config
	echo "Usuario ssh $usernamessh creado"
	echo "Contraseña de usuario ssh: $passssh    (recuerde cambiarla por seguridad)"
#fi
echo "-------------------------------------"


# Actualizar las dependencias

apt update && apt upgrade -y
echo "-------------------------------------"

# Validar si docker está instalado sino instalarlo

#if command -v docker &> /dev/null; then
#	echo "Docker se encuentra instalado"
#else
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
	sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	if command -v docker &> /dev/null; then
		echo "Docker instalado correctamente"
	else
		echo "Error en la instalacion de Docker"
	fi
#fi
echo "-------------------------------------"

# Validar si docker-compose está instalado sino instalarlo

#if command -v docker-compose &> /dev/null; then
#	echo "Docker-compose se encuentra instalado en el sistema"
#else
	apt-get install docker-compose-plugin
	if command -v docker-compose &> /dev/null; then
		echo "Docker-compose instalado correctamente"
	else
		echo "Error en la instalacion de docker-compose"
	fi
#fi

echo "-------------------------------------"

# Crear grupo de Docker e iniciar el servicio

groupadd docker
systemctl start docker
systemctl enable docker

echo "-------------------------------------"

# Instalar mc

apt install -y mc
#if command -v mc &> /dev/null; then
#	echo "Midnight commander instalado correctamente"
#else
#	echo "Error de instalacion de midnight commander"
#fi

echo "-------------------------------------"

# Instalar vim

apt-get install -y vim
#if command -v vim &> /dev/null; then
#	echo "Vim instalado correctamente"
#else
#	echo "Error de instalacion de vim"
#fi

echo "-------------------------------------"

# Instalar net-tools

apt install -y net-tools

#if command -v ifconfig &> /dev/null; then
#	echo "Net-tools instalado correctamente"
#else
#	echo "Error de instalacion de net-tools"
#fi

echo "-------------------------------------"

# Crear usuario nginx y agregarlo a grupo docker


usernamenginx="nginx"
passnginx="webexpnginx"
#if id "$usernamenginx" &> /dev/null; then
#	echo "El usuario $usernamenginx ya fue creado"
#else
	adduser --gecos "" --disabled-password $usernamenginx
	echo "$usernamenginx:$passnginx" | chpasswd
	echo "Usuario ssh $usernamenginx creado"
	echo "Contraseña de usuario ssh: $passnginx    (recuerde cambiarla por seguridad)"
#fi
usermod -aG docker nginx

echo "-------------------------------------"
