While dealing with the Command Line Question, as every member of this group had Windows OS we used two different machines to do the job.
With the first (a computer from the equipment of via Tiburtina labs) we merged the tsv files; once we uploaded the 6000 tsv documents obtained with the parsing part, we merged them with a single command line as you can see in the provided screenshot (*merging_file_with_Linux_on_Sapienza_computer.png*).


After that we created an Ubuntu EC2 instance in AWS in order to be able to do operations with Linux commands on the merged file downloaded from the lab's computer and retrieve the information required for the homework.


At first we uploaded our .sh file (*CommandLine.sh*, the file uploaded in this repository includes comments that explain the content of the code) and the merged file called *merged_courses* from an S3 Bucket we created called *hw3buckt*, and then as you can see in the screenshot *prompt_screenshot_clq.jpg* before executing the shell file we did some operation to make it run succesfully:
* ```wc -l merged_courses.tsv```: this command returns the number of rows of our table, and we can see that we have 12000 rows as output, while our file has half of them. This happens because with the operation we used to merge the file in the previous machine, among with the row containing the values, also the row with the variables names is copied;
* ```awk 'NR % 2 == 0' input_file.tsv > output_file.tsv```: with the **awk** command we solved the issue mentioned above. We create a new file named *correct_merged_courses.tsv* that is nothing else than the original file without the even rows (the rows with the variables names);
* ```chmod +x CommandLine.sh```: this commands gives permission to the machine to access the shell file;
* ```dos2unix CommandLine.sh```: with this command this we adjust the text of our .sh file because starting new lines while executing with Linux returns an error. After this the file will be ready to be run.


