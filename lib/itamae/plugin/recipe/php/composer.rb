require 'shellwords'

node.validate! do
  {
    php: {
      composer: {
        install_dir: optional(string),
        oauth_token: string
      }
    }
  }
end

node.reverse_merge!(
  php: {
    composer: {
      install_dir: '/usr/local/bin'
    }
  }
)

execute 'install composer' do
  cmd = '/usr/bin/curl -sS https://getcomposer.org/installer | /usr/bin/php --'
  cmd << " --install-dir=#{node[:php][:composer][:install_dir]}"
  cmd << ' --filename=composer'
  command cmd
  not_if 'which composer'
end

execute 'composer config' do
  cmd = "#{node[:php][:composer][:install_dir]}/composer"
  cmd << ' config --global github-oauth.github.com '
  cmd << Shellwords.escape(node[:php][:composer][:oauth_token])
  command cmd
end
