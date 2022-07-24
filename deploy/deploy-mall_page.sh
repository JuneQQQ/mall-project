rm -rf mall-backstage-page
git clone git@e.coding.net:myteam-p/mall-project/mall-backstage-page.git
rm -rf /opt/nginx/html/*
cp  -r mall-backstage-page/dist/* /opt/nginx/html