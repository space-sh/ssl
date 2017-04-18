---
modulename: SSL
title: /gencsr/
giturl: gitlab.com/space-sh/ssl
weight: 200
---
# SSL module: Generate CSR

Generates a new _Certificate Signing Request_.


## Example

```sh
$ space -m ssl /gencsr/ -- "/home/janitor/new.key" "/home/janitor/new.csr"
```

Exit status code is expected to be 0 on success.
