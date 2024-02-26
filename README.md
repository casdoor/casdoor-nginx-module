# casdoor-nginx-module

## Necessary configuration
### Build nginx 
git clone nginx source code

cd to NGINX source directory & run this:


```
.configure --add-module=/path/to/casdoor-nginx-module
make 
make install 
```

check nginx code 
Check if there is an `"ngx_http_casdoor_module"` module in the `../nginx-1.xx/objs/ngx_modules.c` 
### Build casdoor
```git clone https://github.com/casdoor/casdoor```

According to official documentation [casdoor](https://casdoor.org/zh/docs/deployment/nginx/)
#### build front end && back-end program 
```
yarn install && yarn run build
go run main.go
```
### Configure 
`vim /path/to/nginx/nginx.conf`

Then, add a server:
```
server {
    listen 80;
    server_name YOUR_DOMAIN_NAME;
    location / {
        proxy_set_header    Host            $http_host;
        proxy_set_header    X-Real-IP       $remote_addr;
        proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_redirect      off;
        proxy_pass http://127.0.0.1:8000;
    }
}
```
Custom configuration directives:

**casdoor_bind:**   Set the local address of the upstream binding.

**casdoor_connect_timeout:** Set the timeout for connecting to the upstream server.

**casdoor_send_timeout:** Set the timeout for sending requests to the upstream server.

**casdoor_buffer_size:**  Set the buffer size for receiving responses from the upstream server.

**casdoor_read_timeout:** Set the timeout for reading the upstream server response.

**casdoor_db:** Set the database name.

**casdoor_table:** Set the table name.

**casdoor_appid:** Set application ID.

**casdoor_secret:** Set application secret.

**casdoor_expires_in:** Set the token expiration time.

**casdoor_token:** used for request token processing.

**casdoor_check:** used to check the processing of tokens.

### demo
``` server {
    listen 8080;
    server_name YOUR_DOMAIN_NAME;

    location /api/ {
        casdoor_bind $scheme://$host;
        casdoor_connect_timeout 3000;  # 3 秒
        casdoor_send_timeout 3000;     # 3 秒
        casdoor_buffer_size 1024;      # 1 KB
        casdoor_read_timeout 3000;     # 3 秒
        casdoor_db "your_database_name";
        casdoor_table "your_table_name";
        casdoor_appid "your_appid";
        casdoor_secret "your_secret";
        casdoor_expires_in 3600;       # 1 小时
        casdoor_token;
        casdoor_check;
        proxy_pass http://127.0.0.1:8000;
    }
}
```


## Test
Visit` http://YOUR_DOMAIN_NAME `in your favorite browser.
 
## Dependencies
[nginx](https://nginx.org/)

[casdoor](https://github.com/casdoor/casdoor)

