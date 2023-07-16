#!/bin/bash

# Script to switch between GitHub accounts using Personal Access Tokens (PATs) on MacOS

# Variables
# Replace the values below with your own GitHub usernames, corresponding PATs, and email addresses
github_user1="user1"
github_pat1="your_pat1"
github_email1="email1@example.com"
github_user2="user2"
github_pat2="your_pat2"
github_email2="email2@example.com"
default_user="user1"

# Function to change GitHub user
change_github_user() {
    # Check if the provided username is already the default user
    if [ "$1" == "$default_user" ]; then
        echo "Already using $1"
    else
        # Validate the provided username and configure Git accordingly
        if [ "$1" == "$github_user1" ]; then
            # Configure Git with the details for account 1
            git config --global user.name "$github_user1"
            git config --global user.email "$github_email1"
            git config --global credential.helper osxkeychain
            git config --global credential.https://github.com.username "$github_user1"
        elif [ "$1" == "$github_user2" ]; then
            # Configure Git with the details for account 2
            git config --global user.name "$github_user2"
            git config --global user.email "$github_email2"
            git config --global credential.helper osxkeychain
            git config --global credential.https://github.com.username "$github_user2"
        else
            # Display an error message and exit if an invalid username is provided
            echo "Invalid GitHub username: $1"
            exit 1
        fi

        echo "Switched to $1"
    fi
}

# Main script

# Select GitHub user
echo "Select an option:"
echo "1. $github_user1"
echo "2. $github_user2"
read -p "Enter your choice: " choice

case $choice in
    1)
        change_github_user "$github_user1"
        ;;
    2)
        change_github_user "$github_user2"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac