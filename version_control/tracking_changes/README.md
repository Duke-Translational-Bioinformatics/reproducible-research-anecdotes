Tracking changes to code or data
-

####Introduction
-
Git is useful for creating a 'time-machine' like environment to track changes in files (text files
are handled better than binary files) over time.

A git repository is a directory on a file system with a single .git subdirectory in its first level.  The git software uses .git
to store the full state, with each changeset, over the entire history of the repository.  If you remove .git from a directory,
it is no longer a git repository, and all history is lost (this can be useful when you want to start a repository over again).
The architecture of a git repository can be conceptualized in 3 layers:

| untracked working area   |
| ------------- |
| staging area to be committed      |
| committed changes      |

####Git Workflow
When you work with a git repository, you will do one or more of the following:
  + create a git repository (git init)
  + do things to change the files in the repository
  + stage changes to the repository (git add, git rm, git mv)
  + restore unstaged changed files to their last committed state (git checkout -- file)
  + find the difference between changed files and their committed versions (git diff, git diff --staged)
  + unstage changes before they are committed (git reset HEAD file)
  + commit changes to the repository. This creates a changeset, with an ID (a SHA hash) in your repository. (git commit)
  + view the commit history for the repository, or a file within the repository (git log)
  + replace a file with a version of the file committed previously (git checkout $ID file; git add file; git commit file)

Once a changed file is staged, it can be:

  + changed again before it is comitted. This results in the file being staged in the form it was originally staged at, and unstaged in its current form
  (watch out!.  If you commit the file when it is in both an earlier staged form, and an unstaged new form, STAGED AND UNSTAGED CHANGES MAY BE COMMITTED!)
  + removed from staging

'Changes' to files can include addition, modification, and deletion.
Directories are NOT tracked in a git repository unless there is a file/directory within the directory to track. If you want to store empty directories
place a .keep file in them.

####Git Graphical Interfaces
There are many Graphical Interfaces to Git.  The "Pro Git" book has a good (list)[http://git-scm.com/download/gui/linux)
Also, many Integrated Development Environments and editors (eclipse, vim , emacs) have hooks directly to git.

####Exercises
Work through the exercises to become more fluent in the use of the git commandline
