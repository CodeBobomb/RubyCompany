#!/bin/bash
#SCRIPT NOT FINISHED!
if [ -d  ~/"RubyCompany" ]; then
	if [ -d ~/"RubyCompany/.git" ]; then
		echo "Trying to pull the latest build"
		git pull
		ruby ~/"RubyCompany/test/config/build_increment.rb"
	fi
fi