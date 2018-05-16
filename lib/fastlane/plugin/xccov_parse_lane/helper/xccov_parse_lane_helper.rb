require 'fastlane_core/ui/ui'
require 'xccov-parse'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class XccovParseLaneHelper
      # class methods that you define here become available in your action
      # as `Helper::XccovParseLaneHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the xccov_parse_lane plugin helper!")
      end

      def self.run(*args)
        xccov = ::Xccov.new
        xccov.help
        json = xccov.view '--only-targets', '--json', './spec/build/logs/test/*.xccovreport'
        ::Xccov::Parse.new(json: json).targets_line_coverage
      end
    end
  end
end
