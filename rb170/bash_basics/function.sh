#!/usr/bin/bash

greeting () {
  echo Hello $1
}

greeting 'Peter' # outputs 'Hello Peter'

greeting () {
  echo "Hello $1"
  echo "Hello $2"
}

greeting 'Peter' 'Paul' 
