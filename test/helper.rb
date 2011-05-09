require 'active_record'
require 'test/unit'
require 'redgreen'
require 'bounce'

ActiveRecord::Base.establish_connection \
  :adapter => 'sqlite3',
  :database => File.dirname(__FILE__) + '/fixtures/bounce.sqlite3'
load File.dirname(__FILE__) + '/fixtures/schema.rb'
load File.dirname(__FILE__) + '/fixtures/article.rb'

Bounce::Railtie.insert

class Test::Unit::TestCase; end
