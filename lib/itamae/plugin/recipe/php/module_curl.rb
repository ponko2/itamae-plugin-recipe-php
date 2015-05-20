package 'php5-curl' do
  action :install
end

execute 'php5enmod curl' do
  command 'php5enmod curl'
  not_if "php -m | grep -q 'curl'"
end
