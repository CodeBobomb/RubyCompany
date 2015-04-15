#!/bin/bash
#SCRIPT NOT FINISHED!

function build_inc {
	a=$(sed -n '/build/p' ~/RubyCompany/test/config/rspec2db.yml)
	b=${a:9} 
	b=${b//\"}
	IFS="." read -a ver <<< "$b"

	let ver[2]++
	if [  "${ver[2]}" -gt  9  ]; then
		ver[2]=0
		let ver[1]++
	fi

	if [  "${ver[1]}" -gt  9  ]; then
		ver[1]=0
		let ver[0]++
	fi


	s="  build: \"${ver[0]}.${ver[1]}.${ver[2]}\""
	sed -i "s/.*build.*/$s/" ~/RubyCompany/test/config/rspec2db.yml
}


if [ -d  ~/"RubyCompany"  ] && [ -d ~/"RubyCompany/.git" ]; 
	then
	echo "Trying to pull the latest build"
	cd ~/RubyCompany
	output=$(git pull)
	check="Already up-to-date."
	if [ "$output"=="$check" ];
	then
		echo "No changes on remote"
	else
		echo "Pulled the latest commit"
	fi
else
	echo "cloning RubyCompany"
	git clone https://github.com/CodeBobomb/RubyCompany.git ~/RubyCompany
fi
build_inc

cd ~/RubyCompany/test

rspec ~/RubyCompany/test/spec/*