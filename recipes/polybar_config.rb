user = node['ubuntu_i3-gaps_workstation']['user']

# Install the polybar configuration
remote_directory "/home/#{user}/.config/polybar" do
  source '.config/polybar'
  owner user
  group user
  files_owner user
  files_group user
end
