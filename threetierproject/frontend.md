Creating frontend command line reference

# Install web server nginx & dnf is a package manager for rhel.

**shell commands**
1. To install nginx '`dnf install nginx -y`'
2. To enable nginx '`systemctl enable nginx`'
3. To start nginx '`systemctl start nginx`'

Try to access web server to confirm installation by using public IP of the aws instance where the server is installed.
Make sure the SG allows or opened port for the HTTP communication.

# Install actual app frontend content.

1. Remove default content of nginx
    `rm -rf /usr/share/nginx/html/*`
2. Download the content to temp folder and install it to html folder from where the default contect was deleted.
    `curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip`
    
    `cd /usr/share/nginx/html`
    `unzip /tmp/frontend.zip`

Check if new content of the app is being displayed.

# Create Nginx reverse Proxy configuration so that frontend can redirect requests towards backend server. For this need to create a conf file with given code :

`vim /etc/nginx/default.d/expense.conf`

**Code to update**

nginx configuration title=/etc/nginx/default.d/expense.conf 
proxy_http_version 1.1;

location /api/ { proxy_pass http://localhost:8080/; } 

location /health {
  stub_status on;
  access_log off;
}

> [localhost is the backend server private ip]

# Post reverse proxy config, restart Nginx so that the changes can be applied.

`systemctl restart nginx`