# Cookbook Name:: rightscale
# Recipe:: disable_rightscale_epel
#
# Copyright 2012-2015, Chris Fordham
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

r = script 'disable_rightscale_epel' do
  interpreter '/opt/rightscale/sandbox/bin/ruby'
  code <<-EOH
  require 'chef'
  fe = Chef::Util::FileEdit.new('/etc/yum.repos.d/RightScale-epel.repo')
  fe.search_file_replace_line(/enabled\=1/, 'enabled=0')
  fe.write_file
  EOH
  action :nothing
end

r.run_action(:run)
