iterm2_print_user_vars() {
	iterm2_set_user_var basepath $(it2_basename "$PWD")
	iterm2_set_user_var hostname $(hostname -s)
}


# Helper functions

it2_basename() {
	base=$(basename "$@" 2> /dev/null || basename "$@" "$PWD")

	
	if [[ "${$(uname):l}" == "darwin" && "$base" == "/" ]] then
		echo $(diskutil info / | awk -F': ' '/Volume Name/{gsub(/^ +| +$/,"",$2); print $2}')
	else
		echo "$base"
	fi
}

