Capistrano::Configuration.instance.load do
  namespace :db do
    desc "Load seed data into Mongoid database"
    task :seed_fu do
      run %{cd #{release_path} && bundle exec rake RAILS_ENV=#{rails_env} db:seed_fu}
    end
  end

  after 'deploy:update_code', 'db:seed_fu'
end
