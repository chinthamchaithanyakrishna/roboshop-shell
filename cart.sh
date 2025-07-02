dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp cart.service /etc/systemd/system/cart.service

useradd roboshop
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
npm install


systemctl daemon-reload
systemctl enable cart
systemctl start cart