# My own tricks to gain time on 42 Piscine, some are taken from xtrm


export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="Bira"


plugins=(git)
source $ZSH/oh-my-zsh.sh

# Editor
alias v="vim"

# Compilation flags
alias n="norminette -R CheckForbiddenSourceHeader"
alias c="gcc -Wall -Wextra -Werror"
alias see="cat */*"


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
