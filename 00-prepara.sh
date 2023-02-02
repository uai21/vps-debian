#!/bin/bash

#verifica e cria estrutura de diretorios e arquivos.
dirs=("/opt/uai/gre.sh" "/opt/uai/firewall.sh" "/opt/uai/router.sh")

for dir in "${dirs[@]}"; do
  if [ -d "$dir" ]; then
    chmod +x "$dir"
  else
    mkdir -p "$dir"
    chmod +x "$dir"
  fi
done

# adiciona a linha para chamar os arquivos em /etc/network/interfaces
gre_sh_line="up /opt/uai/gre.sh"
firewall_sh_line="up /opt/uai/firewall.sh"
router_sh_line="up /opt/uai/router.sh"

if grep -q "$gre_sh_line" /etc/network/interfaces; then
  echo "Line already exists in /etc/network/interfaces"
else
  echo "$gre_sh_line" >> /etc/network/interfaces
fi

if grep -q "$firewall_sh_line" /etc/network/interfaces; then
  echo "Line already exists in /etc/network/interfaces"
else
  echo "$firewall_sh_line" >> /etc/network/interfaces
fi

if grep -q "$router_sh_line" /etc/network/interfaces; then
  echo "Line already exists in /etc/network/interfaces"
else
  echo "$router_sh_line" >> /etc/network/interfaces
fi

