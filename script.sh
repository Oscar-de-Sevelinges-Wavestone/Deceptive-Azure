#!/bin/bash

# Création du script az-logger.sh
# echo "#!/bin/bash" >> /etc/az-logger.sh
# echo "commande=\"\$*\"" >> /etc/az-logger.sh
# echo "output=\$(az \"\$@\" 2>&1)" >> /etc/az-logger.sh
# echo "if [[ \$output == *\"Code: AuthorizationFailed\"*  ]]; then" >> /etc/az-logger.sh
# echo "        echo \"\$commande\" | logger -t az" >> /etc/az-logger.sh
# echo "        echo \"\$output\" | logger -t az" >> /etc/az-logger.sh
# echo "fi" >> /etc/az-logger.sh
# echo "echo \"\$output\"" >> /etc/az-logger.sh
# chmod +x /etc/az-logger.sh

# Modification du fichier /etc/bash.bashrc
# echo "alias az=\"/etc/az-logger.sh\"" >> /etc/bash.bashrc
# source /etc/bash.bashrc

# Installation du CLI Azure sur la VM
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Création du script ssh-logger.sh
# echo "#!/bin/bash" >> /etc/ssh-logger.sh
# echo "commande=\"\$*\"" >> /etc/ssh-logger.sh
# echo "echo \"\$commande\" | logger -t ssh" >> /etc/ssh-logger.sh
# chmod +x /etc/ssh-logger.sh

# Modification du fichier /etc/bash.bashrc
# echo "alias ssh=\"/etc/ssh-logger.sh\"" >> /etc/bash.bashrc
echo "export HISTCONTROL=ignoredups:erasedups" >> /etc/bash.bashrc
echo "shopt -s histappend" >> /etc/bash.bashrc
echo "export PROMPT_COMMAND=\"history -a; \$PROMPT_COMMAND\"" >> /etc/bash.bashrc
# echo "export PROMPT_COMMAND='RETRN_VAL=\$?;logger -p local6.debug \"\$(who am i) [\$\$]: \$(history 1 | sed \"s/^[ ]*[0-9]\+[ ]*//\" ) [\$RETRN_VAL]\"'" >> /etc/bash.bashrc
source /etc/bash.bashrc
