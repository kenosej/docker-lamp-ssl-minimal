## LAMP

LAMP stack configured with SSL on Apache.

Contains:  
&nbsp;&nbsp;&nbsp;&nbsp;Apache  
&nbsp;&nbsp;&nbsp;&nbsp;MySQL 5.7  
&nbsp;&nbsp;&nbsp;&nbsp;PHP 7.3  
&nbsp;&nbsp;&nbsp;&nbsp;phpMyAdmin  
&nbsp;&nbsp;&nbsp;&nbsp;Redis  

## Installation

Generate self-signed certificate for Apache (Common Name: localhost):

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt
```

Generate image data:

```bash
docker-compose build
```

Start up the containers:

```bash
docker-compose up -d
```

## Info

Made for developing Laravel application on localhost.

## Note

Change MySQL and phpMyAdmin credentials.

Currently set to:  
&nbsp;&nbsp;&nbsp;&nbsp;MySQL root password: root  
&nbsp;&nbsp;&nbsp;&nbsp;MySQL database: example  
&nbsp;&nbsp;&nbsp;&nbsp;MySQL user: example  
&nbsp;&nbsp;&nbsp;&nbsp;MySQL password: example  

Access phpMyAdmin at:  
&nbsp;&nbsp;&nbsp;&nbsp;localhost:8080

Containers run at default ports.  
If they are taken, change default ports in:  
[docker-compose.yml](docker-compose.yml)

## Licence

[MIT](LICENSE)
