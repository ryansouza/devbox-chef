current_dir = File.expand_path File.dirname(__FILE__)

solo true
cookbook_path ["#{current_dir}/vendor/cookbooks"]

cache_type 'BasicFile'
cache_options path: "#{ENV['HOME']}/.chef/checksums"
file_cache_path "#{ENV['HOME']}/.chef/file_cache_path"
