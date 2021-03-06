#!/bin/bash

## point to variable file for ipv4 and domain.com
source <(grep '^ .*='  /opt/appdata/plexguide/var.sh)
echo $ipv4
echo $domain


clear

while [ 1 ]
do
CHOICE=$(
whiptail --title "Program Categories" --menu "Make your choice" 12 25 5 \
    "1)" "Lidarr"   \
    "2)" "Medusa"   \
    "3)" "Sonarr"   \
    "4)" "Radarr"   \
    "5)" "Exit  "  3>&2 2>&1 1>&3
)

result=$(whoami)
case $CHOICE in
    "1)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags lidarr
    echo "Lidarr: http://$ipv4:8686"
    echo "For Subdomain http://lidarr.$domain"
    echo "For Domain http://$domain:8686"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
     ;;

    "2)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags medusa
    echo "MEDUSA: http://$ipv4:8081"
    echo "For Subdomain http://medusa.$domain"
    echo "For Domain http://$domain:8081"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
    ;;

  "3)")
   ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags sonarr
   echo "Sonarr: http://$ipv4:8989"
   echo "For Subdomain http://sonarr.$domain"
   echo "For Domain http://$domain:8989"
   echo ""
   read -n 1 -s -r -p "Press any key to continue "
   ;;

    "4)")
    ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags radarr
    echo "Radarr: http://$ipv4:7878"
    echo "For Subdomain http://radarr.$domain"
    echo "For Domain http://$domain:7878"
    echo ""
    read -n 1 -s -r -p "Press any key to continue "
     ;;

     "5)")
      clear
      exit 0
      ;;
esac
done
exit
