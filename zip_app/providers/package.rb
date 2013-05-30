#
# Cookbook Name:: zip_app
# Provider:: package
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

action :install do
  unless new_resource.installed?
    zip_file = new_resource.zip_file || new_resource.source.split('/').last
    downloaded_file = "#{Chef::Config[:file_cache_path]}/#{zip_file}"

    remote_file downloaded_file do
      source    new_resource.source
      checksum  new_resource.checksum if new_resource.checksum
    end

    execute "Extract #{new_resource.app}" do
      cwd       new_resource.destination
      command   %{unzip '#{downloaded_file}'}

      creates   new_resource.extracted_path
    end

    new_resource.updated_by_last_action true
  end
end
