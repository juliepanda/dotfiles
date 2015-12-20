# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# convenience functions
gt () {
    if [ -z "$1" ]; then
        echo "At least write a commit message, you lazy."
    else
        git add -A && git commit -m "$1" && git push
    fi
}

gtt () {
    COMMIT_MESSAGE="$1"
    if ls -a | grep git; then
        gt "$COMMIT_MESSAGE"
    else
        echo "... floating up one directory ..."
        local LOCAL_PATH="$PWD"
        cd ..
        gtt "$COMMIT_MESSAGE" "$PWD"
        echo "... floating down one directory ..."
        cd "$LOCAL_PATH"
    fi
}

save_dotfiles () {
    # bash
    cp ~/.aliases ~/workspace/dotfiles/bash/
    cp ~/.bash_profile ~/workspace/dotfiles/bash/
    cp ~/.path ~/workspace/dotfiles/bash/
    # vim
    cp ~/.vimrc ~/workspace/dotfiles/vim/
    cp ~/.vimrc.local ~/workspace/dotfiles/vim/
    cp -r ~/.vim ~/workspace/dotfiles/vim/
    # scripts
    cp -r ~/scripts ~/workspace/dotfiles/
    cd ~/workspace/dotfiles
    gt "$1"
    cd -
}

upup () {
    DEEP=$1
    [ -z "${DEEP}" ] && { DEEP=1; }
    for i in $(seq 1 ${DEEP})
        do cd ../
    done
}
