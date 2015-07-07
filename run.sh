bundle exec thin --max-persistent-conns 1024 --timeout 0 -V -R config.ru start
