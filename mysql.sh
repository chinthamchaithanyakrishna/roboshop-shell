if [ -z "$1" ]; then
  echo Input Password is missing
  exit 1
fi

dnf install mysql-server -y
systemctl enable mysqld
systemctl start mysqld
mysql_secure_installation --set-root-pass RoboShop@1