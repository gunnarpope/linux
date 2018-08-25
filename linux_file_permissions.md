# Setting File Permissions From The Terminal
by: gunnar pope 8/25/18

## Changing Directory Permission Settings Using `setfacl`
Change the default file permission settings for all folders and files within a directory. This answer found on: [stackechange](https://unix.stackexchange.com/questions/1314/how-to-set-default-file-permissions-for-all-folders-files-in-a-directory)


Using the default switch (-d) and the modify switch (-m) will only modify the the default permissions but leave the existing ones intact:
```
setfacl -d -m g::rwx /<directory>
```

If you want to change folder's entire permission structure including the existing ones (you'll have to do an extra line and make it recursive -R:
```
setfacl -R -m g::rwx /<directory>

setfacl -R -m g::rwx /home/limited.users/<directory> // gives group read,write,exec permissions for currently existing files and folders, recursively
setfacl -R -m o::x /home/limited.users/<directory> //revokes read and write permission for everyone else in existing folder and subfolders
setfacl -R -d -m g::rwx /home/limited.users/<directory> // gives group rwx permissions by default, recursively
setfacl -R -d -m o::--- /home/limited.users/<directory> //revokes read, write and execute permissions for everyone else.

```

Test it out. Here, you can see that the directory testfile4.txt originally gave the group "others" (which is global permission for anyone on the system) read and execute permission (r-x). Use `setfacl` to change the permissions for this directory and all sub-files within it to no-read, write, or execute (---).

```
~/Desktop $ ls -la
drwxr-xr-x  2 user user 4096 Aug 25 10:44 testdir4

~/Desktop $ echo "testfile4.txt" >> testdir4/testfile.4.txt
~/Desktop $ setfacl -R -m o::--- testdir4/

~/Desktop $ ls -la
drwxr-x---  2 user user 4096 Aug 25 10:52 testdir4
~/Desktop $ cd testdir4/
~/Desktop/testdir4/ $ ls -l
-rw-rw---- 1 user user 14 Aug 25 10:52 testfile.4.txt
```
After the modification, all of the files have 'rw-rw----' permissions and any new file created will have these settings as well. Test this by creating a new file.
```
~/Desktop/testdir4 $ echo "testfile5.txt" >> testfile5.txt
~/Desktop/testdir4 $ ls -l
total 24
-rw-rw---- 1 user user 14 Aug 25 10:52 testfile.4.txt
-rw-rw-r-- 1 user user 14 Aug 25 11:21 testfile5.txt

```

For some reason, this new file has the old permissions! So we must have modified the existing files but not the default file permission setting.

## Next step: Change the default setting for creating files on the computer.


# Using `umask` to set file permissions

To set the default permissions for file and folder creation, use `umask` to mask the bits that you want to *remove* from the file permission list. The bits are in octal notation.


To change the global permissions from read, write, execute (rwx) to read-only (r--), then use `$ umask 004`


```
~/Desktop $ umask 007
~/Desktop $ mkdir testdir2
~/Desktop $ ls -al
drwxrwx---  2 user user    4096 Aug 25 10:12 testdir2

~/Desktop $ umask 027
~/Desktop $ mkdir testdir3
~/Desktop $ ls -al
drwxr-x---  2 user user 4096 Aug 25 10:15 testdir3

-rw-r----- 1 user user   66 Aug 25 10:32 testfile3.txt

~/Desktop $ echo "a new file with permissions" >> testfile3.txt

~/Desktop $ ls -al
-rw-r----- 1 user user   28 Aug 25 10:38 testfile3.txt
```

This method only works for the current working terminal session and does not perminently mask the permissions bits.
