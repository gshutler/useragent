require 'user_agent'

shared_examples_for "Opera browser" do
  it "should return 'Opera' as its browser" do
    @useragent.browser.should == "Opera"
  end

  it "should return :strong as its security" do
    @useragent.security.should == :strong
  end
end

describe "UserAgent: 'Opera/9.27 (Macintosh; Intel Mac OS X; U; en)'" do
  before do
    @useragent = UserAgent.parse("Opera/9.27 (Macintosh; Intel Mac OS X; U; en)")
  end

  it_should_behave_like "Opera browser"

  it "should return '9.27' as its version" do
    @useragent.version.should == "9.27"
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

describe "UserAgent: 'Opera/9.27 (Windows NT 5.1; U; en)'" do
  before do
    @useragent = UserAgent.parse("Opera/9.27 (Windows NT 5.1; U; en)")
  end

  it_should_behave_like "Opera browser"

  it "should return '9.27' as its version" do
    @useragent.version.should == "9.27"
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
