sudo yum install httpd wget unzip vim -y
systemctl start httpd
systemctl enabled httpd
mkdir -p /tmp/clean
cd /tmp/clean
wget https://www.tooplate.com/zip-templates/2132_clean_work.zip
unzip -o 2132_clean_work.zip
cp -r 2132_clean_work/* /var/www/html
systemctl restart httpd
cd /tmp/
rm -f /tmp/clean