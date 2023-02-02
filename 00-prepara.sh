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

