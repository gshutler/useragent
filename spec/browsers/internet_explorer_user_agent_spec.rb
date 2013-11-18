require 'user_agent'

shared_examples_for "Internet Explorer browser" do
  it "should return 'Internet Explorer' as its browser" do
    @useragent.browser.should == "Internet Explorer"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end
end

describe "UserAgent: 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '11.0' as its version", :focus => true do
    @useragent.version.should == "11.0"
  end

  it "should return 'Windows 8.1' as its os" do
    @useragent.os.should == "Windows 8.1"
  end

  it "should have a higher version number than IE10" do
    @useragent.version.should >
      UserAgent.parse('Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)').version
  end
end

describe "UserAgent: 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '10.0' as its version" do
    @useragent.version.should == "10.0"
  end

  it "should return 'Windows 8' as its os" do
    @useragent.os.should == "Windows 8"
  end

  it "should have a higher version number than IE9" do
    @useragent.version.should >
      UserAgent.parse('Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.2; ARM; Trident/6.0; Touch; .NET4.0E; .NET4.0C; Tablet PC 2.0)').version
  end

  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; ARM; Trident/6.0; Touch; .NET4.0E; .NET4.0C; Tablet PC 2.0)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; ARM; Trident/6.0; Touch; .NET4.0E; .NET4.0C; Tablet PC 2.0)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '7.0' as its version" do
    @useragent.version.should == "7.0"
  end

  it "should return 'Windows 8' as its os" do
    @useragent.os.should == "Windows 8"
  end

  it { @useragent.should be_compatibility_view }
  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; ARM; Trident/6.0; Touch)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; ARM; Trident/6.0; Touch)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '10.0' as its version" do
    @useragent.version.should == "10.0"
  end

  it "should return 'Windows 8' as its os" do
    @useragent.os.should == "Windows 8"
  end

  it { @useragent.should_not be_compatibility_view }
  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '9.0' as its version" do
    @useragent.version.should == "9.0"
  end

  it "should return 'Windows 7' as its os" do
    @useragent.os.should == "Windows 7"
  end

  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '9.0' as its version" do
    @useragent.version.should == "9.0"
  end

  it "should return 'Windows 7' as its os" do
    @useragent.os.should == "Windows 7"
  end

  it { @useragent.should_not be_compatibility_view }
  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C)' Compat View" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '7.0' as its version" do
    @useragent.version.should == "7.0"
  end

  it "should return 'Windows 7' as its os" do
    @useragent.os.should == "Windows 7"
  end

  it { @useragent.should be_compatibility_view }
  it { @useragent.should_not be_mobile }
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '7.0' as its version" do
    @useragent.version.should == "7.0"
  end

  it "should return 'Windows Vista' as its os" do
    @useragent.os.should == "Windows Vista"
  end
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '6.0' as its version" do
    @useragent.version.should == "6.0"
  end

  it "should return 'Windows XP' as its os" do
    @useragent.os.should == "Windows XP"
  end

  it "should be == 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)'" do
    @useragent.should == @useragent
  end

  it "should not be == 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
    @useragent.should_not == UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end

  it "should be > 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
    @useragent.should > UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end

  it "should not be < 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
    @useragent.should_not < UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end

  it "should be >= 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
    @useragent.should >= UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end

  it "should not be >= 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)'" do
    @useragent.should_not >= UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
  end

  it "should be <= 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)'" do
    @useragent.should <= UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
  end

  it "should not be <= 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
    @useragent.should_not <= UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '5.5' as its version" do
    @useragent.version.should == "5.5"
  end

  it "should return 'Windows XP' as its os" do
    @useragent.os.should == "Windows XP"
  end
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; SAMSUNG; SGH-i917)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; SAMSUNG; SGH-i917)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '7.0' as its version" do
    @useragent.version.should == "7.0"
  end

  it "should return 'Windows Phone OS 7.0' as its os" do
    @useragent.os.should == "Windows Phone OS 7.0"
  end

  it { @useragent.should be_mobile }
end

describe "Non-Chrome Frame browsers" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "shouldn't pose as chromeframe" do
    @useragent.chromeframe.should be_nil
  end
end

describe "Chrome Frame installs before version 4.0" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; chromeframe)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return true as chromeframe" do
    @useragent.chromeframe.should be_true
  end

  it "shouldn't have a version" do
    @useragent.chromeframe.should_not respond_to(:version)
  end
end

describe "Chrome Frame from version 4.0 on" do
  context "as separate product" do
    before do
      @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) chromeframe/4.0")
    end

    it_should_behave_like "Internet Explorer browser"

    it "should return true as chromeframe" do
      @useragent.chromeframe.should be_true
    end

    it "should have a version" do
      @useragent.chromeframe.version.should == "4.0"
    end
  end

  context "as versioned comment" do
    before do
      @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; chromeframe/4.0)")
    end

    it_should_behave_like "Internet Explorer browser"

    it "should return true as chromeframe" do
      @useragent.chromeframe.should be_true
    end

    it "should have a version" do
      @useragent.chromeframe.version.should == "4.0"
    end
  end
end
