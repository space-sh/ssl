#
# Copyright 2016-2017 Blockie AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Disable warning about indirectly checking status code
# shellcheck disable=SC2181

#================================
# SSL_DEP_INSTALL
#
# Make sure that OpenSSL is installed.
#
# Returns:
#   0: success. Dependencies were found
#   1: failed to find dependencies
#
#================================
SSL_DEP_INSTALL()
{
    SPACE_DEP="OS_IS_INSTALLED PRINT"

    PRINT "Checking for OS dependencies." "info"

    OS_IS_INSTALLED "openssl" "openssl"

    if [ "$?" -eq 0 ]; then
        PRINT "Dependencies found." "ok"
    else
        PRINT "Failed finding dependencies." "error"
        return 1
    fi
}


# Disable warning about local keyword
# shellcheck disable=SC2039

#================================
# SSL_GENRSA
#
# Generate a new RSA private key.
#
# Parameters:
#   $1: key file path
#   $2: number of bits (optional)
#
# Returns:
#   Non-zero on error.
#
#================================
SSL_GENRSA()
{
    SPACE_SIGNATURE="keyfile:1 [bits]"
    SPACE_DEP="PRINT FILE_MKDIRP"

    local keyfile="${1}"
    shift

    local bits="${1:-2048}"
    shift $(( $# > 0 ? 1 : 0 ))

    PRINT "Generate keyfile. Key file: ${keyfile}, bits: ${bits}." "info"

    FILE_MKDIRP "$(dirname "${keyfile}")" &&
    openssl genrsa -out "${keyfile}" "${bits}"
}


# Disable warning about local keyword
# shellcheck disable=SC2039

#================================
# SSL_GENCSR
#
# Generate a new CSR.
#
# Parameters:
#   $1: key file path
#   $2: CSR file path
#
# Returns:
#   Non-zero on error.
#
#================================
SSL_GENCSR()
{
    # shellcheck disable=SC2034
    SPACE_SIGNATURE="keyfile:1 csrfile:1 [args]"
    # shellcheck disable=SC2034
    SPACE_DEP="PRINT FILE_MKDIRP"

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


# Disable warning about local keyword
# shellcheck disable=SC2039
# Disable warning about checking exit code indirectly
# shellcheck disable=SC2181

#====================
# SSL_GENSELFSIGNED
#
# Generate self signed certificate for
# development purposes.
#
# Parameters:
#   $1: SSL certificate output path
#   $2: SSL key output path
#   $3: number of bits for RSA (optional)
#   $4: number of days to be valid for (optional)
#
# Returns:
#   Non-zero on error.
#
#====================
SSL_GENSELFSIGNED()
{
    # shellcheck disable=SC2034
    SPACE_SIGNATURE="certname:1 [bits days args]"

    local certname="${1}"
    shift

    local bits="${1:-4096}"
    shift $(( $# > 0 ? 1 : 0 ))

    local days="${1:-30}"
    shift $(( $# > 0 ? 1 : 0 ))

    local args="${1:-}"
    shift $(( $# > 0 ? 1 : 0 ))

    local sslkey="${certname}.key"
    local sslcert="${certname}.crt"
    # shellcheck disable=SC2086
    openssl req -x509 -newkey "rsa:${bits}" -keyout ${sslkey} -out ${sslcert} -days "${days}" -nodes ${args}
    if [ "$?" -eq 0 ]; then
        cat ${sslkey} ${sslcert} > "${certname}.pem"
    else
        return 1
    fi
}

SSL_CERTCHECK()
{
    # shellcheck disable=SC2034
    SPACE_SIGNATURE="cert"

    local cert="${1}"
    shift

    openssl x509 -in "${cert}" -text -noout
}
