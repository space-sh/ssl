clone os file

#================================
# SSL_DEP_INSTALL
#
# Make sure that OpenSSL is installed.
#
#================================
SSL_DEP_INSTALL ()
{
    SPACE_CMDDEP="OS_IS_INSTALLED PRINT"

    PRINT "Checking for OS dependencies." "info"

    OS_IS_INSTALLED "openssl" "openssl"

    if [ "$?" -eq 0 ]; then
        PRINT "Dependencies found." "success"
    else
        PRINT "Failed finding dependencies." "error"
        return 1
    fi
}

#================================
# SSL_GENRSA
#
#================================
SSL_GENRSA ()
{
    SPACE_SIGNATURE="keyfile bits"
    SPACE_CMDDEP="PRINT FILE_MKDIRP"

    local keyfile="${1}"
    shift

    local bits="${1:-2048}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Generate keyfile. Key file: ${keyfile}, bits: ${bits}." "info"

    FILE_MKDIRP "$(dirname "${keyfile}")" &&
    openssl genrsa -out "${keyfile}" "${bits}"
}

#================================
# SSL_GENCSR
#
#================================
SSL_GENCSR ()
{
    # shellcheck disable=SC2034
    SPACE_SIGNATURE="keyfile csrfile [args]"
    # shellcheck disable=SC2034
    SPACE_CMDDEP="PRINT FILE_MKDIRP"

    local keyfile="${1}"
    shift

    local csrfile="${1}"
    shift

    local args="${1-}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Generate keyfile. Key file: ${keyfile}, CSR file: ${csrfile}." "info"

    FILE_MKDIRP "$(dirname "${keyfile}")" &&

    # shellcheck disable=SC2086
    openssl req -new -sha256 -key "${keyfile}" -out "${csrfile}" ${args}
}

#====================
#
# Generate self signed certificate for
# development purposes.
#
#====================
SSL_GENSELFSIGNED ()
{
    # TODO
    local sslcert=$1
    shift

    local sslkey=$1
    shift

    #openssl req -x509 -newkey rsa:2048 -keyout ${sslkey} -out ${sslcert} -days 33 -nodes

}
