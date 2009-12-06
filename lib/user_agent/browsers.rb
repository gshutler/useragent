class UserAgent
  module Browsers
    autoload :All, 'user_agent/browsers/all'
    autoload :Gecko, 'user_agent/browsers/gecko'
    autoload :InternetExplorer, 'user_agent/browsers/internet_explorer'
    autoload :Opera, 'user_agent/browsers/opera'
    autoload :Webkit, 'user_agent/browsers/webkit'

    Security = {
      "N" => :none,
      "U" => :strong,
      "I" => :weak
    }.freeze

    def self.all
      [InternetExplorer, Webkit, Opera, Gecko]
    end

    def self.extend(array)
      array.extend(All)
      all.each do |extension|
        return array.extend(extension) if extension.extend?(array)
      end
    end
  end
end
