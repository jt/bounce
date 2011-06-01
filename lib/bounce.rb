require 'rails'

module Bounce
  module ActiveRecordExtension
    extend ActiveSupport::Concern

    def bounce(params=nil)
      tap { |o| params.present? ? o.update_attributes(params) : o.save }
    end
  end

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
