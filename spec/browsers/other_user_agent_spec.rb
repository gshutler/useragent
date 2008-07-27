require File.dirname(__FILE__) + '/../spec_helper.rb'

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
