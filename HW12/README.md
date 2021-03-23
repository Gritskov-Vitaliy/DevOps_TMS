FileA
➜  ~ cat ~/Documents/test-hw12.json
{
  "Id": "Policy1537365823345",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1537365816157",
      "Action": [
        "s3:DeleteBucket"
      ],
      "Effect": "Deny",
      "Resource": [
        "arn:aws:s3:::test1",
        "arn:aws:s3:::backup-test*"
      ],
      "Principal": "*"
    }
  ]
}
➜  ~
Tasks:
1. Bash. Replace  "s3:DeleteBucket" with "s3:CreateBucket" in the fileA
2. Bash. Add new line "arn:aws:s3:::hw12-bucket"
 after  "arn:aws:s3:::backup-test*" in fileA
3. Create a bash script to compare 2 numbers(A and B). Use read to get variables to your script, like most of you did before :) . Output should be like A is greater than B OR A and B are equal OR A is less than B.
4. Create bash script as in point 3 but compare 3 numbers - A, B and C. Output should be the same as in the previous point, but only comparing 3 numbers with each other in pairs. 

For point 3 and 4 script should request input data until you type exit(e) instead of any number.

![Task1_2](Task1_2.PNG)