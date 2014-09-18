Integrating Version Control into your Research Analysis Routine
-

+ Tracking changes to code or data

Git is useful for creating a 'time-machine' like environment to track changes in files (text files
are handled better than binary files) over time.

A git repository is a directory on a file system with a single .git subdirectory in its first level.  The git software uses .git
to store the full state, with each changeset, over the entire history of the repository.  If you remove .git from a directory,
it is no longer a git repository, and all history is lost (this can be useful when you want to start a repository over again).
The architecture of a git repository can be conceptualized in 3 layers:

| ------------- |
| col 3 is      |
| col 2 is      |
| zebra stripes |


The basic workflow involves:

  + create a git repository
  + do things to change the files in the repository
  + stage changes to the repository
  + commit changes to the repository
  + view the commit history for the repository, or a file within the repository
  + replace a file with a version of the file committed previously

Once a changed file is staged, it can be:

  + changed again before it is comitted. This results in the file being staged in the form it was originally staged at, and unstaged in its current form
  + removed from staging

'Changes' to files can include addition, modification, and deletion.
Directories are NOT actually tracked in a git repository unless there is a file within the directory to track. If you want to store empty directories
place a .keep file in them.

+ Sharing and Collaborating with Others

* (Git)[http://git-scm.com]
* (Git Documentation)[http://git-scm.com/book]
