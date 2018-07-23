#
# Cookbook:: ubuntu_i3-gaps_workstation
# Recipe:: default
#
# Copyright:: 2018, Julien Parent-Trudeau
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

abort 'This cookbook is only usable with Ubuntu' unless node['platform'] == 'ubuntu'
abort "You must set your user with the default['ubuntu_i3-gaps_workstation']['user'] attribute" if node['ubuntu_i3-gaps_workstation']['user'] == ""

# Create a Tmp directory in the user home
directory node['ubuntu_i3-gaps_workstation']['tmp_dir'] do
  owner node['ubuntu_i3-gaps_workstation']['user']
  group node['ubuntu_i3-gaps_workstation']['user']
end

include_recipe '::grub'
include_recipe '::vim'
include_recipe '::zsh'
include_recipe '::fonts'
include_recipe '::extra'
include_recipe '::i3-gaps' if node['ubuntu_i3-gaps_workstation']['i3-gaps']['install']
include_recipe '::i3-gaps_config'
include_recipe '::termite' if node['ubuntu_i3-gaps_workstation']['termite']['install']
include_recipe '::termite_config'
include_recipe '::polybar' if node['ubuntu_i3-gaps_workstation']['polybar']['install']
include_recipe '::polybar_config'
include_recipe '::light' if node['ubuntu_i3-gaps_workstation']['light']['install']
