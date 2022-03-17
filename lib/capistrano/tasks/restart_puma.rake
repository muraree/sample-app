namespace :deploy do
  desc 'Restart Puma Server'
  task :restart_puma_server => [:set_rails_env] do
    invoke! 'deploy:puma:restart_server'
  end

  namespace :puma do
    task :restart_server do
      on roles(:app), in: :sequence, wait: 5 do
        invoke! 'puma:restart'
      end
    end
  end
end
