# frozen_string_literal: true

class UserAgent
  module OperatingSystems
    ##
    # This module provides mappings of Darwin Kernel versions to various platforms.
    # The data is provided by https://www.theiphonewiki.com/wiki/Kernel
    module Darwin
      # A mapping of Darwin kernel versions to watchOS versions
      WATCH_OS = {
        '15.0.0' => '2.1',
        '16.0.0' => '3.0',
        '16.1.0' => '3.1',
        '16.3.0' => '3.1.1',
        '16.5.0' => '3.2',
        '16.6.0' => '3.2.2',
        '16.7.0' => '3.2.3',
        '17.0.0' => '4.0.x',
        '17.2.0' => '4.1',
        '17.3.0' => '4.2',
        '17.4.0' => '4.2.2',
        '17.5.0' => '4.3',
        '17.6.0' => '4.3.1',
        '17.7.0' => '4.3.2',
        '18.0.0' => '5.0.x',
        '18.2.0' => '5.1.x',
        '18.5.0' => '5.2.x', # also 5.3.x
        '19.0.0' => '6.0.x', # also 6.1.
        '19.2.0' => '6.1.x',
        '19.4.0' => '6.2.1',
        '19.5.0' => '6.2.5', # also 6.2.6
        '19.6.0' => '6.2.8',
        '20.0.0' => '7.0.x',
        '20.1.0' => '7.1'
      }.freeze
    end
  end
end
