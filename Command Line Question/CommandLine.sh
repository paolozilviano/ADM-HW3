# 1) To get the country and the city that offer most opportunities to apply for a master we store in the variables "country" and "city"
#    the sorted values of the different columns with "sort" (and then sorted in reverse order with "sort -nr"), counting unique occurrenices
#    and then taking the first line removing leading spaces with the last three section of the command line.
#    In particular " awk '{ $1=""; print $0}' ": Removes the count from the line, leaving only the country name,
#    " sed -e 's/^[[:space:]]*//' ": Removes leading whitespace from the line.

country=$(cut -f11 -d$'\t' correct_merged_courses.tsv | sort | uniq -c | sort -nr | head -n 1 | awk '{ $1=""; print $0}' | sed -e 's/^[[:space:]]*//')
city=$(cut -f10 -d$'\t' correct_merged_courses.tsv | sort | uniq -c | sort -nr | head -n 1 | awk '{ $1=""; print $0}' | sed -e 's/^[[:space:]]*//')
echo "The country that offers the majority of masters in the website is $country, while the city is $city"


# 2) in this line of code we count in the "duration" column the number of courses which provide part-time education. We believe that it's
#    better to operate on this column and not with "isitFullTime" one, because if a master gives the opportunity to study both
#    full and part time, in this last variable the value 'Full Time' will be stored, so "duration" shuould give us more complete info.
#    We retrieve the information from the 9th column and with the command "grep -i" we ignore the case of the string "part time"
#    while the regular expression inside the string to retrieve indicates that if part time appears with an ifem ('-') to take it as well.
#    "wc -l" is the command we use to count.

count=$(cut -f9 correct_merged_courses.tsv | grep -i -E "part[- ]?time" | wc -l) 
echo "In total $count masters offer a part-time education"

# 3) In the end, in the first line of code we calculate the total number of rows in the file excluding the header,
#    Then in the second we extract and count from the "courseName" column the occurrences of "Engineer" ignoring the case to get
#    the total number of engineering courses. Once we've done that we compute the percentage using our two variables.

total=$(awk 'END {print NR-1}' correct_merged_courses.tsv)
eng=$(cut -f1 correct_merged_courses.tsv | grep -i "Engineer" | wc -l)
percentage=$(echo "scale=2; $eng / $total * 100" | bc)
echo "Percentage of courses in Engineering: $percentage%"

