class Railtie < Rails::Railtie
  config.before_initialize do
    ActiveRecord::Base.send :include, Bounce::ActiveRecordExtension
  end
end
