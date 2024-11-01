#!/bin/bash
echo "------------------------------------------"
echo "     SSH Key Pair Generation Script       "
echo "------------------------------------------"
read -p "Enter the desired key name (without extension): " KEY_NAME
KEY_DIR="$HOME/.ssh"  
mkdir -p "$KEY_DIR"
ssh-keygen -t rsa -b 4096 -f "$KEY_DIR/$KEY_NAME" -N ""
PRIVATE_KEY_PATH="$KEY_DIR/$KEY_NAME"
PUBLIC_KEY_PATH="$KEY_DIR/$KEY_NAME.pub"

echo "------------------------------------------"
echo " SSH Key Pair Created Successfully!      "
echo "------------------------------------------"
echo "Private Key Location: $PRIVATE_KEY_PATH"
echo "Public Key Location:  $PUBLIC_KEY_PATH"
echo ""
echo "Public Key Content:"
echo "------------------------------------------"
cat "$PUBLIC_KEY_PATH"
echo "------------------------------------------"
echo To access: "ssh -i {$PRIVATE_KEY_PATH} ec2-user@("{REPLACE!}paste the public ip address of the ec2 displayed after running the opentofu config")"