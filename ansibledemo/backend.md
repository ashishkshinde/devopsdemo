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
