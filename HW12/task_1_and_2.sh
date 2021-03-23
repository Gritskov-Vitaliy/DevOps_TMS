#!/bin/bash

File="test-hw12.json"
Replace_old="s3:DeleteBucket"
Replace_new="s3:CreateBucket"
New_line='"arn:aws:s3:::hw12-bucket"'
Previous_line="arn:aws:s3:::backup-test*"

sed -i "s/$Replace_old/$Replace_new/g" $File
sed -i "/$Previous_line/a \ $New_line" $File