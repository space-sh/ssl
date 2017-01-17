# SSL module | [![build status](https://gitlab.com/space-sh/ssl/badges/master/build.svg)](https://gitlab.com/space-sh/ssl/commits/master)

Generates private keys and certificates.


## /gencsr/
	Create CSR

	Creates a new Certificate Signing Request.


## /genkey/
	Generate key

	Generates a private key to be used with CSR.


## /genselfsigned/
	Create self-signed certificate

	Creates a new self-signed certificate and key


# Functions 

## SSL\_DEP\_INSTALL ()  
  
  
  
Make sure that OpenSSL is installed.  
  
### Returns:  
- 0: success. Dependencies were found  
- 1: failed to find dependencies  
  
  
  
## SSL\_GENRSA ()  
  
  
  
Generate a new RSA private key.  
  
### Parameters:  
- $1: key file path  
- $2: number of bits (optional)  
  
### Returns:  
- Non-zero on error.  
  
  
  
## SSL\_GENCSR ()  
  
  
  
Generate a new CSR.  
  
### Parameters:  
- $1: key file path  
- $2: CSR file path  
  
### Returns:  
- Non-zero on error.  
  
  
  
## SSL\_GENSELFSIGNED ()  
  
  
  
Generate self signed certificate for  
development purposes.  
  
### Parameters:  
- $1: SSL certificate output path  
- $2: SSL key output path  
- $3: number of bits for RSA (optional)  
- $4: number of days to be valid for (optional)  
  
### Returns:  
- Non-zero on error.  
  
  
  
