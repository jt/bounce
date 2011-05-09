module Bounce
  class Railtie < Rails::Railtie
    initializer 'bounce.initialize' do
      ActiveSupport.on_load(:active_record) do
        Bounce::Railtie.insert
      end
    end
  end

  class Railtie
    def self.insert
      ActiveRecord::Base.send :include, Bounce::ActiveRecordExtension
    end
  end
end
