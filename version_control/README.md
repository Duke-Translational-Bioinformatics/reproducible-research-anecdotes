Integrating Version Control into your Research Analysis Routine
-

####Getting started with Git
Git is a fantastic system for tracking changes to code and data over time.  Our first lesson will focus on using the git commandline interface.
To install git, visit the [Git](http://git-scm.com) website and follow the instructions to install the version compatible with your operating system.
We will focus on the git commandline in this session for the following reasons:

+ It is the common denominator for most users on most systems
+ If you work via SSH to remote servers, it can be used without complex X forwarding protocols
+ It can be called programatically by analysis programs written in a variety of languages

####Collaborating with Others
Multiple users can collaborate on the same content using git.  This lesson will familiarize you with the way the git commandline works with remote
git repositories hosted on a variety of external systems.

####Using Git to track Data Provenance
You can potentially interweave the use of Git into an analysis pipeline to produce artifacts that are important in the demonstration of
data provenance.  Each time you run an analysis to produce output data, the output data is either created, or overwritten.  In the absence
of version control, potential changes in the output data that occur from one run to the next are lost forever.  With version control, you can
commit the results of each run of the analysis to your repository, such that they can be investigated by future collaborators.  Moreover, if
you are running complex statistical analysis that may produce different outputs with different parameters, you could even commit the parameters
used in each run in the commit log for the data.  This could be informative to you and future researchers reviewing your work.  Some researchers have
even created wrapper scripts for their analyses which automate the creation of git commits to the repository after successful (or even failed) runs.

* [Pro Git](http://git-scm.com/book)
* [Another Git Tutorial](http://nyuccl.org/pages/GitTutorial)
