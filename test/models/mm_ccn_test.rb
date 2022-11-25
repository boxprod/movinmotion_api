require "test_helper"

class MmCcnTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  test 'it responds to #all' do
    all = MmCcn.all
    assert all
  end

  test 'it responds to #first' do
    first = MmCcn.first
    assert first
  end

  test 'it responds to #find' do
    id = MmCcn.all.sample.id
    assert MmCcn.find(id)
  end

  test 'it responds to #count' do
    count = MmCcn.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = MmCcn.where(idcc_number: '2642')
    assert where
    assert_not where.empty?
  end

  test 'it raises an error if wrong type in #where' do
    MmCcn.where(idcc_number: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end

  test 'it responds to #positions' do
    positions = MmCcn.all.sample.positions
    assert positions.is_a? Array
  end

  test 'it responds to #positions_by_crew' do
    positions = MmCcn.all.sample.positions_by_crew
    assert positions.is_a? Hash
  end

  test 'it responds to #positions_names_by_crew' do
    positions = MmCcn.all.sample.positions_names_by_crew
    assert positions.is_a? Hash
  end
end
