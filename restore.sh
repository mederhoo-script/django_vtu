#!/bin/bash

# Database setup
if ! sudo mysql -e "USE vtu_db;" 2>/dev/null; then
	    sudo mysql -e "CREATE DATABASE vtu_db;"
	        sudo mysql -e "CREATE USER 'medersub'@'localhost' IDENTIFIED BY 'meder87hoodb';"
		    sudo mysql -e "GRANT ALL PRIVILEGES ON vtu_db.* TO 'medersub'@'localhost';"
		        sudo mysql -e "FLUSH PRIVILEGES;"
			    echo "Database and user created."
		    else
			        echo "Database 'vtu_db' already exists. Skipping creation."
fi

# Import backup
sudo mysql -u medersub -pmeder87hoodb vtu_db < my_database_backup.sql

# Python dependencies
pip3 install -r requirements.txt  # Ensure you have requirements.txt in your repo

# Django setup (update settings as needed)
# Configure your settings.py with:
# - Database credentials
# - Secret key
# - Allowed hosts
# - Other environment-specific settings

# Run migrations
python3 manage.py migrate
python3 manage.py collectstatic --noinput

# Gunicorn setup
sudo pip3 install gunicorn

echo "[Unit]
Description=gunicorn socket
After=network.target

[Socket]
ListenStream=/run/gunicorn.sock

[Install]
WantedBy=sockets.target" | sudo tee /etc/systemd/system/gunicorn.socket

echo "[Unit]
Description=gunicorn daemon
Requires=gunicorn.socket
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/django_vtu
ExecStart=/usr/local/bin/gunicorn --access-logfile - --workers 3 --bind unix:/run/gunicorn.sock vtu_django.wsgi:application

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/gunicorn.service

sudo systemctl start gunicorn.socket
sudo systemctl enable gunicorn.socket

# Nginx setup
if [ ! -f /etc/nginx/sites-enabled/django_vtu ]; then
	    echo "server {
	            listen 80;
		            server_name medersub.com.ng;

			            location = /favicon.ico {
				                access_log off;
						            log_not_found off;
							            }

							            location /static/ {
								                root /home/ubuntu/django_vtu;
										        }

										        location / {
											            include proxy_params;
												                proxy_pass http://unix:/run/gunicorn.sock;
														        }
														    }" | sudo tee /etc/nginx/sites-available/django_vtu > /dev/null

													        sudo ln -s /etc/nginx/sites-available/django_vtu /etc/nginx/sites-enabled/
														    echo "Nginx configuration file created and linked."
													    else
														        echo "Nginx configuration file already exists. Skipping creation."
fi

sudo nginx -t
sudo systemctl restart nginx

# Firewall setup
sudo ufw allow 'Nginx Full'
sudo ufw allow ssh
sudo ufw enable

echo "Setup complete! Visit your server IP/domain to verify"
