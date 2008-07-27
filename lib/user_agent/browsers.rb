Dir["#{File.dirname(__FILE__)}/browsers/*.rb"].each do |browser|
  require browser
end

class UserAgent
  module Browsers
    Security = {
      "N" => :none,
      "U" => :strong,
      "I" => :weak
    }.freeze unless defined? Security

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
