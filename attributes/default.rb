default['ubuntu_i3-gaps_workstation']['user'] = ''
default['ubuntu_i3-gaps_workstation']['tmp_dir'] = "/home/#{node['ubuntu_i3-gaps_workstation']['user']}/Tmp"

default['ubuntu_i3-gaps_workstation']['i3-gaps']['install'] = true
default['ubuntu_i3-gaps_workstation']['i3-gaps']['repo_url'] = 'https://github.com/Airblader/i3.git'

default['ubuntu_i3-gaps_workstation']['polybar']['install'] = true
default['ubuntu_i3-gaps_workstation']['polybar']['repo_url'] = 'https://github.com/jaagr/polybar'

default['ubuntu_i3-gaps_workstation']['termite']['install'] = true
default['ubuntu_i3-gaps_workstation']['termite']['repo_url'] = 'https://github.com/thestinger/termite.git'
default['ubuntu_i3-gaps_workstation']['termite']['vte-ng']['repo_url'] = 'https://github.com/thestinger/vte-ng.git'
