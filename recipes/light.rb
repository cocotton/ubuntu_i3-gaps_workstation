user = node['ubuntu_i3-gaps_workstation']['user']
light_repo_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/light"

# Install required package
package "install_help2man" do
  package_name 'help2man'
end

# Clone the light repository
git light_repo_path do
  repository node['ubuntu_i3-gaps_workstation']['light']['repo_url']
  revision 'master'
  user user
  group user
end

# Compile light
execute 'compile_light' do
  command 'make'
  cwd light_repo_path
  user user
  live_stream true
end

# Install light
execute 'install_light' do
  command 'make install'
  cwd light_repo_path
  live_stream true
end

# Cleanup
directory light_repo_path do
  recursive true
  action :delete
end
