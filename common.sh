APP_PREREQ(){
    cp ${component}.service /etc/systemd/system/${component}.service
    useradd roboshop
    rm -rf /app
    mkdir /app
    curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip
    cd /app
    unzip /tmp/${component}.zip
}

SYSTEMD(){
    systemctl daemon-reload
    systemctl enable ${component}
    systemctl start ${component}
}

NODEJS() {
  dnf module disable nodejs -y
  dnf module enable nodejs:20 -y
  dnf install nodejs -y

  APP_PREREQ
  npm install

  SYSTEMD
}

PYTHON(){
  dnf install python3 gcc python3-devel -y

  APP_PREREQ
  pip3 install -r requirements.txt

  SYSTEMD
}

MAVEN(){
  dnf install maven -y

  APP_PREREQ
  mvn clean package
  mv target/${component}-1.0.jar ${component}.jar

  SYSTEMD
}