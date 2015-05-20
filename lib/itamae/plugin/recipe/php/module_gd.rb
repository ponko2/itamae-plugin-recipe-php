package 'php5-gd' do
  action :install
end

execute 'php5enmod gd' do
  command 'php5enmod gd'
  not_if "php -m | grep -q 'gd'"
end
