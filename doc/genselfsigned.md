---
modulename: SSL
title: /genselfsigned/
giturl: gitlab.com/space-sh/ssl
weight: 200
---
# SSL module: Generate self-signed

Generates a new self-signed certificate.


## Example

Generate a new 4096-bit self-signed certificate valid for 365 days:
```sh
space -m ssl /gencsr/ -- "/home/janitor/new.cert" "/home/janitor/new.key" "4096" "365"
```

Exit status code is expected to be 0 on success.
