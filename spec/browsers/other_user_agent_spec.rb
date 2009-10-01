require 'user_agent'

describe "UserAgent: 'Mozilla/4.0 (compatible)'" do
  before do
    @useragent = UserAgent.parse("Mozilla/4.0 (compatible)")
  end

  it "should return 'Mozilla' as its browser" do
    @useragent.browser.should == "Mozilla"
  end

  it "should return '4.0' as its version" do
    @useragent.version.should == "4.0"
  end
end

describe "UserAgent: 'amaya/9.51 libwww/5.4.0'" do
  before do
    @useragent = UserAgent.parse("amaya/9.51 libwww/5.4.0")
  end

  it "should return 'amaya' as its browser" do
    @useragent.browser.should == "amaya"
  end

  it "should return '9.51' as its version" do
    @useragent.version.should == "9.51"
  end

  it "should return '5.4.0' as its libwww version" do
    @useragent.libwww.version.should == "5.4.0"
  end
end
