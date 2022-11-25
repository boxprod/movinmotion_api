require "test_helper"

class MmTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  def setup
    @class = Mm
  end


  test 'class name is defined' do
    assert @class unless is_a? MmTest
  end

  test 'it responds to #all' do
    all = @class.all
    assert all
  end

  test 'it responds to #first' do
    first = @class.first
    assert first
  end

  test 'it responds to #find' do
    id = @class.all.sample.id
    assert @class.find(id)
  end

  test 'it responds to #count' do
    count = @class.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = @class.where(idcc_numbers: '2642')
    assert where
    assert_not where.empty?
  end

  test 'it raises an error if wrong type in #where' do
    @class.where(idcc_numbers: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end
end
