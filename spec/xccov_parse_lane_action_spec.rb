describe Fastlane::Actions::XccovParseLaneAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The xccov_parse_lane plugin is working!")

      Fastlane::Actions::XccovParseLaneAction.run(nil)
    end
  end
end
