require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "Safari browser", :shared => true do
  it "should return 'Safari' as its browser" do
    @useragent.browser.should == "Safari"
  end

  it "should return :strong as its security" do
    @useragent.security.should == :strong
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it_should_behave_like "Safari browser"

  it "should return '526.8' as its build" do
    @useragent.build.should == "526.8"
  end

  it "should return '4.0dp1' as its version" do
    @useragent.version.should == "4.0dp1"
  end

  it "should return '526.9' as its webkit version" do
    @useragent.webkit.version.should == "526.9"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X 10_5_3' as its os" do
    @useragent.os.should == "Intel Mac OS X 10_5_3"
  end

  it "should return 'en-us' as its localization" do
    @useragent.localization.should == "en-us"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it_should_behave_like "Safari browser"

  it "should return '526.8' as its build" do
    @useragent.build.should == "526.8"
  end

  it "should return '4.0dp1' as its version" do
    @useragent.version.should == "4.0dp1"
  end

  it "should return '526.9' as its webkit version" do
    @useragent.webkit.version.should == "526.9"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows XP' as its os" do
    @useragent.os.should == "Windows XP"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
  end

  it_should_behave_like "Safari browser"

  it "should return '525.18' as its build" do
    @useragent.build.should == "525.18"
  end

  it "should return '3.1.1' as its version" do
    @useragent.version.should == "3.1.1"
  end

  it "should return '525.18' as its webkit version" do
    @useragent.webkit.version.should == "525.18"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X 10_5_3' as its os" do
    @useragent.os.should == "Intel Mac OS X 10_5_3"
  end

  it "should return 'en-us' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it "should be == 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
    @useragent.should == @useragent
  end

  it "should not be == 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    @useragent.should_not == UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it "should be > 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    @useragent.should > UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it "should not be > 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
    @useragent.should_not > UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it "should be < 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
    @useragent.should < UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it "should not be < 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
    @useragent.should_not < @useragent
  end

  it "should be >= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    @useragent.should >= UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it "should not be >= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
    @useragent.should_not >= UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it "should be <= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
    @useragent.should <= @useragent
  end

  it "should not be <= 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
    @useragent.should_not <= UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
  end

  it_should_behave_like "Safari browser"

  it "should return '525.18' as its build" do
    @useragent.build.should == "525.18"
  end

  it "should return '3.1.1' as its version" do
    @useragent.version.should == "3.1.1"
  end

  it "should return '525.18' as its webkit version" do
    @useragent.webkit.version.should == "525.18"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows XP' as its os" do
    @useragent.os.should == "Windows XP"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
  end

  it_should_behave_like "Safari browser"

  it "should return '419.3' as its build" do
    @useragent.build.should == "419.3"
  end

  it "should return '2.0.4' as its version" do
    @useragent.version.should == "2.0.4"
  end

  it "should return '419' as its webkit version" do
    @useragent.webkit.version.should == "419"
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

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.6' as its build" do
    @useragent.build.should == "312.6"
  end

  it "should return '1.3.2' as its version" do
    @useragent.version.should == "1.3.2"
  end

  it "should return '312.8' as its webkit version" do
    @useragent.webkit.version.should == "312.8"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12")
  end

  it_should_behave_like "Safari browser"

  it "should return '125.12' as its build" do
    @useragent.build.should == "125.12"
  end

  it "should return '1.2.4' as its version" do
    @useragent.version.should == "1.2.4"
  end

  it "should return '125.5.7' as its webkit version" do
    @useragent.webkit.version.should == "125.5.7"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419")
  end

  it_should_behave_like "Safari browser"

  it "should return '419' as its build" do
    @useragent.build.should == "419"
  end

  it "should return '3.0' as its version" do
    @useragent.version.should == "3.0"
  end

  it "should return '420.1' as its webkit version" do
    @useragent.webkit.version.should == "420.1"
  end

  it "should return 'iPhone' as its platform" do
    @useragent.platform.should == "iPhone"
  end

  it "should return 'CPU like Mac OS X' as its os" do
    @useragent.os.should == "CPU like Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419")
  end

  it_should_behave_like "Safari browser"

  it "should return '419' as its build" do
    @useragent.build.should == "419"
  end

  it "should return '3.0' as its version" do
    @useragent.version.should == "3.0"
  end

  it "should return '420.1' as its webkit version" do
    @useragent.webkit.version.should == "420.1"
  end

  it "should return 'iPod' as its platform" do
    @useragent.platform.should == "iPod"
  end

  it "should return 'CPU like Mac OS X' as its os" do
    @useragent.os.should == "CPU like Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13")
  end

  it "should return 'Chrome' as its browser" do
    @useragent.browser.should == "Chrome"
  end

  it "should return '525.13' as its build" do
    @useragent.build.should == "525.13"
  end

  it "should return '0.0.2' as its version" do
    @useragent.version.should == "0.0.2"
  end

  it "should return '525.13' as its webkit version" do
    @useragent.webkit.version.should == "525.13"
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
