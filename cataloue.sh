curl -sL https://rpm.nodesource.com/setup_lts.x | bash
cp catalogue.service /etc/systemd/system/catalogue.service
yum install nodejs -y
useradd roboshop
mkdir /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
cd /app
unzip /tmp/catalogue.zip
npm install
cp mongo.repo /etc/yum.repos.d/mongo.repo
systemctl daemon-reload
systemctl enable catalogue
systemctl start catalogue

yum install mongodb-org-shell -y
mongo --host mogodb-dev.kalis30nov.online </app/schema/catalogue.js