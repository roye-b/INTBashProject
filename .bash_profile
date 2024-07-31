# .bash_profile

# Get the username
USER_NAME=$(whoami)

# Greet the user
echo "Hello $USER_NAME, welcome!"
#creates env variable and export it

export COURSE_ID="REPO_NAME"
# Source the .bashrc file if it exists
if [ -f "$HOME/.token" ]; then
    if [ $(stat -c "%a" "$HOME/.token") -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

umask 0027

export PATH=$PATH:$HOME/usercommands

date -u +"%Y-%m-%dT%H:%M:%S%z"

alias ltxt='ls *.txt'

if [ ! - d "$HOME/tmp" ]; then
    mkdir "$HOME/tmp"
else
    rm -rf "$HOME/tmp/*"
fi
if [ lsof -i :8080 >/dev/null 2>&1 ]; then
    kill -9 $(lsof -t -i :8080)
fi

