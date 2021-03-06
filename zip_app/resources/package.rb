#
# Cookbook Name:: zip_app
# Resource:: package
#
# Copyright 2011, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :install

attribute :app,         :kind_of => String, :name_attribute => true
attribute :source,      :kind_of => String
attribute :zip_file,    :kind_of => String
attribute :destination, :kind_of => String, :default => "/Applications"
attribute :checksum,    :kind_of => String
attribute :extracted,   :kind_of => String

def initialize(name, run_context = nil)
  super
  @action = :install
end

def extracted_path
  "#{destination}/#{extracted || "#{app}.app"}"
end

def installed?
  ::File.exists? extracted_path
end
