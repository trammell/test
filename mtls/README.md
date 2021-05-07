
https://codeburst.io/mutual-tls-authentication-mtls-de-mystified-11fa2a52e9cf


## Create the Certificate Authority (CA)

```
# respect my authority! :-D
openssl req \
  -new \
  -x509 \
  -nodes \
  -days 365 \
  -subj '/CN=authority' \
  -keyout ca.key \
  -out ca.crt
```

Creates:

- ca.key: private key
- ca.crt: public key, wrapped in a self-signed X.509 certificate


```
# view the certificate details
openssl x509 -in ca.crt -text -noout
```

## Create the webserver key and certificate

### Create keypair


```
# creates private key file which contains public key
openssl genrsa -out server.key 2048
```


### Create Certificate Signing Request (CSR)

```
# creates server.csr
openssl req \
  -new \
  -key server.key \
  -subj '/CN=localhost' \
  -out server.csr
```

### Sign the CSR, as the CA

```
# creates server.crt
openssl x509 \
  -req \
  -in server.csr \
  -CA ca.crt \
  -CAkey ca.key \
  -CAcreateserial \
  -days 365 \
  -out server.crt
```

* server.crt is a signed server certificate.
* option -CAcreateserial creates file `ca.srl` which persists a serial number
  for the CA that allows each cert to have a unique serial number.


```
# see gory details
openssl x509 -in server.crt -text -noout
```


## Create the client key and certificate

Traditional one-way TLS (client is not identified at transport layer; client is
identified at application layer via e.g. password)

Next step is to identify the client.


openssl genrsa -out client.key 2048








