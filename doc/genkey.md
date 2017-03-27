---
modulename: SSL
title: /genkey/
giturl: gitlab.com/space-sh/ssl
weight: 200
---
# SSL module: Generate key

Generates a new _RSA_ private key to be used with _CSR_.


## Example

Generate a new key:
```sh
space -m ssl /genkey/ -- "/home/janitor/new.key"
```

Generate a new 4096-bit key:
```sh
space -m ssl /genkey/ -- "/home/janitor/new.key" "4096"
```

Exit status code is expected to be 0 on success.
