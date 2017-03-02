#!/usr/bin/env bash

# Setting up and installing rbenv, ruby-build, rubies, rbenv-gemset, and bundler
# This guide enables you to install (ruby-build) and use (rbenv)
# multiple versions of ruby, isolate project gems (gemsets and/or bundler), and
# automatically use appropriate combinations of rubies and gems.
## TL;DR Demo
# Ensure system is in ship-shape.
sudo apt-get install git libssl-dev zsh zlib1g-dev libreadline-dev libyaml-dev
# Install rbenv for managing enabling of multiple rubies.
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv


echo 'export PATH="$HOME/.rbenv/bin:$PATH"' | tee ~/.bashrc ~/.zshrc
echo 'eval "$(rbenv init -)"' | tee ~/.bashrc ~/.zshrc
exec $SHELL
# Install the ruby-build plugin for easy building of rubies.
mkdir -p ~/.rbenv/plugins
cd !$
git clone git://github.com/sstephenson/ruby-build.git
# Install a couple rubies
rbenv install 2.1.1
rbenv rehash
# Try out a ruby.
#rbenv shell 1.9.3-p125
# Enable a newly installed ruby, persistently, globally.
rbenv global 2.1.1
# Enable a ruby persistently just for this directory.
rbenv rehash
cd ${1}
rbenv local 2.1.1
# Install bundler, create a Gemfile, install to project.
gem install bundler
bundle config --local path vendor
bundle install
bundle exec gem env
# (OPTIONAL: for those who maintain gems or have myriad projects)
# Install rbenv-gemset, create a gemset, install a gem, use it.
# cd ~/.rbenv/plugins
# git clone git://github.com/jamis/rbenv-gemset.git
# rbenv gemset create 1.9.3-p125 helloset
# >.rbenv-gemsets <<<helloset
# rbenv gemset active
# gem install ronn
# rbenv rehash
# rbenv gemset list