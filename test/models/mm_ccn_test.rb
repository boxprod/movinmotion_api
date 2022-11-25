require "test_helper"
require_relative 'mm_test'

class MmCcnTest < MmTest
  def setup
    @class = MmCcn
  end

  test 'it responds to #positions' do
    positions = MmCcn.all.sample.positions
    assert positions.is_a? Array
  end
end
