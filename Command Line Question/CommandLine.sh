country=$(cut -f11 -d$'\t' correct_merged_courses.tsv | sort | uniq -c | sort -nr | head -n 1 | awk '{ $1=""; print $0}' | sed -e 's/^[[:space:]]*//')
city=$(cut -f10 -d$'\t' correct_merged_courses.tsv | sort | uniq -c | sort -nr | head -n 1 | awk '{ $1=""; print $0}' | sed -e 's/^[[:space:]]*//')
echo "The country that offers the majority of masters in the website is $country, while the city is $city"

count=$(grep -i -E "part[- ]?time" correct_merged_courses.tsv | wc -l)
echo "In total $count masters offer a part-time education"


total=$(awk 'END {print NR-1}' correct_merged_courses.tsv)
eng=$(grep -i "Engineer" correct_merged_courses.tsv | wc -l)
percentage=$(echo "scale=2; $eng / $total * 100" | bc)
echo "Percentage of courses in Engineering: $percentage%"

