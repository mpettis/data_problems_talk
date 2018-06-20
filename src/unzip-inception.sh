#!/usr/bin/env bash

# Usage:
# You supply the path the the root zipfile as the first argument to the shell script.
# After that, for each zip file, the script will:
#   Unzip the zipfile contents into a directory named the same as the zip file
#     (same directory as the zipfile).
#   Remove the zifile just unzipped.
#   Search from the root zipfile directory for more zipfiles to deal with,
#     and do the same 'unzip to same-named directory' logic just described.
#
# It ends when there are no more zipfiles to unzip.

# From command line, get the root zip file
ROOT_ZIPFILE="$1"

# Create var for root zip directory
ROOT_ZIPDIR=${ROOT_ZIPFILE%.zip}

ZIPFILE="$ROOT_ZIPFILE"
while true; do
  if [ -z "$ZIPFILE" ] ; then break; fi

  ZIPDIR="${ZIPFILE%.zip}"
  unzip -d "$ZIPDIR" "$ZIPFILE"
  rm -f "$ZIPFILE"

  IFS=$'\t\n'
  ZIPFILE=($(find "$ROOT_ZIPDIR" -name '*.zip' | head -1))
  unset $IFS
done

