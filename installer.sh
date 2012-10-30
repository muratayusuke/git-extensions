mkdir -p ~/.git-extensions/bin
install -v -m 0755 ./bin/* ~/.git-extensions/bin/
mkdir ~/.git-extensions/lib
install -v -m 0755 ./lib/* ~/.git-extensions/lib/
shell=`echo ${SHELL} | awk -F/ '{ print $NF }'`

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
