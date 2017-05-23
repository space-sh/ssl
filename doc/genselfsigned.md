---
modulename: SSL
title: /genselfsigned/
giturl: gitlab.com/space-sh/ssl
editurl: /edit/master/doc/genselfsigned.md
weight: 200
---
# SSL module: Generate self-signed

Generates a new self-signed certificate.


## Example

Generate a new 4096-bit self-signed certificate valid for 365 days:
```sh
space -m ssl /gencsr/ -- "/home/janitor/new.cert" "4096" "365"
```

The above will create three files: `new.cert.key`, `new.cert.crt` and `new.cert.pem`.  

The `.pem` file is your bundled self signed cert.

Exit status code is expected to be 0 on success.
