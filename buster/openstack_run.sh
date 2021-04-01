#!/bin/bash 
  
# openstack server create --flavor standard.medium --security-group open --image debian-10-x86_64 --network auto_allocated_network --key-name dexter --config-drive true --user-data openstack_run.sh metadebian

if [ ! -e /METADEBIAN ]; then

set -x

passwd -d root

cat /home/debian/.ssh/authorized_keys > /root/.ssh/authorized_keys

userdel -r -f debian

apt update -qqq
apt install -yqqq git

git clone https://github.com/dexter2cz-docker/debian-workernode-docker -b devel
cp -arv debian-workernode-docker/buster/* /tmp

bash -x /tmp/create_meta_debian

#dpkg-reconfigure openssh-server

adduser --system --shell /bin/bash --group debian
usermod -a -G adm,dialout,cdrom,floppy,sudo,audio,dip,video,plugdev,netdev debian

touch /METADEBIAN

cloud-init clean

poweroff
fi
