#2.1 Regular Expressions: grep() function
#we want to find the word 'the' from the sentece
sentence <- c('By','the','time','they', 'got', 'back,', 'the', 'lights', 'were', 'all', 'out', 'and', 'everybody', 'was', 'asleep.', 'Everybody,', 'that', 'is,', 'except', 'for', 'Guih', 'Kyom', 'the', 'dung', 'beetle.', 'He', 'was', 'wide', 'awake', 'and', 'on', 'duty,', 'lying', 'on', 'his', 'back', 'with', 'his', 'legs', 'in', 'the', 'air', 'to', 'save', 'the', 'world', 'in', 'case', 'the', 'heavens', 'fell.')
grep_out <- grep(pattern = 'the', x = sentence)
grep_out
##[1]  2  4  7 23 41 45 49

#To return all the works: grep_out to subscript our sentence using square brackets
sentence[grep_out]
##"the"  "they" "the"  "the"  "the"  "the"  "the" 

#Note that this returned the word 'they'
#To avoid this use anchors ^ and $ and change the pattern argument
#^ is used to match the start and $ is used to match the end
grep_out2 <- grep(pattern = '^the$', x = sentence)
grep_out2
sentence[grep_out2]
##[1] "the" "the" "the" "the" "the" "the"

#2.2 

