require 'user_agent'

shared_examples_for "Opera browser" do
  it "should return 'Opera' as its browser" do
    @useragent.browser.should == "Opera"
  end

  it "should return :strong as its security" do
    @useragent.security.should == :strong
  end
end

describe "UserAgent: 'Opera/9.80 (Macintosh; Intel Mac OS X; U; en) Presto/2.2.15 Version/10.10'" do
  before do
    @useragent = UserAgent.parse("Opera/9.80 (Macintosh; Intel Mac OS X; U; en) Presto/2.2.15 Version/10.10")
  end

  it_should_behave_like "Opera browser"

  it "should return '10.10' as its version" do
    @useragent.version.should == "10.10"
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

describe "UserAgent: 'Opera/9.80 (Windows NT 6.0; U; en) Presto/2.2.15 Version/10.10'" do
  before do
    @useragent = UserAgent.parse("Opera/9.80 (Windows NT 6.0; U; en) Presto/2.2.15 Version/10.10")
  end

  it_should_behave_like "Opera browser"

  it "should return '10.10' as its version" do
    @useragent.version.should == "10.10"
  end

  it "should return 'Windows' as its platform" do
    @useragent.platform.should == "Windows"
  end

  it "should return 'Windows Vista' as its os" do
    @useragent.os.should == "Windows Vista"
  end

  it "should return 'en' as its localization" do
    @useragent.localization.should == "en"
  end
end

describe "UserAgent: 'Opera/9.63'" do
  before do
    @useragent = UserAgent.parse("Opera/9.63")
  end

  it_should_behave_like "Opera browser"

  it "should return '9.63' as its version" do
    @useragent.version.should == "9.63"
  end

  it "should return nil as its platform" do
    @useragent.platform.should be_nil
  end

  it "should return nil as its os" do
    @useragent.os.should be_nil
  end

  it "should return nil as its localization" do
    @useragent.localization.should be_nil
  end
end
