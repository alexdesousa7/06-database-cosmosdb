# Setup CosmosDB 

# Sign in
```
az login
```

# Generate ssh key
```
ssh-keygen -t rsa -b 4096 -f mykey
```
# Run Terraform init
```
terraform init
```

# Run Terraform apply
```
terraform apply
```

# Ssh into virtual machine
The output of terraform shows the public ip

```
ssh demo@PUBLIC_IP_HERE-i mykey
```

# Add mongodb repository and install mongodb client

```
wget -qO - https://www.mongodb.org/static/pgp/server-3.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org-shell
```

# Connect to mongodb database
*The output of terraform shows the connect string

```
mongo URL:PORT -u USERNAME -p PASSWORDHERE --ssl --sslAllowInvalidCertificates
mongo https://training-cosmos-db-qdmy5.documents.azure.com:443/ -u USERNAME -p PASSWORDHERE --ssl --sslAllowInvalidCertificates
mongo training-cosmos-db-qdmy5.documents.azure.com:10255 -u training-cosmos-db-qdmy5 -p ir1CY20GHXXRQlSXvK7ezZ4HLj3pTl5M3nLSdXpKq3JYDlkGWXmpXAw0YPh9Zvfs5XfcU0dCEt0qxgx2PyKVXw== --ssl --sslAllowInvalidCertificates
```

# Cleanup Demo
```
terraform destroy
```
