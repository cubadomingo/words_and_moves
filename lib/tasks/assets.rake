# lib/tasks/assets.rake
# The webpack task must run before assets:environment task.
# Otherwise Sprockets cannot find the files that webpack produces.
# This is the secret sauce for how a Heroku deployment knows to create the webpack generated JavaScript files.
Rake::Task["assets:precompile"]
  .clear_prerequisites
  .enhance(["assets:compile_environment"])

namespace :assets do
  # In this task, set prerequisites for the assets:precompile task
  task compile_environment: :webpack do
    Rake::Task["assets:environment"].invoke
  end

  desc "Compile assets with webpack"
  task :webpack do
    on roles fetch(:npm_roles) do
      within fetch(:npm_target_path, release_path) do
        with fetch(:npm_env_variables, {}) do
          run "cd client"
          execute :npm, 'npm run build:production'
        end
      end
    end
  end

  task :clobber do
    rm_r Dir.glob(Rails.root.join("app/assets/webpack/*"))
  end
end


#"cd client && npm run build:production"
