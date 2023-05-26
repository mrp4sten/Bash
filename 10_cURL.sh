#!/bin/bash
# author: mrp4sten

# Set the URL to send the GET request to
url="https://api.example.com/data"

# Set any optional headers if needed
headers=(
  "Content-Type: application/json"
  "Authorization: Bearer <your_token>"
)

# Perform the GET request using cURL
response=$(curl -s -X GET -H "${headers[@]}" "$url")

# Check the HTTP status code
http_status=$(curl -s -o /dev/null -w "%{http_code}" -X GET -H "${headers[@]}" "$url")

if [[ $http_status -eq 200 ]]; then
  echo "Request successful!"
  echo "Response body:"
  echo "$response"
else
  echo "Request failed with HTTP status code: $http_status"
fi
