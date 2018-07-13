# This removes the Grub quiet flag allowing you to see what's going on while your PC is booting
execute 'remove_grub_quiet' do
  command "/bin/sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/quiet //g' /etc/default/grub"
  live_stream true
  notifies :run, 'execute[update_grub]', :delayed
  only_if { File.read('/etc/default/grub').include?('quiet') }
end

# This disables the Nouveau nvidia driver
execute 'disable_nouveau_modeset' do
  command "/bin/sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/ s/\"$/ nouveau.modeset=0\"/' /etc/default/grub"
  live_stream true
  notifies :run, 'execute[update_grub]', :delayed
  not_if { File.read('/etc/default/grub').include?('nouveau.modeset=0') } 
end

# Update grub if its config has been modified
execute 'update_grub' do
  command '/usr/sbin/update-grub'
  live_stream true
  action :nothing
end
