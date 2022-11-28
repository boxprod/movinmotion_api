require "test_helper"

class MovinmotionApiTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert MovinmotionApi::VERSION
  end

  test "it respond to configure" do
    assert MovinmotionApi.configure do |movinmotion|
      movinmotion.cookie = 'test'
    end
  end

  test "it fetch public data without configuration" do
    MovinmotionApi::Configuration.reset
    ccns = MovinmotionApi.list_ccns
    assert ccns.success?
  end

  test "it doesnt fetch private data without configuration" do
    MovinmotionApi::Configuration.reset
    assert_not MovinmotionApi.workers.success?
  end

  test "it does fetch private data with configuration" do
    MovinmotionApi.configure do |movinmotion|
      cookie_file = File.join(Rails.root, 'storage', 'movinmotion_cookie.txt')
      movinmotion.cookie = File.open(cookie_file).read.strip
    end
    worker_info = MovinmotionApi.worker_info(email: 'vh@box.paris')
    assert worker_info.success?
  end

  test 'it allows the use of classes to manage movinmotion data' do
    MovinmotionApi.configure do |mm|
      mm.use_classes = true
    end
    assert Mm::Position.first
  end

  test 'it fetch details on a specific position' do
    MovinmotionApi.configure do |mm|
      mm.use_classes = true
    end
    position = Mm::Position.where(idcc_numbers: '2642').sample
    details = MovinmotionApi.get_ccn_position(id: position.id, idcc_number: '2642')
    assert details.success?
  end
end
