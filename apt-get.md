
## Update and upgrade your software packages using apt-get
    $ sudo apt-get && sudo apt-get upgrade

### If you get an error for packages being 'kept back', as shown:
    $ Reading package lists... Done
    $ Reading package lists... Done
    $ Building dependency tree       
    $ Reading state information... Done
    $ Calculating upgrade... Done
    $ The following packages have been kept back:
        linux-generic linux-headers-generic linux-image-generic

...you may need to upgrade your distributions, as shown below.    

    ~ $ sudo apt-get dist-upgrade
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    Calculating upgrade... Done
    The following NEW packages will be installed:
      linux-headers linux-headers-generic
      linux-image-generic linux-modules-generic

