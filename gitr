#!/usr/bin/env sh

usage() {
	echo "
	usage: gitr command
	example: gitr status"
}

gitr() {
	REPOS=$(find . -name '.git' -type d -maxdepth 2 -print0 | xargs -0 -n1 dirname | cut -c 3-)
	for repo in $REPOS; do
		pushd $repo >>/dev/null
		echo "\n\033[0;34m[ $repo ]\033[0m\n"
		git $@
		popd >>/dev/null
	done
}

if [ $# -eq 0 ]; then
	usage
else
	gitr $@
fi
