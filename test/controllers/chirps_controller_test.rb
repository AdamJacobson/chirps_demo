require 'test_helper'

describe ChirpsController do
  let(:controller) { ChirpsController.new }

  describe 'index' do
    it 'gets_all' do
      controller.index
      all = controller.instance_variable_get(:@chirps)
      assert_equal(all.size, Chirp.all.size)
    end
  end
end
