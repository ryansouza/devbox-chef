#
# Cookbook Name:: jgr-dotfiles
# Recipe:: default
#
# Copyright (C) 2013 Ryan Souza
#
# The MIT License (MIT)
#
# Explodes Mr. James "The Truckus" Rucker's dotfiles in ~/dotfiles
# and links(totally squashes over existing) them in to ~

home = ENV['HOME']

git "#{home}/dotfiles" do
  repository "https://github.com/jgr/dotfiles.git"
  action :sync
end

link "#{home}/.vimrc" do
  to "#{home}/dotfiles/vimrc"
end

%w[
  .vim
  .vim/bundle
  bin
].each do |dir|
  directory "#{home}/#{dir}" do
   action :create
  end
end

%w[
  bundle-hack
  hack
  np
  ssh-reagent
  v
].each do |file|
  link "#{home}/bin/#{file}" do
    to "#{home}/dotfiles/bin/#{file}"
  end
end

git "#{home}/.vim/bundle/vundle" do
  repository "https://github.com/gmarik/vundle.git"
  action :checkout
  notifies :write, "log[vundle install]"
end

log "vundle install" do
  action :nothing
  message "\n\n#{'!'*70}\nYou need to manually run `vim +BundleInstall +qall` in a termainl\n#{'!'*70}\n\n"
  level :warn
end
