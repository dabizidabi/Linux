#!/bin/bash
# Author: Mykola Zoshchuk
# Create date: 12/05/2021
# Description: Importing AWS IAM actual resources (GROUPS, ROLES, USERS) to local files. 
#              Names of IAM resources must be in files groups.txt, roles.txt. users.txt respectively.
# Modify: 12/05/2021

set -e

T=terraform
OUTPUT_groups=$PWD/actual_groups.tf
OUTPUT_roles=$PWD/actual_roles.tf
OUTPUT_users=$PWD/actual_users.tf

IMPUT_groups=$PWD/groups.txt #groups and their policies must be separated by ":". Example group1:policy1
IMPUT_roles=$PWD/roles.txt
IMPUT_users=$PWD/users.txt #users and theirs groups must be separated by ":". Example user1:group1:grpup2

$T init

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~GROUPS BLOCK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rm -f $PWD/sceletone.tf || echo "# importing groups" > $PWD/sceletone.tf
#IMPORT AWS GROUPS
cut -f 1 -d : $IMPUT_groups |
while read GROUP; do
cat << _EOF_ >> $PWD/sceletone.tf
resource "aws_iam_group" "$GROUP" {
    name = "$GROUP"
}
_EOF_
done

cut -f 1 -d : $IMPUT_groups |
while read GROUP; do
$T import aws_iam_group.$GROUP $GROUP
done
rm -f $PWD/sceletone.tf

#IMPORT AWS IAM GROUP POLICY
cat $IMPUT_groups |
while IFS=':' read GROUP POLICY; do
cat << _EOF_ >> $PWD/sceletone.tf
resource "aws_iam_group_policy_attachment" "$GROUP" {
}
_EOF_
done

cat $IMPUT_groups |
while IFS=':' read GROUP POLICY; do
$T import aws_iam_group_policy_attachment.$GROUP $GROUP/arn:aws:iam::aws:policy/$POLICY
done

$T show -no-color > $OUTPUT_groups
rm -f $PWD/sceletone.tf
rm -f $PWD/terraform.tfstate

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ROLES BLOCK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rm -f $PWD/sceletone.tf || echo "# importing roles" > $PWD/sceletone.tf
#IMPORT AWS IAM ROLES
cat $IMPUT_roles |
while read ROLE; do
ROLE_NAME="`echo "$ROLE" | sed -r 's/[\.\-]/_/g'`"
cat << _EOF_ >> $PWD/sceletone.tf
resource "aws_iam_role" "$ROLE_NAME" {
    name = "$ROLE"
}
_EOF_
done

cat $IMPUT_roles |
while read ROLE; do
ROLE_NAME="`echo $ROLE | sed -r 's/[\.\-]/_/g'`"
$T import aws_iam_role.$ROLE_NAME $ROLE
done

$T show -no-color > $OUTPUT_roles
rm -f $PWD/sceletone.tf
rm -f $PWD/terraform.tfstate

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~USERS BLOCK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rm -f $PWD/sceletone.tf || echo "# importing users" > $PWD/sceletone.tf
#IMPORT AWS IAM USERS
cat $IMPUT_users |
while IFS=':' read AWSUSER GROUP; do
AWSUSER_NAME="`echo "$AWSUSER" | sed -r 's/[\.\@]/_/g'`"
cat << _EOF_ >> $PWD/sceletone.tf
resource "aws_iam_user" "$AWSUSER_NAME" {
}
_EOF_
done

cat $IMPUT_users |
while IFS=':' read AWSUSER GROUP; do
AWSUSER_NAME="`echo $AWSUSER | sed -r 's/[\.\@]/_/g'`"
$T import aws_iam_user.$AWSUSER_NAME $AWSUSER
done

#IMPORT AWS IAM USER GROUP MEMBERSHIP
cat $IMPUT_users |
while IFS=':' read AWSUSER GROUP; do
AWSUSER_NAME="`echo $AWSUSER | sed -r 's/[\.\@]/_/g' | awk '{print $1}'`"
cat << _EOF_ >> $PWD/sceletone.tf
resource "aws_iam_user_group_membership" "$AWSUSER_NAME" {
}
_EOF_
done

cat $IMPUT_users |
while IFS=':' read AWSUSER GROUP1 GROUP2 GROUP3 GROUP4 GROUP5; do
AWSUSER_NAME="`echo $AWSUSER | sed -r 's/[\.\@]/_/g' | awk '{print $1}'`"
$T import aws_iam_user_group_membership.$AWSUSER_NAME $AWSUSER/$GROUP1/$GROUP2/$GROUP3/$GROUP4/$GROUP5
done

$T show -no-color > $OUTPUT_users
rm -f $PWD/sceletone.tf
rm -f $PWD/terraform.tfstate
