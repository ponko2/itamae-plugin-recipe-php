package 'php5-mysql' do
  action :install
end

execute 'php5enmod mysql' do
  command 'php5enmod mysql'
  not_if "php -m | grep -q 'mysql'"
end
