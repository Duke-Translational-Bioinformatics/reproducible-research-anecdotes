Working individually:
+ Create individual accounts on the Duke Gitorious server
+ Add your ssh key to your account to allow ssh access from your workstation

Working in Pairs (person A and person B):
+ Person A should create a project and add the other user to the project
+ Person B should create a repository in the project
+ Both should git clone the repository
+ Both should use git remove -v to see the remotes that are automatically setup by git (note their names, they are important)
+ Person A should add a file to the repository, commit it, and push it to gitorious
+ Person B should git pull
+ Person B should modify the file, and commit it
+ Person B should use git status to find out how their repository compares to the remote
+ Person B should use git fetch and git diff to find out how their code differs from the remote
+ Person A should git pull (did anything happen?  What did Person B forget to do?)
+ Person B should git push their changes
+ Person A should git pull
+ Both should modify the same line in the file to be slightly different
+ Person A should git push before Person B
+ Person B should git push.  What happens?
+ Person B should resolve the conflict (you should communicate with your partner to discuss how best to do so)
and commit the changes
+ Person A should git pull
