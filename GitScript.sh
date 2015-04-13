#!/bin/bash
sudo rm -rf ~/RubyCompany
sudo git clone https://github.com/CodeBobomb/RubyCompany.git
sudo mv RubyCompany ~/
sudo chmod -R 777 ~/RubyCompany/
cd ~/RubyCompany/test/config/
ruby build_increment.rb
cd ~/RubyCompany/test
