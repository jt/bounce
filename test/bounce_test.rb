$LOAD_PATH.unshift File.dirname(__FILE__)
require 'helper'

class BounceTest < Test::Unit::TestCase

  def test_return_object
    article = Article.new(:name => 'foobar')
    subject = article.bounce
    assert_equal true, subject.persisted?
    assert_equal Article, subject.class
  end

  def test_save_new_object
    article = Article.new(:name => 'foo')
    subject = article.bounce
    assert_equal true,  subject.persisted?
    assert_equal 'foo', subject.name
  end

  def test_save_new_object_invalid
    article = Article.new(:name => '')
    subject = article.bounce
    assert_equal false, subject.persisted?
    assert_equal false, subject.valid?
  end

  def test_save_existing_object
    article      = Article.create(:name => 'foo')
    article.name = 'bar'
    subject      = article.bounce
    assert_equal false, subject.changed?
    assert_equal 'bar', subject.name
  end

  def test_save_existing_object_invalid
    article      = Article.create(:name => 'foo')
    article.name = ''
    subject      = article.bounce
    assert_equal true, subject.changed?
    assert_equal false, subject.valid?
  end

  def test_update_attributes_of_new_object
    article = Article.new
    subject = article.bounce(:name => 'foo')
    assert_equal true,  subject.persisted?
    assert_equal 'foo', subject.name
  end

  def test_update_attributes_of_new_object_invalid
    article = Article.new
    subject = article.bounce(:name => '')
    assert_equal false, subject.persisted?
    assert_equal false, subject.valid?
  end

  def test_update_attributes_of_existing_object
    article = Article.create(:name => 'foo')
    subject = article.bounce(:name => 'bar')
    assert_equal false, subject.changed?
    assert_equal 'bar', subject.name
  end

  def test_update_attributes_of_existing_object_invalid
    article = Article.create(:name => 'foo')
    subject = article.bounce(:name => '')
    assert_equal true, subject.changed?
    assert_equal false, subject.valid?
  end
end
