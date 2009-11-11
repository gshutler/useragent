require 'user_agent'

describe "Firefox browser", :shared => true do
  it "should return 'Firefox' as its browser" do
    @useragent.browser.should == "Firefox"
  end

  it "should return :strong as its security" do
    @useragent.security.should == :strong
  end
end

describe "UserAgent: 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008070206 Firefox/3.0.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008070206 Firefox/3.0.1")
  end

  it_should_behave_like "Firefox browser"

  it "should return '3.0.1' as its version" do
    @useragent.version.should == "3.0.1"
  end

  it "should return '2008070206' as its gecko version" do
    @useragent.gecko.version.should == "2008070206"
  end

  it "should return 'X11' as its platform" do
    @useragent.platform.should == "X11"
  end

  it "should return 'Linux i686' as its os" do
    @useragent.os.should == "Linux i686"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it_should_behave_like "Firefox browser"

  it "should return '2.0.0.14' as its version" do
    @useragent.version.should == "2.0.0.14"
  end

  it "should return '20080404' as its gecko version" do
    @useragent.gecko.version.should == "20080404"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X' as its os" do
    @useragent.os.should == "Intel Mac OS X"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it_should_behave_like "Firefox browser"

  it "should return '2.0.0.14' as its version" do
    @useragent.version.should == "2.0.0.14"
  end

  it "should return '20080404' as its gecko version" do
    @useragent.gecko.version.should == "20080404"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows XP' as its os" do
    @useragent.os.should == "Windows XP"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12")
  end

  it_should_behave_like "Firefox browser"

  it "should return '1.5.0.12' as its version" do
    @useragent.version.should == "1.5.0.12"
  end

  it "should return '20070508' as its gecko version" do
    @useragent.gecko.version.should == "20070508"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X Mach-O' as its os" do
    @useragent.os.should == "PPC Mac OS X Mach-O"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12")
  end

  it_should_behave_like "Firefox browser"

  it "should return '1.5.0.12' as its version" do
    @useragent.version.should == "1.5.0.12"
  end

  it "should return '20070508' as its gecko version" do
    @useragent.gecko.version.should == "20070508"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows XP' as its os" do
    @useragent.os.should == "Windows XP"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060612 Firefox/1.5.0.4 Flock/0.7.0.17.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060612 Firefox/1.5.0.4 Flock/0.7.0.17.1")
  end

  it_should_behave_like "Firefox browser"

  it "should return '1.5.0.4' as its version" do
    @useragent.version.should == "1.5.0.4"
  end

  it "should return '20060612' as its gecko version" do
    @useragent.gecko.version.should == "20060612"
  end

  it "should return 'X11' as its platform" do
    @useragent.platform.should == "X11"
  end

  it "should return 'Linux i686' as its os" do
    @useragent.os.should == "Linux i686"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en; rv:1.8.1.14) Gecko/20080409 Camino/1.6 (like Firefox/2.0.0.14)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en; rv:1.8.1.14) Gecko/20080409 Camino/1.6 (like Firefox/2.0.0.14)")
  end

  it "should return 'Camino' as its browser" do
    @useragent.browser.should == "Camino"
  end

  it "should return '1.6' as its version" do
    @useragent.version.should == "1.6"
  end

  it "should return '20080409' as its gecko version" do
    @useragent.gecko.version.should == "20080409"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X' as its os" do
    @useragent.os.should == "Intel Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe 'UserAgent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1) Gecko/20061024 Iceweasel/2.0 (Debian-2.0+dfsg-1)' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1) Gecko/20061024 Iceweasel/2.0 (Debian-2.0+dfsg-1)')
  end
  
  it "should return 'Iceweasel' as its browser" do
    @useragent.browser.should == "Iceweasel"
  end
  
  it "should return '2.0' as its version" do
    @useragent.version.should == "2.0"
  end
  
  it "should return '20061024' as its gecko version" do
    @useragent.gecko.version.should == "20061024"
  end
  
  it "should return 'X11' as its platform" do
    @useragent.platform.should == "X11"
  end

  it "should return 'Linux i686' as its os" do
    @useragent.os.should == "Linux i686"
  end
  
  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
  
end

describe 'UserAgent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.4) Gecko/20091017 SeaMonkey/2.0' do
  before do
    @useragent = UserAgent.parse('Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.4) Gecko/20091017 SeaMonkey/2.0')
  end

  it "should return 'Seamonkey' as its browser" do
    @useragent.browser.should == "Seamonkey"
  end

  it "should return '2.0' as its version" do
    @useragent.version.should == "2.0"
  end

  it "should return '20091017' as its gecko version" do
    @useragent.gecko.version.should == "20091017"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X 10.6' as its os" do
    @useragent.os.should == "Intel Mac OS X 10.6"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end

end