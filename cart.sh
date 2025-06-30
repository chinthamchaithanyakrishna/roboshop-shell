dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp cart.repo /etc/systemd/system/cart.service

useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip
cd /app
unzip /tmp/cart.zip
cd /app
npm install


systemctl daemon-reload
systemctl enable cart
systemctl start cart