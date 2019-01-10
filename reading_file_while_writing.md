## How to read from a file while it is being written to in real-time.
I learned this one from Phil Mesnier at the EOS Hackathon in SF. Thanks Phil.


This command will redirects command stderr output to stdout.

    $ command 2>&1


Then you can add `tee` to write to a file called `logfile` so you can capture the output for later.

    $ command 2>&1 | tee logfile | less
