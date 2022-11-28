require "test_helper"

class Mm::PositionTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  test 'it responds to #all' do
    all = Mm::Position.all
    assert all
  end

  test 'it responds to #first' do
    first = Mm::Position.first
    assert first
  end

  test 'it responds to #find' do
    id = Mm::Position.all.sample.id
    assert Mm::Position.find(id)
  end

  test 'it responds to #count' do
    count = Mm::Position.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = Mm::Position.where(idcc_numbers: '2642')
    assert where
    assert_not where.empty?
  end

  test 'it raises an error if wrong type in #where' do
    Mm::Position.where(idcc_numbers: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end

  test 'it responds to #categories' do
    categories = Mm::Position.categories
    assert categories
  end

  test 'it fetch details on an instance of a position' do
    ccn = Mm::Ccn.all.sample
    position = ccn.positions.sample
    assert position.ccn_details(ccn: ccn)
  end
end
