#!/usr/bin/env bash

# ------------------------------------------------------------------
# [Nick the Sick] Proxy Sish
#   Allows routing local services with ssh and a sish server
# ------------------------------------------------------------------

SUBJECT=route
VERSION=0.0.1
SISH_SERVER=example.com
SISH_PORT=22

function print_usage() {
  cat <<EOF
Usage: proxy port [subdomain] [host]
  port                       Integer number of port to forward from
  subdomain                  Optional string of subdomain to forward to (default random)
  host                       Optional string of host to forward from (default localhost)
  -h                         Displays this help
  -v                         Displays the version
EOF
}

# -----------------------------------------------------------------
while getopts ":vh" optname; do
  case "$optname" in
  "v")
    echo "Version $VERSION"
    exit 0
    ;;
  "h")
    print_usage
    exit 0
    ;;
  "?")
    echo "Unknown option $OPTARG"
    exit 0
    ;;
  ":")
    echo "No argument value for option $OPTARG"
    exit 0
    ;;
  *)
    echo "Unknown error while processing options"
    exit 0
    ;;
  esac
done

shift $(($OPTIND - 1))

port=$1
subdomain=$2
host=$3
STATUS=0

# -----------------------------------------------------------------
LOCK_FILE=/tmp/${SUBJECT}.lock

if [ -f "$LOCK_FILE" ]; then
  echo "Script is already running"
  exit
fi

# -----------------------------------------------------------------
trap "rm -f $LOCK_FILE" EXIT
touch $LOCK_FILE

case $port in
'')
  echo "Port must be supplied"
  exit 1
  ;;
*[!0-9]*)
  echo "Port must be an integer"
  exit 1
  ;;
esac

con_string="80"

if [ -z "$host" ]; then
  con_string="$con_string:localhost:$port"
else
  con_string="$con_string:$host:$port"
fi

if [ -n "$subdomain" ]; then
  con_string="$subdomain:$con_string"
fi

ssh -p $SISH_PORT -R $con_string $SISH_SERVER
