#!/bin/bash --login
echo "pulling and Checkout API tag"
echo "--------------------------------------------"
git fetch --tags jenkins@10.44.0.51:/var/lib/jenkins/workspace/2024-EMR-Pipeline-APK/BHT-EMR-API -f
git checkout v5.3.0-beta -f
git describe > HEAD
echo "____________________________________________"
echo "ruby setup"
echo "____________________________________________"
rvm use ruby-3.2.0
echo "____________________________________________"
echo "Installing Local Gems"
echo "____________________________________________"
bundle install --local
echo "--------------------------------------------"
rm -rf /var/www/BHT-EMR-API/db/migrate/20190527130805_create_uuid_remaps.rb
echo "running bin_update art"
echo "____________________________________________"
./bin/update_art_metadata.sh development
echo "____________________________________________"
