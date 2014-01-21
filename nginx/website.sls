include:
  - nginx

/etc/nginx/sites-enabled/default:
  file.managed:
    - source: salt://nginx/src/default.conf

