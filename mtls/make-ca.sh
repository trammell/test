
openssl req \
  -new \
  -x509 \
  -nodes \
  -days 365 \
  -subj '/CN=juanito' \
  -keyout ca.key \
  -out ca.crt

