# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# test ground
COOLBEAN="coolbean is cool"
export COOLBEAN


# convenience functions
gt () {
    git add -A && git commit -m "$1" && git push;
}

gtt () {
    COMMIT_MESSAGE="$1"
    if ls -a | grep git;
    then
        gt "$COMMIT_MESSAGE"
    else
        echo "... floating up one directory ..."
        cd ..
        gtt "$COMMIT_MESSAGE"
        echo "... floating down one directory ..."
        cd -
    fi
}

save_dotfiles () {
    cp ~/.aliases ~/workspace/dotfiles/
    cp ~/.bash_profile ~/workspace/dotfiles/
    cp ~/.path ~/workspace/dotfiles/
    cd ~/workspace/dotfiles
    gt "$1"
    cd -
}
