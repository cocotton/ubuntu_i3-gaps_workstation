user = node['ubuntu_i3-gaps_workstation']['user']

# Install the termite configuration
remote_directory "/home/#{user}/.config/termite" do
  source '.config/termite'
  owner user
  group user
  files_owner user
  files_group user
end
