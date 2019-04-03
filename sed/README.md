## Find and replace text within a directory
Let's change the word 'god' to 'good' in the two text files below.

* Show the files

		~/repos/linux/sed $ ls
		file1.txt  file2.txt

* View the files		

		~/repos/linux/sed $ cat *.txt
		Climb the mountain to get the good tidings.
		"good" is good.

* Find all files with the word 'god'	

		~/repos/linux/sed $ grep -rn . -e 'god'
		./file1.txt:1:Climb the mountain to get the god tidings.
		./file2.txt:1:"god" is good.

* Replace all 'god' phrases with 'good' and show the file contents afterwards.
		
		~/repos/linux/sed $ sed -i 's/god/good/g' *
		~/repos/linux/sed $ grep -rn . -e 'good'
		./file1.txt:1:Climb the mountain to get the good tidings.
		./file2.txt:1:"good" is good.

