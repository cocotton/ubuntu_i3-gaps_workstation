user = node['ubuntu_i3-gaps_workstation']['user']
golang_archive_path = "#{node['ubuntu_i3-gaps_workstation']['tmp_dir']}/golang.tar.gz"

# Download the golang archive
remote_file golang_archive_path do
  source "https://dl.google.com/go/go#{node['ubuntu_i3-gaps_workstation']['golang']['version']}.linux-amd64.tar.gz"
  user user
  group user
  not_if { ::Dir.exists?('/usr/local/go') }
  notifies :run, 'execute[extract_golang_archive]', :immediate
end

# Extract the golang archive
execute 'extract_golang_archive' do
  command 'tar -C /usr/local -xzf golang.tar.gz'
  cwd node['ubuntu_i3-gaps_workstation']['tmp_dir']
  live_stream true
  action :nothing
end

# Cleanup archive
file golang_archive_path do
  action :delete
end
