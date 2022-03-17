# Deploy Sample-App

### Deployment instructions
Use capistrano for deployments

#### Prerequisite
* EC2 Instance having user deploy (Update deploy.rb if needed)

* Setup SSH keys for SSH to EC2 on local system

* Install NodeJS, Rvm, Ruby 2.7.4, Nginx, Redis Server

* Install System Dependencies like libpq-dev & imagemagick
`sudo apt-get install libpq-dev imagemagick`)

* Give Permission to deploy user directory chmod o=rx /home/deploy

* _`sample-app`_ refers to application name, you can change it to whatever you want.

#### Configuration
* Setup Nginx on Server

* Run `cap production puma:systemd:config puma:systemd:enable` to create Puma configuration on server.

* You can find file at ``/etc/systemd/system/puma_sample-app_production.service`` if using ubuntu.

* The ExecStart should match with this for proper running of Puma ``ExecStart=/home/deploy/.rvm/bin/rvm 2.7.4 do bundle exec puma -e production -b unix:/home/deploy/apps/sample-app/shared/tmp/sockets/sample-app-puma.sock
``

* Update EC2 IP in ``config/deploy/production.rb``

* Run ``cap production deploy:initial`` if it is first deployment (Also Copy master.key and create database.yml in ``/home/deploy/apps/sample-app/shared/config/`` folder)

* Finally run ``cap production deploy``

#### Deployment Success (You can see app running at provided EC2 IP)
