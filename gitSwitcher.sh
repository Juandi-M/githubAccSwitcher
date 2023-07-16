#!/bin/bash

# AuthorJuandi-M

# Script to switch between GitHub accounts using Personal Access Tokens (PATs)

# Variables
# Replace the values below with your own GitHub usernames, corresponding PATs, and email addresses
github_user1="user1"
github_pat1="your_pat1"
github_email1="email1@example.com"
github_user2="user2"
github_pat2="your_pat2"
github_email2="email2@example.com"
default_user=$(git config --global user.name)

# Function to change GitHub user
configure_git() {
    git config --global user.name "$1"
    git config --global user.email "$2"
    git config --global credential.helper 'cache --timeout=3600' # Optional: Adjust cache timeout as needed
    git config --global credential.https://github.com.username "$1"
    git config --global credential.https://github.com.password "$3"
}

# Function to validate GitHub credentials
validate_github_credentials() {
    response_code=$(curl -s -o /dev/null -w "%{http_code}" -u $1:$3 https://api.github.com/user)
    case "$response_code" in
        200)
            # 200 means the request has succeeded
            echo "Response code: $response_code (Success)"
            return 0
            ;;
        401)
            # 401 means unauthorized
            echo "Response code: $response_code (Unauthorized)"
            ;;
        403)
            # 403 means forbidden
            echo "Response code: $response_code (Forbidden)"
            ;;
        404)
            # 404 means not found
            echo "Response code: $response_code (Not Found)"
            ;;
        *)
            # Any other code can be considered as an error
            echo "Response code: $response_code (Unknown Error)"
            ;;
    esac
    return 1
}

# Main script
while true; do
    # Select GitHub user
    echo "Select an option:"
    echo "1. $github_user1"
    echo "2. $github_user2"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            if [ "$github_user1" == "$default_user" ]; then
                echo "Already using $github_user1"
                break
            elif validate_github_credentials "$github_user1" "$github_email1" "$github_pat1"; then
                configure_git "$github_user1" "$github_email1" "$github_pat1"
                echo "Switched to $github_user1"
                break
            else
                echo "Invalid GitHub credentials for $github_user1. Please check and retry."
            fi
            ;;
        2)
            if [ "$github_user2" == "$default_user" ]; then
                echo "Already using $github_user2"
                break
            elif validate_github_credentials "$github_user2" "$github_email2" "$github_pat2"; then
                configure_git "$github_user2" "$github_email2" "$github_pat2"
                echo "Switched to $github_user2"
                break
            else
                echo "Invalid GitHub credentials for $github_user2. Please check and retry."
            fi
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac
done