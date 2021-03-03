require 'test_helper'

describe Chirp do
  subject { Chirp.new(message: 'test') }

  describe 'message' do
    it 'has_a_message' do
      assert_equal('test', subject.message)
    end
  end
end
