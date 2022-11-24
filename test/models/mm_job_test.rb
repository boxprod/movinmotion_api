require "test_helper"

class MmJobTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  test 'it responds to #all' do
    all = MmJob.all
    assert all
  end

  test 'it responds to #first' do
    first = MmJob.first
    assert first
  end

  test 'it responds to #find' do
    id = MmJob.all.sample.id
    assert MmJob.find(id)
  end

  test 'it responds to #count' do
    count = MmJob.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = MmJob.where(idccNumbers: '2642')
    assert where
  end

  test 'it raises an error if wrong type in #where' do
    MmJob.where(idccNumbers: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end

  test 'it responds to #categories' do
    categories = MmJob.categories
    assert categories
  end
end
