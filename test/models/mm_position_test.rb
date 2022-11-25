require "test_helper"

class MmPositionTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  test 'it responds to #all' do
    all = MmPosition.all
    assert all
  end

  test 'it responds to #first' do
    first = MmPosition.first
    assert first
  end

  test 'it responds to #find' do
    id = MmPosition.all.sample.id
    assert MmPosition.find(id)
  end

  test 'it responds to #count' do
    count = MmPosition.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = MmPosition.where(idcc_numbers: '2642')
    assert where
    assert_not where.empty?
  end

  test 'it raises an error if wrong type in #where' do
    MmPosition.where(idcc_numbers: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end

  test 'it responds to #categories' do
    categories = MmPosition.categories
    assert categories
  end

  test 'it fetch details on an instance of a position' do
    ccn = MmCcn.all.sample
    position = ccn.positions.sample
    assert position.ccn_details(ccn: ccn)
  end
end
