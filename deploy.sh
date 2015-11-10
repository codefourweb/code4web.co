#!/bin/bash

bundle exec middleman build

# brew install awscli
# More details
# aws --profile=luk3 uses the profile luk3 in the ~/.aws/config.
# sync command only syncs the changes since the last upload.
# build/ is the target directory where the static HTML files live.
# s3://luk3thomas.com/ is my bucket.
# --acl=public-read makes the files viewable by everyone. See the manual for other options.
# --delete deleles any files from S3 that are not found in the build/ directory.
# --cache-control="max-age=0, no-cache" sets the cache expiration. I don't want the browser caching my static pages.
# --exclude "*" exludes all files. The exclude option is used in conjunction with the --include option "*.html".
# --include "*.html" includes all the HTML files.

aws s3 sync --profile=code4web build/ s3://code4web.com.br/ --acl=public-read --delete --cache-control="max-age=1576800000" --exclude "*.html"
aws s3 sync --profile=code4web build/ s3://code4web.com.br/ --acl=public-read --delete --cache-control="max-age=0, no-cache" --exclude "*" --include "*.html"

