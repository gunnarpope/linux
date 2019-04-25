## Find and replace text within a directory
Let's change the word 'god' to 'good' in the two text files below.

Show the files

		~/repos/linux/sed $ ls
		file1.txt  file2.txt

View the files		

		~/repos/linux/sed $ cat *.txt
		Climb the mountain to get the good tidings.
		"good" is good.

Find all files with the word 'god'

		~/repos/linux/sed $ grep -rn . -e 'god'
		./file1.txt:1:Climb the mountain to get the god tidings.
		./file2.txt:1:"god" is good.

Replace all 'god' phrases with 'good' and show the file contents afterwards.

		~/repos/linux/sed $ sed -i 's/god/good/g' *
		~/repos/linux/sed $ grep -rn . -e 'good'
		./file1.txt:1:Climb the mountain to get the good tidings.
		./file2.txt:1:"good" is good.

Example: change the characters `[H]` to `[h]` throughout a bunch of specific `.tex` files. Start with searching for all files containing the phrase `[H]`.


		~/repos/grand-finale/thesis $ grep -rnw chp/compression2019/ -e "\[H\]"
		chp/compression2019/sec/introduction.tex:30:\begin{figure}[H]
		chp/compression2019/sec/introduction.tex:105:\begin{figure}[H]
		chp/compression2019/sec/methods.tex:5:\begin{figure}[H]
		chp/compression2019/sec/methods.tex:15:\begin{figure}[H]
		chp/compression2019/sec/methods.tex:53:% \begin{algorithm}[H]
		chp/compression2019/sec/methods.tex:294:\begin{figure}[H]
		chp/compression2019/sec/methods.tex:330:\begin{figure}[H]
		chp/compression2019/sec/appendix.tex:9:\begin{figure}[H]
		chp/compression2019/sec/appendix.tex:51:\begin{figure}[H]
		chp/compression2019/sec/results.tex:7:\begin{figure}[H]
		chp/compression2019/sec/results.tex:26:% \begin{figure}[H]
		chp/compression2019/sec/results.tex:34:\begin{figure}[H]
		chp/compression2019/sec/results.tex:66:\begin{figure}[H]
		chp/compression2019/sec/results.tex:77:\begin{figure}[H]
		chp/compression2019/sec/results.tex:94:\begin{figure}[H]
		chp/compression2019/sec/results.tex:101:\begin{figure}[H]

Now, change `[H]` to `[h]` using `sed`:

		~/repos/grand-finale/thesis $ sed -i "s/\[H\]/\[h\]/g" chp/compression2019/sec/*.tex

After the change is made, do the same search as before to make sure that no instances of `[H]` exist.

		~/repos/grand-finale/thesis $ grep -rnw chp/compression2019/ -e "\[H\]"
		~/repos/grand-finale/thesis $

Ok, cool. Looks like that made all the changes needed.
