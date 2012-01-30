require 'spec_helper'

module Adhearsion::Asterisk
  describe 'plugin loading' do
    before(:all) { Adhearsion::Plugin.init_plugins }

    let(:mock_call) { stub_everything 'Call' }

    it 'should monkeypatch Adhearsion::CallController' do
      cc = Adhearsion::CallController.new(mock_call)
      cc.expects(:play_time).returns true
      cc.play
    end

    it 'should extend Adhearsion::CallController with Asterisk methods' do
      Adhearsion::CallController.new(mock_call).should respond_to :play_time
    end
  end
end
