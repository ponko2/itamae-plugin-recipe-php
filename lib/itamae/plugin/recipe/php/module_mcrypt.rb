package 'php5-mcrypt' do
  action :install
end

execute 'php5enmod mcrypt' do
  command 'php5enmod mcrypt'
  not_if "php -m | grep -q 'mcrypt'"
end
