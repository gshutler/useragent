require 'user_agent'

shared_examples_for "Chrome browser" do
  it "should return 'Chrome' as its browser" do
    @useragent.browser.should == "Chrome"
  end
end

# http://www.useragentstring.com/Chrome30.0.1599.17_id_19721.php
describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36")
  end

  it_should_behave_like "Chrome browser"

  it "should return '30.0.1599.17' as its version" do
    @useragent.version.should == "30.0.1599.17"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows 8' as its os" do
    @useragent.os.should == "Windows 8"
  end
end

# http://www.useragentstring.com/Chrome29.0.1547.62_id_19709.php
describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36")
  end

  it_should_behave_like "Chrome browser"

  it "should return '29.0.1547.62' as its version" do
    @useragent.version.should == "29.0.1547.62"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows 7' as its os" do
    @useragent.os.should == "Windows 7"
  end
end

describe "UserAgent: 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36")
  end

  it_should_behave_like "Chrome browser"

  it "should return '29.0.1547.57' as its version" do
    @useragent.version.should == "29.0.1547.57"
  end

  it "should return 'X11' as its platform" do
    @useragent.platform.should == "X11"
  end

  it "should return 'Linux x86_64' as its os" do
    @useragent.os.should == "Linux x86_64"
  end
end

describe "UserAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25")
  end

  it_should_behave_like "Chrome browser"

  it "should return '536.26' as its build" do
    @useragent.build.should == "536.26"
  end

  it "should return '28.0.1500.16' as its version" do
    @useragent.version.should == "28.0.1500.16"
  end

  it "should return '536.26' as its webkit version" do
    @useragent.webkit.version.should == "536.26"
  end

  it "should return 'iPhone' as its platform" do
    @useragent.platform.should == "iPhone"
  end

  it "should return 'CPU iPhone OS 6_1_3 like Mac OS X' as its os" do
    @useragent.os.should == "CPU iPhone OS 6_1_3 like Mac OS X"
  end

  it { @useragent.should be_mobile }
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.40 Safari/537.17" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1312.40 Safari/537.17")
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'OS X 10.8.2' as its os" do
    @useragent.os.should == "OS X 10.8.2"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.168 Safari/535.19")
  end

  it_should_behave_like "Chrome browser"

  it "should return '535.19' as its build" do
    @useragent.build.should == "535.19"
  end

  it "should return '18.0.1025.168' as its version" do
    @useragent.version.should == "18.0.1025.168"
  end

  it "should return '535.19' as its webkit version" do
    @useragent.webkit.version.should == "535.19"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows 7' as its os" do
    @useragent.os.should == "Windows 7"
  end
end

describe "Mozilla/5.0 (Linux; Android 4.2; Nexus 7 Build/JOP40C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 4.2; Nexus 7 Build/JOP40C) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Safari/535.19")
  end

  it "should return 'Chrome' as its browser" do
    @useragent.browser.should == "Chrome"
  end

  it "should return 'Linux' as its platform" do
    @useragent.platform.should == "Linux"
  end

  it "should return 'Android 4.2' as its os" do
    @useragent.os.should == "Android 4.2"
  end

  it { @useragent.should be_mobile }
end


describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.639.0 Safari/534.16'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.639.0 Safari/534.16")
  end

  it_should_behave_like "Chrome browser"

  it "should return '534.16' as its build" do
    @useragent.build.should == "534.16"
  end

  it "should return '10.0.639.0' as its version" do
    @useragent.version.should == "10.0.639.0"
  end

  it "should return '534.16' as its webkit version" do
    @useragent.webkit.version.should == "534.16"
  end

  it "should return 'Macintosh' as its platform" do
    @useragent.platform.should == "Macintosh"
  end

  it "should return 'OS X 10.6.5' as its os" do
    @useragent.os.should == "OS X 10.6.5"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end

  it "should be greater than Chrome 8.0" do
    other = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
    @useragent.should > other
  end

  it "should not be less than Chrome 8.0" do
    other = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
    @useragent.should_not < other
  end
end

describe "UserAgent: 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10")
  end

  it_should_behave_like "Chrome browser"

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

  it "should return 'OS X 10.6.5' as its os" do
    @useragent.os.should == "OS X 10.6.5"
  end

  it "should return 'en-US' as its localization" do
    @useragent.localization.should == "en-US"
  end
end

describe "UserAgent: 'Mozilla/5.0 AppleWebKit/534.10 Chrome/8.0.552.215 Safari/534.10'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 AppleWebKit/534.10 Chrome/8.0.552.215 Safari/534.10")
  end

  it_should_behave_like "Chrome browser"

  it "should return '534.10' as its build" do
    @useragent.build.should == "534.10"
  end

  it "should return '8.0.552.215' as its version" do
    @useragent.version.should == "8.0.552.215"
  end

  it "should return '534.10' as its webkit version" do
    @useragent.webkit.version.should == "534.10"
  end

  it "should return nil as its platform" do
    @useragent.platform.should be_nil
  end

  it "should return nil as its os" do
    @useragent.os.should be_nil
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0")
  end

  it_should_behave_like "Chrome browser"

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

describe "UserAgent: 'Mozilla/5.0 (Linux; U; Android 2.1-update1; en-us; Nexus One Build/ERE27) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17 Chrome/4.1.249.1025'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; U; Android 2.1-update1; en-us; Nexus One Build/ERE27) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17 Chrome/4.1.249.1025")
  end

  it_should_behave_like "Chrome browser"

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

describe "UserAgent: 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13")
  end

  it_should_behave_like "Chrome browser"

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
