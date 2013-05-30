#
# Cookbook Name:: macvim
# Recipe:: default
#
# Copyright (C) 2013 Ryan Souza
#
# The MIT License (MIT)
#
#
# Uses homebrew to install the macvim package

package "macvim" do
  action :install
  options "--override-system-vim"
end
