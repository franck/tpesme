# capistrano deploy
set :application, "tpesme"
set :repo_url, "git@bitbucket.org:fdago/lilybulles.git"

set :tmp_dir, "/home/lilybulles/tmp/capistrano"

set :deploy_user, "tpesme"
set :deploy_to, "/home/tpesme/safetymotoride.fr/#{fetch(:stage)}"

set :linked_files, %w{public/wp-config.php public/.htaccess}
set :linked_dirs, %w{public/content/uploads}

namespace :deploy do
  desc "create WordPress files for symlinking"
  task :create_wp_files do
    on roles(:app) do
      execute :touch, "#{shared_path}/public/wp-config.php"
      execute :touch, "#{shared_path}/public/.htaccess"
    end
  end

  after 'check:make_linked_dirs', :create_wp_files
end

namespace :wordpress do
  namespace :config do
    desc "upload config files"
    task :upload do
      on roles(:app) do
        upload! "config/wp-config-#{fetch(:stage)}.php", "#{shared_path}/public/wp-config.php"
        #upload! "config/.htaccess", "#{shared_path}/public/.htaccess"
      end
    end
  end
end
before "deploy:check", "wordpress:config:upload"
