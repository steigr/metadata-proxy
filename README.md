# metadata-proxy
Metadata Proxy Server for CoreOS

## Build

git clone https://github.com/steigr/metadata-proxy.git
cd metadata-proxy
docker build -t metadata-proxy .

## Prepare host

ip addr add 169.254.169.254/16 dev eth0

## Prepare DNS (optional)

Add _metadata-service._tcp to your DNS domain pointing to your Metadata-server. (If port is 443 https is assumed).

## Run the proxy

### Method 1: correct dns domainname on host

Check if the domainname is set correctly (`hostname -f`).

`docker run --rm --net=host metadata-proxy`

### Method 2: wrong/unspecified dns domainname:

`docker run --rm --net=host -e DNS_DOMAIN=example.com metadata-proxy`

### Method 3: specify url manually

`docker run --rm --net=host -e METADATA_SERVER=https://metadata.example.com metadata-proxy`

## Usage:

Each node with a link-local address may reach the metadata-proxy under http://169.254.169.254:80/

Add a unique identifier as file-name ( e.g. http://169.254.169.254:80/node1 ). The request will then be forwarded to
$METADATA_SERVER_URL/machines/$UNIQUE_NODE_IDENTIFIER/user_data.yaml.



