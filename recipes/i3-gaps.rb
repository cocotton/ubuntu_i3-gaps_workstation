user = node['ubuntu_i3-gaps_workstation']['user']
i3_repo_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/i3-gaps"

# Install required packages listed here: https://github.com/Airblader/i3/wiki/Compiling-&-Installing#1610-
%w[
  libxcb1-dev
  libxcb-keysyms1-dev
  libpango1.0-dev
  libxcb-util0-dev
  libxcb-icccm4-dev
  libyajl-dev
  libstartup-notification0-dev
  libxcb-randr0-dev
  libev-dev
  libxcb-cursor-dev
  libxcb-xinerama0-dev
  libxcb-xkb-dev
  libxkbcommon-dev
  libxkbcommon-x11-dev
  autoconf
  libxcb-xrm0
  libxcb-xrm-dev
  automake
].each do |package|
  package "install_#{package}" do
    package_name package
  end
end

# Clone the i3-gaps repository
git i3_repo_path do
  repository node['ubuntu_i3-gaps_workstation']['i3-gaps']['repo_url']
  revision 'gaps-next'
  user user
  group user
end

# Generate the i3-gaps configuration files
execute 'run_autoreconf' do
  command 'autoreconf --force --install'
  cwd i3_repo_path
  user user
  live_stream true
end

# Delete the i3-gaps/build directory and its content if it exists
directory "#{i3_repo_path}/build" do
  recursive true
  action :delete
end

# Create the i3-gaps/build directory
directory "#{i3_repo_path}/build" do
  user user
  group user
end

# Configure i3-gaps before compiling it
execute 'configure_i3-gaps' do
  command '../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers'
  cwd "#{i3_repo_path}/build"
  user user
  live_stream true
end

# Compile i3-gaps
execute 'compile_i3-gaps' do
  command 'make'
  cwd "#{i3_repo_path}/build"
  user user
  live_stream true
end

# Install i3-gaps
execute 'install_i3-gaps' do
  command 'make install'
  cwd "#{i3_repo_path}/build"
  live_stream true
end
