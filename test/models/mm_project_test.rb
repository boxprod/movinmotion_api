require "test_helper"

class MmProjectTest < ActiveSupport::TestCase
  MovinmotionApi.configure do |mm|
    mm.use_classes = true
  end

  test 'it responds to #all' do
    all = Mm::Project.all
    assert all
  end

  test 'it responds to #first' do
    first = Mm::Project.first
    assert first
  end

  test 'it responds to #find' do
    id = Mm::Project.all.sample.id
    assert Mm::Project.find(id)
  end

  test 'it responds to #count' do
    count = Mm::Project.count
    assert count
    assert count.instance_of? Integer
  end

  test 'it responds to #where' do
    where = Mm::Project.where(idcc_number: '2642')
    assert where
    assert_not where.empty?
  end

  test 'it raises an error if wrong type in #where' do
    Mm::Project.where(idcc_number: 2642)
  rescue StandardError => e
    assert e.message.include?('class')
  end
end
