module Bounce
  module ActiveRecordExtension
    extend ActiveSupport::Concern

    def bounce(params=nil)
      if params.present?
        tap {|o| o.update_attributes(params) }
      else
        tap(&:save)
      end
    end
  end
end
