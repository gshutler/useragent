require 'user_agent'

shared_examples_for "Safari browser" do
  it "should return 'Safari' as its browser" do
    @useragent.browser.should == "Safari"
  end

  it "should return :strong as its security" do
    @useragent.security.should == :strong
  end

  it { @useragent.should be_webkit }
end

describe "UserAgent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16")
  end

  it_should_behave_like "Safari browser"

  it "should return '533.16' as its build" do
    @useragent.build.should == "533.16"
  end

  it "should return '5.0' as its version" do
    @useragent.version.should == "5.0"
  end

  it "should return '533.16' as its webkit version" do
    @useragent.webkit.version.should == "533.16"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X 10_6_3' as its os" do
    @useragent.os.should == "Intel Mac OS X 10_6_3"
  end

  it "should return 'en-us' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it_should_behave_like "Safari browser"

  it "should return '526.8' as its build" do
    @useragent.build.should == "526.9"
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

  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
  end

  it_should_behave_like "Safari browser"

  it "should return '526.8' as its build" do
    @useragent.build.should == "526.9"
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

  it { @useragent.should_not be_mobile }
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
    @useragent.build.should == "419"
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

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2")
  end

  it_should_behave_like "Safari browser"

  it "should return '412.2' as its build" do
    @useragent.build.should == "412.6"
  end

  it "should return '2.0' as its version" do
    @useragent.version.should == "2.0"
  end

  it "should return '412.6' as its webkit version" do
    @useragent.webkit.version.should == "412.6"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2")
  end

  it_should_behave_like "Safari browser"

  it "should return '412.2.2' as its build" do
    @useragent.build.should == "412.6.2"
  end

  it "should return '2.0' as its version" do
    @useragent.version.should == "2.0"
  end

  it "should return '412.6.2' as its webkit version" do
    @useragent.webkit.version.should == "412.6.2"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
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
    @useragent.build.should == "312.8"
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

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312")
  end

  it_should_behave_like "Safari browser"

  it "should return '312' as its build" do
    @useragent.build.should == "312.1.1"
  end

  it "should return '1.3' as its version" do
    @useragent.version.should == "1.3"
  end

  it "should return '312.1.1' as its webkit version" do
    @useragent.webkit.version.should == "312.1.1"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "fr-ch"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.3.3' as its build" do
    @useragent.build.should == "312.5.2"
  end

  it "should return '1.3.1' as its version" do
    @useragent.version.should == "1.3.1"
  end

  it "should return '312.5.2' as its webkit version" do
    @useragent.webkit.version.should == "312.5.2"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "es-es"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.3.1' as its build" do
    @useragent.build.should == "312.5.1"
  end

  it "should return '1.3.1' as its version" do
    @useragent.version.should == "1.3.1"
  end

  it "should return '312.5.1' as its webkit version" do
    @useragent.webkit.version.should == "312.5.1"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "fr"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3")
  end

  it_should_behave_like "Safari browser"

  it "should return '312.3' as its build" do
    @useragent.build.should == "312.5"
  end

  it "should return '1.3.1' as its version" do
    @useragent.version.should == "1.3.1"
  end

  it "should return '312.5' as its webkit version" do
    @useragent.webkit.version.should == "312.5"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/124 (KHTML, like Gecko) Safari/125'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/124 (KHTML, like Gecko) Safari/125")
  end

  it_should_behave_like "Safari browser"

  it "should return '125' as its build" do
    @useragent.build.should == "124"
  end

  it "should return '1.2' as its version" do
    @useragent.version.should == "1.2"
  end

  it "should return '124' as its webkit version" do
    @useragent.webkit.version.should == "124"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12")
  end

  it_should_behave_like "Safari browser"

  it "should return '125.12' as its build" do
    @useragent.build.should == "125.5.7"
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

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5")
  end

  it_should_behave_like "Safari browser"

  it "should return '85.5' as its build" do
    @useragent.build.should == "85.7"
  end

  it "should return '1.0' as its version" do
    @useragent.version.should == "1.0"
  end

  it "should return '85.7' as its webkit version" do
    @useragent.webkit.version.should == "85.7"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'PPC Mac OS X' as its os" do
    @useragent.os.should == "PPC Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "fr-fr"
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419")
  end

  it_should_behave_like "Safari browser"

  it "should return '419' as its build" do
    @useragent.build.should == "420.1"
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

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419")
  end

  it_should_behave_like "Safari browser"

  it "should return '419' as its build" do
    @useragent.build.should == "420.1"
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

  it { @useragent.should be_mobile }
end

describe "UserAgent: Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10")
  end

  it_should_behave_like "Safari browser"

  it "should return '531.21.10' as its build" do
    @useragent.build.should == "531.21.10"
  end

  it "should return '3.2' as its version" do
    @useragent.version.should == "3.2"
  end

  it "should return '531.21.10' as its webkit version" do
    @useragent.webkit.version.should == "531.21.10"
  end

  it "should return 'iPod' as its platform" do
    @useragent.platform.should == "iPad"
  end

  it "should return 'CPU like Mac OS X' as its os" do
    @useragent.os.should == "CPU OS 3_2 like Mac OS X"
  end

  it "should return 'en-us' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16")
  end

  it_should_behave_like "Safari browser"

  it "should return '528.18' as its build" do
    @useragent.build.should == "528.18"
  end

  it "should return '3.1.3' as its version" do
    @useragent.version.should == "3.1.3"
  end

  it "should return '528.18' as its webkit version" do
    @useragent.webkit.version.should == "528.18"
  end

  it "should return 'iPhone' as its platform" do
    @useragent.platform.should == "iPhone"
  end

  it "should return 'CPU like Mac OS X' as its os" do
    @useragent.os.should == "CPU iPhone OS 3_1_3 like Mac OS X"
  end

  it "should return 'en-us' as its localization" do
    @useragent.localization.should == "en-us"
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16")
  end

  it_should_behave_like "Safari browser"

  it "should return '528.18' as its build" do
    @useragent.build.should == "528.18"
  end

  it "should return '3.1.3' as its version" do
    @useragent.version.should == "3.1.3"
  end

  it "should return '528.18' as its webkit version" do
    @useragent.webkit.version.should == "528.18"
  end

  it "should return 'iPod' as its platform" do
    @useragent.platform.should == "iPod"
  end

  it "should return 'CPU like Mac OS X' as its os" do
    @useragent.os.should == "CPU iPhone OS 3_1_3 like Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4")
  end

  it_should_behave_like "Safari browser"

  it "should return '533.19.4' as its build" do
    @useragent.build.should == "533.19.4"
  end

  it "should return '5.0.3' as its version" do
    @useragent.version.should == "5.0.3"
  end

  it "should return '533.19.4' as its webkit version" do
    @useragent.webkit.version.should == "533.19.4"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X 10_6_5' as its os" do
    @useragent.os.should == "Intel Mac OS X 10_6_5"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7")
  end

  it_should_behave_like "Safari browser"

  it "should return '532.9' as its build" do
    @useragent.build.should == "532.9"
  end

  it "should return '4.1' as its version" do
    @useragent.version.should == "4.1"
  end

  it "should return '532.9' as its webkit version" do
    @useragent.webkit.version.should == "532.9"
  end

  it "should return 'iPhone' as its platform" do
    @useragent.platform.should == "iPhone"
  end

  it "should return 'CPU iPhone OS 4_1 like Mac OS X'" do
    @useragent.os.should == "CPU iPhone OS 4_1 like Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Mobile/8A306'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Mobile/8A306")
  end

  it_should_behave_like "Safari browser"

  it "should return '532.9' as its build" do
    @useragent.build.should == "532.9"
  end

  it "should return '4.0.1' as its version" do
    @useragent.version.should == "4.0.1"
  end

  it "should return '532.9' as its webkit version" do
    @useragent.webkit.version.should == "532.9"
  end

  it "should return 'iPhone' as its platform" do
    @useragent.platform.should == "iPhone"
  end

  it "should return 'CPU iPhone OS 4_0_1 like Mac OS X'" do
    @useragent.os.should == "CPU iPhone OS 4_0_1 like Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (iPhone Simulator; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306 Safari/6531.22.7'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone Simulator; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306 Safari/6531.22.7")
  end

  it_should_behave_like "Safari browser"

  it "should return '532.9' as its build" do
    @useragent.build.should == "532.9"
  end

  it "should return '4.0.1' as its version" do
    @useragent.version.should == "4.0.1"
  end

  it "should return '532.9' as its webkit version" do
    @useragent.webkit.version.should == "532.9"
  end

  it "should return 'iPhone' as its platform" do
    @useragent.platform.should == "iPhone Simulator"
  end

  it "should return 'CPU iPhone OS 4_0_1 like Mac OS X'" do
    @useragent.os.should == "CPU iPhone OS 4_0_1 like Mac OS X"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en-us"
  end

  it { @useragent.should be_mobile }
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

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0")
  end

  it "should return 'Chrome' as its browser" do
    @useragent.browser.should == "Chrome"
  end

  it "should return '533.2' as its build" do
    @useragent.build.should == "533.2"
  end

  it "should return '6.0' as its version" do
    @useragent.version.should == "6.0"
  end

  it "should return '533.2' as its webkit version" do
    @useragent.webkit.version.should == "533.2"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows 7' as its os" do
    @useragent.os.should == "Windows 7"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
  end

  it "should return 'Chrome' as its browser" do
    @useragent.browser.should == "Chrome"
  end

  it "should return '534.10' as its build" do
    @useragent.build.should == "534.10"
  end

  it "should return '8.0.552.231' as its version" do
    @useragent.version.should == "8.0.552.231"
  end

  it "should return '534.10' as its webkit version" do
    @useragent.webkit.version.should == "534.10"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'Intel Mac OS X 10_6_5' as its os" do
    @useragent.os.should == "Intel Mac OS X 10_6_5"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pre/1.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pre/1.1")
  end

  it "should return 'webOS' as its browser" do
    @useragent.browser.should == "webOS"
  end

  it "should return '532.2' as its build" do
    @useragent.build.should == "532.2"
  end

  it "should return '1.0' as its version" do
    @useragent.version.should == "1.0"
  end

  it "should return '532.2' as its webkit version" do
    @useragent.webkit.version.should == "532.2"
  end

  it "should return 'webOS' as its platform" do
    @useragent.platform.should == "webOS"
  end

  it "should return 'Palm Pre 1.1' as its os" do
    @useragent.os.should == "Palm Pre 1.1"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pixi/1.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pixi/1.1")
  end

  it "should return 'webOS' as its browser" do
    @useragent.browser.should == "webOS"
  end

  it "should return '532.2' as its build" do
    @useragent.build.should == "532.2"
  end

  it "should return '1.0' as its version" do
    @useragent.version.should == "1.0"
  end

  it "should return '532.2' as its webkit version" do
    @useragent.webkit.version.should == "532.2"
  end

  it "should return 'webOS' as its platform" do
    @useragent.platform.should == "webOS"
  end

  it "should return 'Palm Pixi 1.1' as its os" do
    @useragent.os.should == "Palm Pixi 1.1"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Linux; U; Android 1.5; de-; HTC Magic Build/PLAT-RC33) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 1.5; de-; HTC Magic Build/PLAT-RC33) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1")
  end

  it "should return 'Android' as its browser" do
    @useragent.browser.should == "Android"
  end

  it "should return '528.5+' as its build" do
    @useragent.build.should == "528.5+"
  end

  it "should return '3.1.2' as its version" do
    @useragent.version.should == "3.1.2"
  end

  it "should return '528.5+' as its webkit version" do
    @useragent.webkit.version.should == "528.5+"
  end

  it "should return 'Linux' as its platform" do
    @useragent.platform.should == "Linux"
  end

  it "should return 'Android 1.5' as its os" do
    @useragent.os.should == "Android 1.5"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (Linux; U; Android 2.1-update1; en-us; Nexus One Build/ERE27) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17 Chrome/4.1.249.1025'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 2.1-update1; en-us; Nexus One Build/ERE27) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17 Chrome/4.1.249.1025")
  end

  it "should return 'Android' as its browser" do
    @useragent.browser.should == "Android"
  end

  it "should return '530.17' as its build" do
    @useragent.build.should == "530.17"
  end

  it "should return '4.0' as its version" do
    @useragent.version.should == "4.0"
  end

  it "should return '530.17' as its webkit version" do
    @useragent.webkit.version.should == "530.17"
  end

  it "should return 'Linux' as its platform" do
    @useragent.platform.should == "Linux"
  end

  it "should return 'Android 2.1-update1' as its os" do
    @useragent.os.should == "Android 2.1-update1"
  end

  it { @useragent.should be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en) AppleWebKit/534.1+ (KHTML, Like Gecko) Version/6.0.0.141 Mobile Safari/534.1+'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en) AppleWebKit/534.1+ (KHTML, Like Gecko) Version/6.0.0.141 Mobile Safari/534.1+")
  end

  it "should return 'BlackBerry' as its browser" do
    @useragent.browser.should == "BlackBerry"
  end

  it "should return '534.1+' as its build" do
    @useragent.build.should == "534.1+"
  end

  it "should return '6.0.0.141' as its version" do
    @useragent.version.should == "6.0.0.141"
  end

  it "should return '534.1+' as its webkit version" do
    @useragent.webkit.version.should == "534.1+"
  end

  it "should return 'BlackBerry' as its platform" do
    @useragent.platform.should == "BlackBerry"
  end

  it "should return 'BlackBerry 9800' as its os" do
    @useragent.os.should == "BlackBerry 9800"
  end

  it { @useragent.should be_mobile }
end
