user = node['ubuntu_i3-gaps_workstation']['user']
termite_repo_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/termite"
vte_ng_repo_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/vte-ng"

ENV['LIBRARY_PATH'] = '/usr/include/gtk-3.0'

# Install required packages
%w[
  libgtk-3-dev
  libpcre2-dev
  libvte-2.91-dev
	g++
	gtk-doc-tools
	gnutls-bin
	valac
	intltool
	libglib3.0-cil-dev
	libgnutls28-dev
	libgirepository1.0-dev
	libxml2-utils
  gperf
].each do |package|
  package "install_#{package}" do
    package_name package
  end
end

# Clone the vte-ng repository
git vte_ng_repo_path do
  repository node['ubuntu_i3-gaps_workstation']['termite']['vte-ng']['repo_url']
  revision '0.50.2-ng'
  user user
  group user
end

# Generate vte-ng config
execute 'generate_vte-ng_config' do
  command './autogen.sh'
  cwd vte_ng_repo_path
  user user
  live_stream true
end

# Compile vte-ng
execute 'compile_vte-ng' do
  command 'make'
  cwd vte_ng_repo_path
  user user
  live_stream true
end

# Install vte-ng
execute 'install_vte-ng' do
  command 'make install'
  cwd vte_ng_repo_path
  live_stream true
end

# Clone the termite repository
git termite_repo_path do
  repository node['ubuntu_i3-gaps_workstation']['termite']['repo_url']
  revision 'master'
  enable_submodules true
  user user
  group user
end

# Compile termite
execute 'compile_termite' do
  command 'make'
  cwd termite_repo_path
  user user
  live_stream true
end

# Install termite
execute 'install_termite' do
  command 'make install'
  cwd termite_repo_path
  live_stream true
end

# Initialize ldconfig
execute 'initialize_ldconfig' do
  command 'ldconfig'
  cwd termite_repo_path
  live_stream true
end

# Create terminfo/x directory
directory '/lib/terminfo/x' do
  recursive true
end

link '/usr/local/share/terminfo/x/xterm-termite' do
  to '/lib/terminfo/x/xterm-termite'
end

# Cleanup
directory termite_repo_path do
  recursive true
  action :delete
end
