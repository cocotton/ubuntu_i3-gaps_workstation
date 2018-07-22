user = node['ubuntu_i3-gaps_workstation']['user']
zsh_bin_path = '/usr/bin/zsh'

# This is to prevent the oh-my-zsh_installer script to run chsh itself
ENV['SHELL'] = zsh_bin_path

# Install the zsh package
package 'install_zsh' do
  package_name 'zsh'
end

# Update user's shell to zsh
execute 'update_shell' do
  command "chsh -s #{zsh_bin_path} #{user}"
  live_stream true
end

# Copy the zsh oh-my-zsh_installer.sh script
cookbook_file "/home/#{user}/oh-my-zsh_installer.sh" do
  source 'oh-my-zsh_installer.sh'
  owner user
  group user
end

# Install oh-my-zsh using the local script installer
execute 'install_oh-my-zsh' do
  command "/bin/sh /home/#{user}/oh-my-zsh_installer.sh"
  user user
  live_stream true
end

# Remove the oh-my-zsh_installer.sh script
file "/home/#{user}/oh-my-zsh_installer.sh" do
  action :delete
end

# Copy the .zshrc config file. We do this after installing oh-my-zsh since the config file is already oh-my-zsh ready.
cookbook_file "/home/#{user}/.zshrc" do
  source '.zshrc'
  owner user
  group user
end
