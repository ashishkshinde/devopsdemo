**Install mysql db server**

```shell   
    dnf install mysql-server -y
```

**Start MySQL Service**

```shell   
    systemctl enable mysqld
    systemctl start mysqld  
```

**Change the default root password in order to start using the database service**

```shell   
    mysql_secure_installation --set-root-pass ExpenseApp@1
```