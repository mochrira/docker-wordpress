if [ ! -f index.php ]
then
    wget https://wordpress.org/latest.zip
    unzip latest.zip
    mv wordpress/* ./
    rm -rf wordpress
    rm -rf latest.zip
fi
sudo /usr/bin/supervisord -n -c /etc/supervisord.conf