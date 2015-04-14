#!/bin/bash
#SCRIPT NOT FINISHED!
if [ -d  ~/"RubyCompany"  ] && [ -d ~/"RubyCompany/.git" ]; then
	echo "Trying to pull the latest build"
	cd ~/RubyCompany
	git pull
else
	if  [ -d ~/"RubyCompany" ]; then
		rm -r ~/"RubyCompany"
	fi
	echo "cloning RubyCompany"
	git clone https://github.com/CodeBobomb/RubyCompany.git ~/RubyCompany
fi

cd ~/"RubyCompany/test/"
rspec "spec/"
