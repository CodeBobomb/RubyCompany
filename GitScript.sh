#!/bin/bash
<<<<<<< HEAD
#SCRIPT NOT FINISHED!
if [ -d  ~/"RubyCompany" ]; then
	if [ -d ~/"RubyCompany/.git" ]; then
		echo "Trying to pull the latest build"
		git pull
		ruby ~/"RubyCompany/test/config/build_increment.rb"
	fi
fi
=======
sudo rm -rf ~/RubyCompany
sudo git clone https://github.com/CodeBobomb/RubyCompany.git
sudo mv RubyCompany ~/
sudo chmod -R 777 ~/RubyCompany/
cd ~/RubyCompany/test/config/
ruby build_increment.rb
cd ~/RubyCompany/test

# Nikad ne koristiti sudo u bash skriptama. Ako ti je potreban sudo access, mozes samu skriptu pokrenuti sa sudo
# ali za ovo ti ne bi trebao biti potreban

# Napravi malo vise logike ovdje u smislu da provjeris da li postoji RubyCompany folder, ako postoji obrises ga,
# ako ne, onda i ne pokusavas rm komandu

# Zasto dodajes all permisije na RubyCompany?

# Nema komande za pokretanje testova?
>>>>>>> ecf14b114e6073e84dcb7791e5f56eabd38531f0
