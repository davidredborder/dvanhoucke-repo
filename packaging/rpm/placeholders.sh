#!/bin/bash

# list of files where we need to replace placeholders
files=("resources/username.repo")

f_usage() {
  echo "usage: $0 -u USERNAME -v VERSION -b BUILDNUMBER -r REPO_URL -l USER_REPO_URL -p PRODUCT_VERSION"
  exit 0
}

while getopts "hu:v:b:r:l:p:" opt; do
  case $opt in
      u) username="$OPTARG"
          ;;
      v) version="$OPTARG"
          ;;
      b) buildnumber="$OPTARG"
          ;;
      r) repo_url="$OPTARG"
          ;;
      l) user_repo_url="$OPTARG"
          ;;
      p) product_version="$OPTARG"
          ;;
      *) f_usage
          ;;
  esac
done

if [ -z "$username" ] || [ -z "$version" ] || [ -z "$buildnumber" ] || [ -z "$repo_url" ] || [ -z "$user_repo_url" || [ -z "$product_version" ]; then
    f_usage
fi

for file in "${files[@]}"; do
    sed -i "s|{{USERNAME}}|$username|g" $file
    sed -i "s|{{VERSION}}|$version|g" $file
    sed -i "s|{{REPO_URL}}|$repo_url|g" $file
    sed -i "s|{{USER_REPO_URL}}|$user_repo_url|g" $file
    sed -i "s|{{BUILDNUMBER}}|$buildnumber|g" $file
    sed -i "s|{{PRODUCT_VERSION}}|$product_version|g" $file
done