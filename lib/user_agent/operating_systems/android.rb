# frozen_string_literal: true

class UserAgent
  module OperatingSystems
    ##
    # This module provides mappings of Android SDK level to release.
    # The data is provided by https://developer.android.com/studio/releases/platforms
    module Android
      # A mapping of SDK/API level to release
      SDK = {
        '9'  => '2.3',
        '10' => '2.3.3',
        '11' => '3.0',
        '12' => '3.1',
        '13' => '3.2',
        '14' => '4.0',
        '15' => '4.0.3',
        '16' => '4.1',
        '17' => '4.2',
        '18' => '4.3',
        '19' => '4.4',
        '20' => '4.4W',
        '21' => '5.0',
        '22' => '5.1',
        '23' => '6.0',
        '24' => '7.0',
        '25' => '7.1',
        '26' => '8.0',
        '27' => '8.1',
        '28' => '9',
        '29' => '10',
        '30' => '11',
      }.freeze
    end
  end
end
