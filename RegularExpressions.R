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

#2.2 Regular Expression Tools
#Regular expressions can search much more flexibly
grep_out <- grep(pattern = '[A-Z]', x = sentence)
grep_out
##[1]  1 16 21 22 26

#Using character '.' 
#If we search for 'a.e' we are looking for matches where there is an 'a' and an 'e' separated by any character.
grep_out <- grep(pattern = 'a.e', x = sentence)
sentence[grep_out]
##"awake"   "save"    "case"    "heavens"

#2.3 Quantifiers
#These allow the user to specify how many of a character grep() is matching to
#The main three symbols are ? * +
#‘?’ denotes 0 or 1 instances.
#‘*’ denotes 0 or more instances.
#‘+’ denotes 1 or more instances.

sentence[grep(pattern = 'e.?e', x = sentence)]
#[1] "were"      "everybody" "asleep."   "beetle."  

sentence[grep(pattern = 'e.*e', x = sentence)]
##[1] "were"      "everybody" "asleep."   "except"    "beetle."   "heavens" 

sentence[grep(pattern = 'e.+e', x = sentence)]
#[1] "were"      "everybody" "except"    "beetle."   "heavens"  

#2.4 The gsub() function
#The 'gsub()' function can be used to search for text in the same way as the 'grep()'
#It instead substitutes the matched text with text of our choosing.
gsub_out <- gsub(pattern = 'a.e', x = sentence, replacement = '!!!')
gsub_out
##shortened  "c!!!"       "the"        "he!!!ns

#Q. replace all the letter ’t’s with question marks.
gsub_out2 <- gsub(pattern = 't', x = sentence, replacement = '?')
gsub_out2
##shortened "By"         "?he"        "?ime"       "?hey"












