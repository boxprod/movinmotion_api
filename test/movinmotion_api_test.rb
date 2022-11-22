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
    assert MovinmotionApi.list_ccns
  end

  test "it doesnt fetch private data without configuration" do
    assert_not MovinmotionApi.workers.success?
  end
end
