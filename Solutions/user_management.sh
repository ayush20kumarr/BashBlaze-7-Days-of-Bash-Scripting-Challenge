#!/bin/bash

# Help / Usage Function
#
show_help() {

        echo "Usage: $0 [OPTION]"
        echo
        echo "Options:"
        echo " -c, --create Create a new user account"
        echo "-d, --delete Deletes an existing user account"
        echo "-r, --reset  Reset password of an existing user"
        echo "-l, --list List all user accounts"
        echo "-h, --help Shows this help dialog box"
}

if [[ $# -eq 0 ]]; then
        echo " No option Provided. "
        show_help
        exit 1
fi

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
        show_help
        exit 0
fi


# Part One: Account creation
#
if [[ "$1" == "-c" || "$1" == "--create" ]]; then
	read -p "Enter a new username: " username
	read -s -p "Enter Password: " passwpord
	#echo "Create User Option Selected"
	echo

	if id "$username" &>/dev/null; then
		echo "X User '$username' already exits."
		exit 1
	fi
fi

sudo useradd "$username"
echo "$username:$password" | sudo chpasswd

echo " User '$username' Created Successfully."

# Part Two: Account Deletion
#
#
if [[ "$1" == "-d" || "$1" == "--delete" ]]; then
	read -p "Enter the username you want to delete: " username

	if [[ -z "$username" ]]; then
		echo " X username cannot be empty"
		exit 1
	fi

	if ! id "$username" &>/dev/null; then
		echo " X USer '$username' does not exit"
		exit 1
	fi

	if sudo usedel "$username"; then
		echo " User '$username' deleted successfully."
	else
		echo " X Failed to delete user '$username'."
		exit 1
	fi
fi
if [[ "$1" == "-r" || "$1" == "--reset" ]]; then

        read -p "Enter Username: " username

        if [[ -z "$username" ]]; then
                echo "Username cannot be empty. "
                exit 1
        fi

        if ! id "$username" &>/dev/null; then
                echo " Username does not exit. "
                exit 1

        fi

        read -s -p "Enter a new password: " password
        echo

        if [[ -z "$password" ]]; then
                echo "Password cannot be empyt"
                exit 1
        fi

        if echo "$username:$password" | sudo chpasswd; then
                echo " Password reset successfully for the user: '$username'. "
        else
                echo " Failed to reset password for the user: '$username'."
                exit 1
        fi
fi
if [[ "$1" == "-l" || "$1" == "--list" ]]; then
    echo "USERNAME               UID"
    echo "=========================="
    awk -F: '{ printf "%-20s %s\n", $1, $3 }' /etc/passwd
fi

