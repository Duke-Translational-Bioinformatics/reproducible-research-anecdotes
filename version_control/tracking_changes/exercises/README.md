* initialize a new git repository within a directory called git_test
* change into the git_test and create a git_subdir subdirectory.  Does git know about your change?
* touch git_subdir/.keep.  What does git know about it now?
* use git status to find out what next possible steps are available to you in your repository.
* add git_subdir/.keep
* commit git_subdir/.keep
* create a file called README.md in the git_test directory.  Put some content in to it.  What is the status of this file in the repo?
* git add README.md.  What is the status of this file in the repo now?
* use git status to find out what options are available to you now?
* Unstage README.md without removing the file itself.
* add README.md
* commit README.md with its commit description provided on the commandline so that it does not launch an editor
* echo "log/*" > .gitignore
* create a log directory in git_test
* echo "log information" > git_test/log/logfile.log
* what is the status of your repository
* add and commit .gitignore
* echo "*.foo" > git_subdir/.gitignore
* git add git_subdir/.gitignore
* git commit -m 'more ignores'
* echo "foo" > git_subdir/some.foo
* what is the status of your repository?
* edit and make a change to README.md
* git diff README.md
* git add README.md
* git diff README.md
* git diff --staged README.md (older versions of git use --cached)
* edit it again, and make a change
* git status
* git diff README.md
* git diff --staged README.md
* git add README.md
* git diff README.md
* git diff --staged README.md
* commit README.md
* rm README.md
* use git status to find out what options you have
* restore the file from your repository
* find the ID (SHA Hash) of the initial_commit of README.md using git log
* git checkout $ID README.md
* what is the status of README.md in your repository.  Can it be diffed? Revert it back to its most current status in the repository?
* git rm README.md
* what is the status of README.md?  Revert it back to its most current status in the repository?
* git rm README.md
* git commit with a message that it is not needed
* get that file back and commit it again (you may find git log -p helpful here), you were not supposed to delete it!? Look at the log history of README.md

