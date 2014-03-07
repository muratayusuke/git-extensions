#git-extensions

This is git extensions including some useful commands.

#Install
##Mac/Linux/Windows(msysgit/cygwin)
    $ curl https://raw.github.com/muratayusuke/git-extensions/stable/installer.sh | bash -s

#Referrence
##git bk
git bk is simple backup of current branch.

    $ git branch
    * develop
      master
    $ git bk
    [SUCCESS] successfully backup current branch to 'bk_develop'
    $ git branch
      bk_develop
    * develop
      master

##git mkbr
git mkbr can create branch with following prefix.  
no option or -f : "feature/"  
-b : "bugfix/"  
-r : "release/"  
-h : "hotfix/"  
-p : "project/"

    $ git mkbr hoge
	Switched to a new branch 'feature/hoge'
	$ git mkbr -h fuga
	Switched to a new branch 'hotfix/fuga'

##git ex push
You don't need `git push --set-upstream origin feature/hoge` anymore.  
Just need `git ex push`.  
This command tries to `git push` at first, but if failed,  
tries to `git push -u origin <CURRENT BRANCH NAME>` automatically.  
Wonderful!  
Of course, if there is at least 1 argument, it runs `git push <ARGS>` as normal `git push`.

##git ex tag
This command simply make tag and push to remote.
`git ex tag hoge` is same as `git tag hoge` and `git push origin hoge`.
`git ex tag other_remote hoge` is same as `git tag hoge` and `git push other_remote hoge`.
`git ex tag -d hoge` is same as `git tag -d hoge` and `git push origin :hoge`.
`git ex tag -d other_remote hoge` is same as `git tag -d hoge` and `git push other_remote :hoge`.

##git ffcheck
git ffcheck supports fast-forward merge.  
You can check if current branch can do fast-forward merge to 'develop' and 'master' branch like this:

    $ git ffcheck
    [Warning] branch 'develop' is not exist
    [SUCCESS] you can fast-forward merge to branch 'master'

##git mktopic
git mktopic can make topic branch named by specific rule, 'feature/hoge'.  

    $ git mktopic featurename
    Switched to a new branch 'feature/featurename'
    
    $ git branch
      master
    * feature/featurename

As you see, this command is 'git checkout -b' with prefix of branch name.

##git mkreltag
git mkreltag is tag version of git mktopic. The prefix is 'rel_YYYYMMDD_hoge'.
'rel' means release. So you can make 'rel_YYYYMMDD_releasename' tag with this:

    $ git mkreltag releasename
    $ git tag
    rel_20121106_releasename

You can use this command only from 'master' branch.

##git remove-remote-branch
Do you know how to remove remote branch?  
Default command is not intuitive, so try this command:

    $ git remove-remote-branch origin branch_name

##git ex upgrade
Get latest version of git-extensions.

##git ex version
Show current version of git-extensions.
