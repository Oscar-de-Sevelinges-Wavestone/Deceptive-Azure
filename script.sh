#!/bin/bash

# Création du script az-logger.sh
echo "#!/bin/bash" >> /home/azureuser/az-logger.sh
echo "commande="$*"" >> /home/azureuser/az-logger.sh
echo "output=$(az "$@" 2>&1)" >> /home/azureuser/az-logger.sh
echo "if [[ $output == *"Code: AuthorizationFailed"*  ]]; then" >> /home/azureuser/az-logger.sh
echo "        echo "$commande" | logger -t az" >> /home/azureuser/az-logger.sh
echo "        echo "$output" | logger -t az" >> /home/azureuser/az-logger.sh
echo "fi" >> /home/azureuser/az-logger.sh
echo "echo "$output"" >> /home/azureuser/az-logger.sh
chmod +x /home/azureuser/az-logger.sh

# Modification du fichier /etc/bash.bashrc
echo "alias az="/home/azureuser/az-logger.sh"" >> /etc/bash.bashrc
source /etc/bash.bashrc
