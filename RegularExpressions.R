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

#2.5 The Challenge
#Load 'dung_beetles.csv'
db <- read.csv('dung_beetles.csv')
str(db)

#colnames() Make a new object that is a vector of all the species names
species_names <- colnames(db)

#use grep() to find the names of all the species that have a genus name that starts with the letter ‘C’
genus_C <- grep(pattern = '[C-C]', x = species_names)
genus_C
##[1] 3 4 5 6 7 8

#Find all the species where the specific epithet (the second word) starts with the letter ‘r’.
se_r <- grep(pattern = '_r', x = species_names)
se_r
##[1]  5  7 36 37 38 56 64

#Replace all the ‘Copis’ genus names with the correct ‘Copris’ spelling.
gsub_copis <- gsub(pattern = 'Copis', x = species_names, replacement = 'Corpis')
gsub_copis

# ‘Microcopis’ should be ‘Microcopris’. Fix this too.
gsub_microcopis <- gsub(pattern = 'Microcopis', x = species_names, replacement = 'Microcorpis')
gsub_microcopis

# fix both genus names in one go! 
gsub_both <- gsub('Copis','Copris',
             gsub('Microcopis','Microcorpis',species_names))
gsub_both
                  







