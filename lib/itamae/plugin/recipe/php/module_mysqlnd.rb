package 'php5-mysqlnd' do
  action :install
end

execute 'php5enmod mysqlnd' do
  command 'php5enmod mysqlnd'
  not_if "php -m | grep -q 'mysqlnd'"
end
