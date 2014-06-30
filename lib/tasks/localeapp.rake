namespace :localeapp do
  desc "Pulls *.yml files from localeapp server"
  task :pull do
    require 'localeapp'
    Localeapp::CLI::Pull.new.execute
  end
end

desc "Actualizes js locales"
task 'js:locales' => ['localeapp:pull', 'i18n:js:export']