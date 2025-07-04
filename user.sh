dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

cp user.service /etc/systemd/system/user.service

useradd roboshop
rm -rf /app
mkdir /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip
cd /app
unzip /tmp/user.zip

npm install


systemctl daemon-reload
systemctl enable user
systemctl start user