namespace :deploy do
  desc 'Compile Vite Ruby'
  task :compile_vite_ruby => [:set_rails_env] do
    invoke! 'deploy:assets:compile_vite'
  end

  namespace :assets do
    task :compile_vite do
      on release_roles(fetch(:assets_roles)) do
        within "#{release_path}" do
          with rails_env: fetch(:rails_env), rails_groups: fetch(:rails_assets_groups) do
            execute :bundle, 'exec bin/vite build --force'
          end
        end
      end
    end
  end
end
