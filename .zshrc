# My own tricks to gain time on 42 Piscine, some are taken from xtrm

# Infos for headers
export NAME="baldaod"
export MAIL="baldaod@student.s19.be"
export EMAIL="$MAIL"
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="Bira"

plugins=(git)
source $ZSH/oh-my-zsh.sh

# Editor
alias v="vim"

# Simple
alias see="cat */*"
alias l="ls -lahgpS"
alias lr="l */*"
alias cl="clear"
alias q="exit"

# Compilation & Normes
alias n="norminette -R CheckForbiddenSourceHeader"
alias c="gcc -Wall -Wextra -Werror"
alias check="n && c **/*.c -c && rm -rf **/*.o"

# Git
alias g="git"
alias cl="git clone"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log"
alias gd="git diff"
alias gdc="git diff --cached"
alias gds="git diff --staged"

# Create directory and cd into it
cdc() {
	mkdir -p $1 && cd $1
}

# Compile and run
r() {
	gcc -Wall -Wextra -Werror *.c
	./a.out $@
	rm -rf a.out
}

# Adds non exercices files to gitignore in case one of them was missed
gitignore() {
	echo ".gitignore" > .gitignore
	echo "*.o" >> .gitignore
	echo "*.out" >> .gitignore
	echo "*.swp" >> .gitignore
	echo "*.a" >> .gitignore
	echo "test_*" >> .gitignore
	echo ".DS_Store" >> .gitignore
}

# Create c files in all ex* directories and append useful lines to them

create_mains() {
	file_name="test_main.c"
	for ex in ex*; do
		if [ -d $ex ]; then
			echo "#include <stdio.h>" > $ex/$file_name
			echo "#include <stdlib.h>" >> $ex/$file_name
			echo "#include <unistd.h>" >> $ex/$file_name
			echo "#include <string.h>" >> $ex/$file_name
			echo "#include <limits.h>" >> $ex/$file_name
			echo "" >> $ex/$file_name
			echo "int	main(int argc, char *argv[])" >> $ex/$file_name
			echo "{" >> $ex/$file_name
			echo "	(void)argc;" >> $ex/$file_name
			echo "	(void)argv;" >> $ex/$file_name
			echo "	printf(\"Hello World!\\\\n\");" >> $ex/$file_name
			echo "	return (0);" >> $ex/$file_name
			echo "}" >> $ex/$file_name
		fi
	done
}
