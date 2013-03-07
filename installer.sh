#!/usr/bin/bash

if [ -d ~/.git-extensions ]; then
    pushd ~/.git-extensions
    git pull
    popd
else
    git clone https://github.com/muratayusuke/git-extensions.git ~/.git-extensions
fi

shell=`echo ${SHELL} | awk -F/ '{ print $NF }'`
if [ ${shell} = "sh" ]; then
    shell="bash"
fi

echo
echo
echo "================================"
echo " install completed"
echo "================================"
echo
echo "Please add the line to ~/.${shell}rc :"
echo
echo "    [[ -s ~/.git-extensions/scripts/init ]] && source ~/.git-extensions/scripts/init"
echo
echo "You need to run 'source ~/.${shell}rc' before you can start using git-extensions."
echo
echo "================================"
echo "After that, you can use following command:"
echo
echo "    git bk"
echo "    git ffcheck [master|develop]"
echo "    git mktopic <branch_name>"
echo "    git mkreltag <tag_name>"
echo "    git remove-remote-branch <repository> <branch_name>"
echo "    git ex version"
echo "    git ex upgrade"
echo
echo "for more infromation, check this url:"
echo "    https://github.com/muratayusuke/git-extensions"
echo
