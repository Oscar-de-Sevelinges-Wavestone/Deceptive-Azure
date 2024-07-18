#!/bin/bash

# Création du script az-logger.sh
echo "#!/bin/bash" >> /etc/az-logger.sh
echo "commande="$*"" >> /etc/az-logger.sh
echo "output=$(az "$@" 2>&1)" >> /etc/az-logger.sh
echo "if [[ $output == *"Code: AuthorizationFailed"*  ]]; then" >> /etc/az-logger.sh
echo "        echo "$commande" | logger -t az" >> /etc/az-logger.sh
echo "        echo "$output" | logger -t az" >> /etc/az-logger.sh
echo "fi" >> /etc/az-logger.sh
echo "echo "$output"" >> /etc/az-logger.sh
chmod +x /etc/az-logger.sh

# Modification du fichier /etc/bash.bashrc
echo "alias az="/etc/az-logger.sh"" >> /etc/bash.bashrc
source /etc/bash.bashrc
