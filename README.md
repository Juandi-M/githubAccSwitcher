# GitHub Account Switcher 
![Placeholder Badge 1](https://img.shields.io/badge/Placeholder-Badge1-brightgreen) ![Placeholder Badge 2](https://img.shields.io/badge/Placeholder-Badge2-blue)

This script allows you to easily switch between different GitHub accounts on your local machine (Mac, Linux or Windows WSL)

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Setup](#setup)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## Features

- Allows switching between two different GitHub accounts.
- Validates your GitHub credentials using HTTP response codes.
- Prints user-friendly HTTP response messages.
- Avoids unnecessary operations if you're already logged into the desired account.

## Requirements

- Bash 4.0 or later.
- Git 2.0 or later.
- cURL.
- GitHub accounts with Personal Access Tokens.
- Give chmod permissions to the script

## Setup

1. Clone this repository.
2. Open the `account_switcher.sh` script in a text editor.
3. Replace the placeholders with your GitHub usernames, Personal Access Tokens, and email addresses:
    - `github_user1`: Your GitHub username for account 1.
    - `github_pat1`: Your Personal Access Token for account 1.
    - `github_email1`: Your email address for account 1.
    - `github_user2`: Your GitHub username for account 2.
    - `github_pat2`: Your Personal Access Token for account 2.
    - `github_email2`: Your email address for account 2.

## Usage

To run the script, use the following command in a terminal:

Permissions:
```bash
chmod +x account_switcher.sh
```

Execution
```bash
./account_switcher.sh
```

You'll be presented with options to choose between your two configured accounts. Enter your choice, and the script will switch to that account (or tell you if you're already using it).

## Troubleshooting

- If you receive a `fatal: not in a git directory` error, ensure you're running the script in a directory that's been initialized as a Git repository.
- If the script fails to validate your GitHub credentials, check the HTTP response code and message for clues about the issue.

## Contributing

We welcome contributions to this script. Please open an issue or submit a pull request on this repository to suggest changes or improvements.