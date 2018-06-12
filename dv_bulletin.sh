#!/bin/bash

if [[ $1 =~ ^[1-2]{1}[0-9]{3}-[0-9]{2}$ ]]; then
  yyyy=$(echo $1 | awk -F "-" '{print $1}')
  year=$yyyy
  mm=$(echo $1 | awk -F "-" '{print $2}')
  if [ $mm -eq '01' ]; then
    month='january'
  elif [ $mm -eq '02' ]; then
    month='february'
  elif [ $mm -eq '03' ]; then
    month='march'
  elif [ $mm -eq '04' ]; then
    month='april'
  elif [ $mm -eq '05' ]; then
    month='may'
  elif [ $mm -eq '06' ]; then
    month='june'
  elif [ $mm -eq '07' ]; then
    month='july'
  elif [ $mm -eq '08' ]; then
    month='august'
  elif [ $mm -eq '09' ]; then
    month='september'
    year=$(($yyyy + 1))
  elif [ $mm -eq '10' ]; then
    month='october'
	year=$(($yyyy + 1))
  elif [ $mm -eq '11' ]; then
    month='november'
	year=$(($yyyy + 1))
  elif [ $mm -eq '12' ]; then
    month='december'
	year=$(($yyyy + 1))
  fi
  url="https://travel.state.gov/content/travel/en/legal/visa-law0/visa-bulletin/${year}/visa-bulletin-for-${month}-${yyyy}.html"
  echo "URL to check:" $url
  http_status=$(curl -I -s ${url} | grep HTTP |  awk '{print $2}')
  echo $http_status
  while [  $http_status -eq 404 ]; do
    http_status=$(curl -I -s ${url} | grep HTTP |  awk '{print $2}')
    echo "Not released yet. Please wait. New check in 60 seconds..."
    sleep 60
  done
  echo "It's here!!!"
  date
  echo -e "\a"
  sleep 1
  echo "It's here!!!"
  echo -e "\a"
  sleep 1
  echo "It's here!!!"
  echo -e "\a"
  sleep 1
  echo "It's here!!!"
  echo -e "\a"
  sleep 1
  echo "It's here!!!"
  echo -e "\a"
  sleep 2
  echo "It's here!!!"
  echo -e "\a"
  sleep 2
  echo -e "\a"
  sleep 10
  echo -e "\a"
else
  echo "[ERROR] Usage: include year and month in YYYY-MM format."
  echo "e.g.:" $0 "2018-07"
  exit 1
fi
