#!/bin/bash
sudo rm -rf ~/RubyCompany
sudo git clone https://github.com/CodeBobomb/RubyCompany.git
sudo mv RubyCompany ~/
cd ~/RubyCompany/test
rspec spec/*
