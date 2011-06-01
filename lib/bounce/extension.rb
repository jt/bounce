module Bounce
  module ActiveRecordExtension
    extend ActiveSupport::Concern

    def bounce(params=nil)
      tap { |o| params.present? ? o.update_attributes(params) : o.save }
    end
  end
end
