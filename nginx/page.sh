#!/bin/sh

cat <<EOF > $1.html
<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>$1</title>
  <meta name="description" content="New Index Page">
  <meta name="author" content="Mybuntu">
  <!-- <link rel="stylesheet" href="css/styles.css?v=1.0"> -->
</head>
<body>
	<h1>$1</h1>
	<p>A new page ... </p>
</body>
</html>
EOF

cat <<EOF > $1.conf
server {
	listen 80;
	listen [::]:80;

	root /var/www/$1;
	index index.html index.htm index.nginx-debian.html;

	server_name $1 www.$1;
	
	location / {
		try_files \$uri \$uri/ =404;
	}
}
EOF
