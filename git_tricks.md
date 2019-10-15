
# The Power of Git
Special thanks to [Linus Torvalds](https://github.com/torvalds) for his gift of git.

## How to find the date a specific line of code changed using github


### Step 1: Navigate to the folder hosting the file of interest.
### Step 2: Use `git log` to find all of the patches that have occured to a certain file.

    $ git log -p file

This will open the file log history using `less`, which allows you to navigate through the log in `vim`. When your in the log, just search for the variable that changes within that line of code using the search function and you will be delivered right to the most recent change of that line of code.

    :/tau_p

    commit b03f04c45c47d661fba52e671721b7ee22f90d06
    Author: gunnar pope <email>
    Date:   Sun Jul 22 11:24:51 2018 -0400

        fixing differential equation variable order

    diff --git a/Tex/ChX_prelim_quasidigital.tex b/Tex/ChX_prelim_quasidigital.tex
    index cd33451..f631ed9 100644
    --- a/Tex/ChX_prelim_quasidigital.tex
    +++ b/Tex/ChX_prelim_quasidigital.tex
    @@ -660,9 +660,9 @@ e^{\lambda_2 t} + V_{cc}

    ....

    +b &= \frac{1}{\tau_p} = \big(\frac{1}{\tau_1} + \frac{1}{\tau_3}\big)} \\

And there you have it, this output shows the last time that the line of code holding `tau_p` was changed.

## Make a branch the master branch 
Checkout to the 
```
$ git checkout last-try 
Switched to branch 'last-try'
Your branch is up to date with 'origin/last-try'.

$ git merge --strategy=ours master
Merge made by the 'ours' strategy.

$ git checkout master 
Switched to branch 'master'
Your branch is up to date with 'origin/master'.

$ git merge last-try 
Updating 9d20f66..ca461e1
Fast-forward
 appdata.py     |   8 +-
 callbacks.py   |  63 +++-------
 layout.py      |  10 +-
 pyapi/pyapi.py |  90 ++++++++++++--
 callbacks.py   | 287 ++++++++++++++++++++++++++++++++++++++++---
 layout.py      |  19 ++-
 files changed, 394 insertions(+), 94 deletions(-)

$ git status
On branch master
Your branch is ahead of 'origin/master' by 42 commits.
  (use "git push" to publish your local commits)

```
	
