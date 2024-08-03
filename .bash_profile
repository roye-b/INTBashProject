# .bash_profile

# Get the username
myuser=$(whoami)

# Greet the user
echo "Hello $myuser, welcome!"

# creates env variable and export it
export COURSE_ID="__REPO_NAME__"

# Check permissions of .token file if it exists
if [ -f "$HOME/.token" ]; then
    if [ $(stat -c "%a" "$HOME/.token") -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

# Set default file creation permissions
umask 006

# Update PATH to include usercommands directory
export PATH=$PATH:$HOME/usercommands

# Display current UTC date and time
date -u +"%Y-%m-%dT%H:%M:%S%z"

# Define an alias for listing .txt files
alias ltxt='ls *.txt'

# Check if tmp directory exists, create if not
if [ ! -d "$HOME/tmp" ]; then
    mkdir "$HOME/tmp"
else
    rm -rf "$HOME/tmp/*"
fi

# Kill process using port 8080 if it exists
if lsof -i :8080 >/dev/null 2>&1; then
    kill -9 $(lsof -t -i :8080)
fi
