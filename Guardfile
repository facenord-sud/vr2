# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Guard::Compass
#
# You don't need to configure watchers for guard 'compass' declaration as they generated
# from your Compass configuration file. You might need to define the Compass working directory
# and point to the configuration file depending of your project structure.
#
# Available options:
#
# * :workging_directory => Define the Compass working directory, relative to the Guardfile directory
# * :configuration_file => Path to the Compass configuration file, relative to :project_path
#
# Like usual, the Compass configuration path are relative to the :project_path

# guard 'compass', :project_path => 'not_current_dir', :configuration_file => 'path/to/my/compass_config.rb'
guard :compass

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html))).*}) { |m| "/assets/#{m[3]}" }
end

#guard 'rspec', :version => 2 do
#  watch(%r{^spec/.+_spec\.rb$})
#  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
#  watch('spec/spec_helper.rb')  { "spec" }
#
#  # Rails example
#  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
#  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
#  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
#  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
#  watch('config/routes.rb')                           { "spec/routing" }
#  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
#
#  # Capybara request specs
#  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
#
#  # Turnip features and steps
#  watch(%r{^spec/acceptance/(.+)\.feature$})
#  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
#end
#
#
#guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
#  watch('config/application.rb')
#  watch('config/environment.rb')
#  watch('config/environments/test.rb')
#  watch(%r{^config/initializers/.+\.rb$})
#  watch('Gemfile')
#  watch('Gemfile.lock')
#  watch('spec/spec_helper.rb') { :rspec }
#  watch('test/test_helper.rb') { :test_unit }
#  watch(%r{features/support/}) { :cucumber }
#end
