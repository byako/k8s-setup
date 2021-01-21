#!/bin/bash

# exit on any non-success return, also on undefined vars
set -eu

# run our app and sleep for 10 minutes
demo-payload
sleep 600
