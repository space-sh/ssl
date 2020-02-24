# SSL module | [![build status](https://gitlab.com/space-sh/ssl/badges/master/pipeline.svg)](https://gitlab.com/space-sh/ssl/commits/master)

Generate private keys, certificate signing requests and
self signed certificates.



## /certcheck/
	Check a given certificate

	Checks if a given certificate is valid
	and returns information about it,
	including signing details and expiration date.
	


## /gencsr/
	Create a Certificate Signing Request (CSR) to be signed by a CA

	Creates a new Certificate Signing Request.
	Upload the request to the CA to have it signed,
	then bundle that certificate with your private key
	to get your final certificate.
	


## /genkey/
	Generate a private key

	Generates a private key to be used with a CSR.
	


## /genselfsigned/
	Create self-signed certificate

	Creates a new self-signed certificate and key.
	Self signed certificates are useful for development purposes
	but not for production use.
	


# Functions 

## SSL\_DEP\_INSTALL()  
  
  
  
Make sure that OpenSSL is installed.  
  
### Returns:  
- 0: success. Dependencies were found  
- 1: failed to find dependencies  
  
  
  
## SSL\_GENRSA()  
  
  
  
Generate a new RSA private key.  
  
### Parameters:  
- $1: key file path  
- $2: number of bits (optional)  
  
### Returns:  
- Non-zero on error.  
  
  
  
## SSL\_GENCSR()  
  
  
  
Generate a new CSR.  
  
### Parameters:  
- $1: key file path  
- $2: CSR file path  
  
### Returns:  
- Non-zero on error.  
  
  
  
## SSL\_GENSELFSIGNED()  
  
  
  
Generate self signed certificate for  
development purposes.  
  
### Parameters:  
- $1: SSL certificate output path  
- $2: SSL key output path  
- $3: number of bits for RSA (optional)  
- $4: number of days to be valid for (optional)  
  
### Returns:  
- Non-zero on error.  
  
  
  
