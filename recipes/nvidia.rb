driver_package = "nvidia-driver-#{node['ubuntu_i3-gaps_workstation']['nvidia']['driver']['version']}"

# Install nvidia-driver package
package "install_#{driver_package}" do
  package_name driver_package
end
