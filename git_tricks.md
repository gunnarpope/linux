
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
