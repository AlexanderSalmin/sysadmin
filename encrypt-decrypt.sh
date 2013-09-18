#!/usr/local/bin/bash

#encrypt and decrypts a text file

# before we begin
RM_PATH="/bin/rm"
GPG_PATH="/usr/local/bin/gpg"
NANO_PATH="/usr/local/bin/nano"
UNENCRYPTED_TXT="$HOME/.____secured.txt"    # do not modify
ENCRYPTED_TXT="$HOME/.____secured.txt.gpg"  # same as unencrypted with .gpg

# check if secure file exists
if [ -e $ENCRYPTED_TXT ]; then
# decrypt file
$GPG_PATH $ENCRYPTED_TXT

 # decrypt, read and edit the file
 if [ -e $UNENCRYPTED_TXT ]; then

 # delete the old encrypted version
 $RM_PATH $ENCRYPTED_TXT

 # edit the secured text file
 $NANO_PATH $UNENCRYPTED_TXT

 # encrypt the text file
 $GPG_PATH -c $UNENCRYPTED_TXT

  # remove the unencrypted file if it exists
  if [ -e $ENCRYPTED_TXT ]; then
  $RM_PATH $UNENCRYPTED_TXT
  fi

 fi

else

 # since gpg does not exists, check if the unencrypted version exists
 if [ -e $UNENCRYPTED_TXT ]; then

 # edit the secured text file
 $NANO_PATH $UNENCRYPTED_TXT

 # encrypt the text file
 $GPG_PATH -c $UNENCRYPTED_TXT

  # remove the unencrypted file if encrypted exists
  if [ -e $ENCRYPTED_TXT ]; then
  $RM_PATH $UNENCRYPTED_TXT
  fi

 else

  # create an empty file
  touch $UNENCRYPTED_TXT

  # edit the secured text file
  $NANO_PATH $UNENCRYPTED_TXT

  # encrypt the text file
  $GPG_PATH -c $UNENCRYPTED_TXT

   # remove the unencrypted file
   if [ -e $ENCRYPTED_TXT ]; then
   $RM_PATH $UNENCRYPTED_TXT
   fi

 fi

fi


