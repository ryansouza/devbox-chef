#
# Cookbook Name:: airfoil
# Recipe:: default
#
# Copyright (C) 2013 Ryan Souza
#
# The MIT License (MIT)
#

include_recipe "zip_app"

zip_app_package "Airfoil" do
  source "http://neutral.rogueamoeba.com/mirror/files/Airfoil.zip"
  action :install
  extracted "Airfoil"
end
