##################
# Bash functions #
##################

# Toggle foldingathome.service status.
#

fah () {
    systemctl status foldingathome > /dev/null
    if [ $? == 0 ]; then
      echo "Stopping F@H"
      sudo systemctl stop foldingathome
    else
      echo "Starting F@H"
      sudo systemctl start foldingathome
    fi
}



# Enable / disable nginx websites.
#

ngensite () {
    sudo ln -s /etc/nginx/sites-available/"$1" /etc/nginx/sites-enabled/"$1"
    sudo systemctl reload nginx
}

ngdissite () {
    sudo rm /etc/nginx/sites-enabled/"$1"
    sudo systemctl reload nginx
}



