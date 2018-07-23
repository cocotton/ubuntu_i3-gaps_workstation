user = node['ubuntu_i3-gaps_workstation']['user']

# Install the polybar configuration
remote_directory "/home/#{user}/.config/polybar" do
  source '.config/polybar'
  owner user
  group user
  files_owner user
  files_group user
end

# We need to make the polybar scripts executable since the previous operation writes them with mode 0644
%w[
  music.sh
  polybar.sh
  weather.sh
].each do |script|
  file "/home/#{user}/.config/polybar/scripts/#{script}" do
    mode 0744
  end
end
