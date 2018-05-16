require 'fastlane/action'
require_relative '../helper/xccov_parse_lane_helper'

module Fastlane
  module Actions
    class XccovParseLaneAction < Action
      def self.run(params)
        UI.message("The xccov_parse_lane plugin is working!")

        message = "| target | line coverage |\n| :----: | :----: |\n"
        UI.message Helper::XccovParseLaneHelper.run.reduce(message) { |acc, item| acc << "| #{item[0]} | #{item[1]} |\n"}
      end

      def self.description
        "Parsing xccov"
      end

      def self.authors
        ["Kazuaki MATSUO"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Parsing xccov"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "XCCOV_PARSE_LANE_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
        true
      end
    end
  end
end
