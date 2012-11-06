#!/usr/bin/bash

if [ -d ~/.git-extensions ]; then
    rm -rf ~/.git-extensions
fi
git clone git@github.com:muratayusuke/git-extensions.git ~/.git-extensions
chmod 755 ~/.git-extensions/bin/*
chmod 755 ~/.git-extensions/scripts//*
shell=`echo ${SHELL} | awk -F/ '{ print $NF }'`

echo
echo
echo "================================"
echo " install completed"
echo "================================"
echo
echo "Please add the line to ~/.${shell}rc :"
echo
echo "\t[[ -s ~/.git-extensions/scripts/init ]] && source ~/.git-extensions/scripts/init"
echo
echo "You need to run 'source ~/.${shell}rc' before you can start using git-extensions."
echo
echo "================================"
echo "After that, you can use following command:"
echo
echo "\tgit ffcheck [master|develop]"
echo "\tgit mktopic name"
echo "\tgit mkreltag name"
echo
echo "for more infromation, check this url:"
echo "\thttps://github.com/muratayusuke/git-extensions"
echo
