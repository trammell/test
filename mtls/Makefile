
usage:
	@echo "make [all|clean]"

all:
	make ca.key
	make server.key
	make server.csr
	make server.crt
	make client.key

# Create the Certificate Authority (CA)

ca.key ca.crt:
	openssl req -new -x509 -nodes -days 365 -subj '/CN=juanito' -keyout ca.key -out ca.crt
	openssl x509 -in ca.crt -text -noout


# Create server keypair (creates private key file which contains public key)

server.key:
	openssl genrsa -out server.key 2048


# Create Certificate Signing Request (CSR) (local server is going to be
# "localhost")

server.csr:
	openssl req -new -key server.key -subj '/CN=localhost' -out server.csr


# Sign server.csr, as the CA

server.crt ca.srl:
	openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key \
		-CAcreateserial -days 365 -out server.crt
	openssl x509 -in server.crt -text -noout


# Create the client key and certificate

client.key:
	openssl genrsa -out client.key 2048




