require 'user_agent'

describe "Internet Explorer browser", :shared => true do
  it "should return 'Internet Explorer' as its browser" do
    @useragent.browser.should == "Internet Explorer"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'compatible' as its compatibility" do
    @useragent.compatibility.should == "compatible"
  end

  it "should be compatible" do
    @useragent.should be_compatible
  end
end

describe "UserAgent: 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)")
  end

  it_should_behave_like "Internet Explorer browser"

  it "should return '8.0' as its version" do
    @useragent.version.should == "8.0"
  end

  it "should return 'Windows Vista' as its os" do
    @useragent.os.should == "Windows Vista"
  end
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
