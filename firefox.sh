#!/bin/bash

# Remove o Firefox via Snap
echo "Removendo o Firefox via Snap..."
sudo snap remove --purge firefox

# Remove o Firefox via apt
echo "Removendo o Firefox via apt..."
sudo apt remove firefox -y

# Adiciona o repositório PPA do Mozilla Team
echo "Adicionando o repositório PPA do Mozilla Team..."
sudo add-apt-repository ppa:mozillateam/ppa -y

# Cria e adiciona as configurações de prioridade do Firefox no PPA
echo "Configurando a prioridade do Firefox no PPA..."
echo 'Package: firefox*
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
Package: firefox*
Pin: release o=Ubuntu
Pin-Priority: -1' | sudo tee /etc/apt/preferences.d/mozillateamppa

# Configura atualizações automáticas
echo "Configurando atualizações automáticas..."
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

# Atualiza os repositórios
echo "Atualizando os repositórios..."
sudo apt update

# Instala o Firefox
echo "Instalando o Firefox..."
sudo apt install firefox -y

# Concluído
echo "Instalação do Firefox concluída."

# Fim do script
