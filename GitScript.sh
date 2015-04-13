#!/bin/bash
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