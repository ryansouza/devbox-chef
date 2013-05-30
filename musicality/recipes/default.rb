#
# Cookbook Name:: musicality
# Recipe:: default
#
# Copyright (C) 2013 Ryan Souza
#
# The MIT License (MIT)
#

include_recipe "zip_app"

zip_app_package "Musicality" do
  source "http://dload.industriousone.com/musicality"
  action :install
end
