#!/usr/bin/env bash
# Author: <Ash-Ishh..>

usage() {
  echo
  echo "Usage: $0 -c CONTAINER"
  echo "Stream log of given container"
  echo
  docker ps
  echo
  echo "-h, --help              display help and exit"
  exit 2
}

# getopts stuff
unset DIRECTORY COMMAND
while getopts 'c:-help' option
do
  case $option in
    c) CONTAINER=$OPTARG ;;
    help) usage;;
  esac
done

[ -z "$CONTAINER" ] && usage

sudo tail -f /var/lib/docker/containers/`docker inspect --format="{{.Id}}" $CONTAINER`/`docker inspect --format="{{.Id}}" $CONTAINER`-json.log

