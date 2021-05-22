apt-get update && apt-get -y upgrade

# Install psql
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
apt-get update
apt-get install -y \
  postgresql-13 \
  postgresql-client-13 \
  python3 \
  python3-pip \
  dos2unix

# Make accessible from host
echo "host    all         all         0.0.0.0/0             trust" >> /etc/postgresql/13/main/pg_hba.conf
echo "listen_addresses = '*'" >> /etc/postgresql/13/main/postgresql.conf
service postgresql restart

# Create Role and login
su postgres -c "psql -w -c \"CREATE ROLE vagrant SUPERUSER LOGIN PASSWORD 'vagrant'\" && createdb vagrant"

# rename python3 stuff to just python
ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip

sudo su vagrant -c "pip install --user pipenv"

# Always start in /app
echo "cd /app" >> /home/vagrant/.bashrc
