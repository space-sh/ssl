---
modulename: SSL
title: /certcheck/
giturl: gitlab.com/space-sh/ssl
editurl: /edit/master/doc/certcheck.md
weight: 200
---
# SSL module: Check certificate

Retrieves information about an existing certificate, such as expiration date and signing details.


## Example

Read details about a given certificate:
```sh
space -m ssl /certcheck/ -- "/home/janitor/certificate.pem"
```

Exit status code is expected to be 0 on success.
