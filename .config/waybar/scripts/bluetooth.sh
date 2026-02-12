#!/bin/bash

POWERED=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')
CONNECTED=$(bluetoothctl info | grep "Name:" | cut -d' ' -f2-)

if [[ "$POWERED" != "yes" ]]; then
  echo ""
  exit 0
fi

if [[ -n "$CONNECTED" ]]; then
  echo " $CONNECTED"
else
  echo ""
fi
