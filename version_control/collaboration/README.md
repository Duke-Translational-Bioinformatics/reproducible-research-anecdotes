Collaborating with others using Distributed Source Control
-

####Introduction
Git makes it easy for users to collaborate on shared source using a variety of different possible patterns:

+ several users working with the same central git repository to collaborate on development of its content
+ one user serving as a steward for an 'official' repository and one or more 'development' forks for other users to directly
collaborate within.  Other users must collaborate in their specific development fork until they are ready to ask the steward to
review and accept the changes they have made.  A variation of this pattern uses branches instead of forks.
+ one user forking another user's repository, making changes, and then requesting that the other user merge their changes
into their own repository

All of these patterns are based on different ways of utilizing the following git client interactions:

+ Configuring one of your local git repositories to know about one or more 'remote' git repositories (git remote add)
These remote repositories can be on the same filesystem, or accessible over the network using ssh or http(s)
+ cloning/forking a remote repository to a repository that you own and control (git clone).  Note, for network accessible
remote repositories, git automatically sets up the git remotes in the cloned repository)
+ pulling committed changesets from a remote repository into your repository (git pull)
+ merging pulled changesets into your repository, with the possibility of committing them, or restoring to your version (git commit)
+ fixing conflicts between your code and merged changesets in various ways (git mergetool, git checkout --mine file or git checkout --theirs file)
+ pushing your committed changesets to a remote repository (git push)
+ submitting a patch or pull request to a remote repository owner to allow them to review and apply your changes at their discretion
+ finding out how your local code differs from the remote (git fetch $remotename; git diff master $remotename/master)

####Remote Git Repository Hosting Services
There are several prominent git repository hosting services available to users.  Most of them allow users to host and share repositories
for free, up to certain limits in size, or number of different repositories.  Some will incentivize the creation of publicly available repositories
over private repositories. Most allow external users to interact with the users repositories
for free without limits.  Here is a list with some notes about them:

| Hosting Service        | Notes           |
| ------------- |:-------------|
| [Github](http://github.com) |  <ul><li>Largest worldwide network of git repositories</li><li>Free accounts</li><li>Account holders can create an unlimited number of free publicly accessible repositories</li><li>Subscription required to host private repositories</li><li>Public repositories can still control which users can modify content in the repository</li><li>All repositories can have an unlimited number of collaborators for free</li><li>Endorsed by members of the research reproducibility community(1,2)</li><li>Has many 'social' features that can be used to enhance your online web presence</li><li>Has a fantastic online user interface</li></ul> |
| [Bitbucket](https://bitbucket.org) | <ul><li>Supports both git and mercurial repositories</li><li>Free accounts</li><li>Account holders can host an unlimited number of public or private repositories</li><li>Up to 5 collaborators can collaborate within a repository for free, subscription required for more collaborators</li><li>Not used within the research reproducibility community</li></ul> |
| [Duke Gitorious](https://gitorious.oit.duke.edu) |  <ul><li>Accounts only available to Duke Faculty, Staff, and Students</li><li>Public repositories are available (cloning/pulling/browsing) to any user on the internet</li><li>Account required to host repositories and projects, and collaborate (push) within repositories</li><li>Not used within the research reproducibility community</li></ul> |

(1) [Amanda Mascarelli, Nature 507,523-525 (2014)](http://www.nature.com/naturejobs/science/articles/10.1038/nj7493-523a)
(2) Christopher Gandrud, 'Reproducible Research with R and RStudio' Chapman and Hall/CRC (July 15, 2013) [amazon](http://www.amazon.com/Reproducible-Research-RStudio-Chapman-Hall/dp/1466572841/ref=sr_1_1?s=books&ie=UTF8&qid=1411050704&sr=1-1&keywords=9781466572843)

####Generating SSH Keys
Here is a [useful link](https://help.github.com/articles/generating-ssh-keys) explaining how to generate an SSH key that you can use to identify yourself when pushing or pulling changes from a remote repository. While it is github centric, the resulting key can just as easily be added to your duke gitorious account.  This also assumes that you have not already generated a key.  If you have already generated a key for other uses, and you need a separate key just for github or gitorious (or both), you can follow these instructions, but instruct the ssh-keygen command to save the keypair to a different name than the default.  You can then add the following to your ~/.ssh/config (create this file with this content if it does not already exist):

```
Host gitorious.oit.duke.edu
HostName gitorious.oit.duke.edu
IdentityFile ~/.ssh/my_gitorious_rsa
```

This will configure calls to ssh (including git access to remotes via ssh under the hood) to use the configured IdentityFile instead of your default.

####Exercises
Work through the exercises to become more fluent in the use of the git commandline for collaboration.
