#! /bin/bash

# NOTE: Users of this docker container must volume mount the directory containing
# packages they wish to make public to this location.
cd /packages_to_import

# Import all deb packages into the repository.
for deb in *.deb; do
    reprepro -b /opt/debian includedeb bionic "$deb"
done

# TODO This is probably not needed.
ln -s /opt/debian /usr/share/nginx/html/apt

# Start serving files!
service nginx start

# Keep the container running.
sleep 2147483647d
