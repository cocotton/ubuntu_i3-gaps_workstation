user = node['ubuntu_i3-gaps_workstation']['user']

# Install the vim package
package 'install_vim' do
  package_name 'vim'
end

# Copy the vim config files
cookbook_file "/home/#{user}/.vimrc" do
  source '.vimrc'
  owner user
  group user
end

remote_directory "/home/#{user}/.vim" do
  source '.vim'
  owner user
  group user
  files_owner user
  files_group user
end
