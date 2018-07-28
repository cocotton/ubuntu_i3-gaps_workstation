# Install nvidia-driver package
package "install_#{node['ubuntu_i3-gaps_workstation']['nvidia']['driver']}" do
  package_name node['ubuntu_i3-gaps_workstation']['nvidia']['driver']
end
