Creating backend command line reference

**Confirm which nodejs version is required for the application to run**

1. Disable all the modules by

```shell
dnf module disable nodejs -y
```
2. Enable only the required version (in this case version 20)

```shell
dnf module enable nodejs:20 -y
```
3. Install the nodejs

```shell
dnf install nodejs -y
```

**Application Configuration**

1. User Creation only to run the application:

```shell
useradd expense
```

**As per standard, we need to keep this application in a specific directory. Create an app directory and install the application in here.**

1. Create /app directory 

```shell
mkdir /app
```
2. Download and move the application in here.

```shell
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip 
cd /app 
unzip /tmp/backend.zip
```
3. Install the dependencies required for backend app to the same folder where the app is installed.

```shell
cd /app 
npm install 
# npm manages downloads of dependencies of your project.
```

Every global application comes with a SystemD service file which is useful for any application to run as a service in the background.
Our backend app is a custom application so we need to create a SustemD file. This is also required for the systemctl to manage the custom application.

Create file by using "vim /etc/systemd/system/backend.service" and update below config in the file:

```shell
[Unit]
Description = Backend Service

[Service]
User=expense
// highlight-start
Environment=DB_HOST="<MYSQL-SERVER-IPADDRESS>"
// highlight-end
ExecStart=/bin/node /app/index.js
SyslogIdentifier=backend

[Install]
WantedBy=multi-user.target
```

For systemd to detect the newly created service "backend" we need to load the systemd service and then start the new service. 

```shell
systemctl daemon-reload
systemctl enable backend 
systemctl start backend
```
We also need to load the schema so that the application can work properly. For this we need the sql client to be installed first.

```shell
dnf install mysql -y 
mysql -h <MYSQL-SERVER-IPADDRESS> -uroot -pExpenseApp@1 < /app/schema/backend.sql 
```

