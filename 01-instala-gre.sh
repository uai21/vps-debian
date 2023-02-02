#!/bin/bash

# Verifica se o pacote iproute2 já está instalado
if dpkg -s iproute2 &>/dev/null; then
  echo "Pacote iproute2 já está instalado."
else
  echo "Instalando pacote iproute2..."
  sudo apt-get update
  sudo apt-get install iproute2
fi

# Verifica se o módulo GRE já está carregado
if lsmod | grep -q ip_gre; then
  echo "Módulo ip_gre já está carregado."
else
  echo "Carregando módulo ip_gre..."
  sudo modprobe ip_gre
fi

# Verifica se a linha ip_gre já está no arquivo de configuração do kernel
if grep -q "ip_gre" /etc/modules; then
  echo "Linha ip_gre já está no arquivo de configuração do kernel."
else
  echo "Adicionando linha ip_gre ao arquivo de configuração do kernel..."
  echo "ip_gre" | sudo tee -a /etc/modules >/dev/null
fi

echo "Módulo ip_gre está pronto para ser usado."
