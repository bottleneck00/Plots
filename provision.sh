apt-get update && apt-get -y upgrade

# Install psql

apt-get install -y \
  python3 \
  python3-pip \
  dos2unix

# rename python3 stuff to just python
ln -s /usr/bin/python3 /usr/bin/python
ln -s /usr/bin/pip3 /usr/bin/pip

sudo su vagrant -c "pip install --user pipenv"

# Always start in /app
echo "cd /app" >> /home/vagrant/.bashrc
