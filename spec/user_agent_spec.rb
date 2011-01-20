require 'user_agent'

describe UserAgent do
  it "should require a product" do
    lambda { UserAgent.new(nil) }.should raise_error(ArgumentError, "expected a value for product")
  end

  it "should split comment to any array if a string is passed in" do
    useragent = UserAgent.new("Mozilla", "5.0", "Macintosh; U; Intel Mac OS X 10_5_3; en-us")
    useragent.comment.should == ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"]
  end

  it "should set version to nil if it is blank" do
    UserAgent.new("Mozilla", "").version.should be_nil
  end

  it "should only output product when coerced to a string" do
    UserAgent.new("Mozilla").to_str.should == "Mozilla"
  end

  it "should output product and version when coerced to a string" do
    UserAgent.new("Mozilla", "5.0").to_str.should == "Mozilla/5.0"
  end

  it "should output product, version and comment when coerced to a string" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    useragent.to_str.should == "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)"
  end

  it "should output product and comment when coerced to a string" do
    useragent = UserAgent.new("Mozilla", nil, ["Macintosh"])
    useragent.to_str.should == "Mozilla (Macintosh)"
  end

  it "should be eql if both products are the same" do
    UserAgent.new("Mozilla").should eql(UserAgent.new("Mozilla"))
  end

  it "should not be eql if both products are the same" do
    UserAgent.new("Mozilla").should_not eql(UserAgent.new("Opera"))
  end

  it "should be eql if both products and versions are the same" do
    UserAgent.new("Mozilla", "5.0").should eql(UserAgent.new("Mozilla", "5.0"))
  end

  it "should not be eql if both products and versions are not the same" do
    UserAgent.new("Mozilla", "5.0").should_not eql(UserAgent.new("Mozilla", "4.0"))
  end

  it "should be eql if both products, versions and comments are the same" do
    UserAgent.new("Mozilla", "5.0", ["Macintosh"]).should eql(UserAgent.new("Mozilla", "5.0", ["Macintosh"]))
  end

  it "should not be eql if both products, versions and comments are not the same" do
    UserAgent.new("Mozilla", "5.0", ["Macintosh"]).should_not eql(UserAgent.new("Mozilla", "5.0", ["Windows"]))
  end

  it "should not be eql if both products, versions and comments are not the same" do
    UserAgent.new("Mozilla", "5.0", ["Macintosh"]).should_not eql(UserAgent.new("Mozilla", "4.0", ["Macintosh"]))
  end

  it "should not be equal? if both products are the same" do
    UserAgent.new("Mozilla").should_not equal(UserAgent.new("Mozilla"))
  end

  it "should be == if products are the same" do
    UserAgent.new("Mozilla").should == UserAgent.new("Mozilla")
  end

  it "should be == if products and versions are the same" do
    UserAgent.new("Mozilla", "5.0").should == UserAgent.new("Mozilla", "5.0")
  end

  it "should not be == if products and versions are the different" do
    UserAgent.new("Mozilla", "5.0").should_not == UserAgent.new("Mozilla", "4.0")
  end

  it "should return false if comparing different products" do
    UserAgent.new("Mozilla").should_not <= UserAgent.new("Opera")
  end

  it "should not be > if products are the same" do
    UserAgent.new("Mozilla").should_not > UserAgent.new("Mozilla")
  end

  it "should not be < if products are the same" do
    UserAgent.new("Mozilla").should_not < UserAgent.new("Mozilla")
  end

  it "should be >= if products are the same" do
    UserAgent.new("Mozilla").should >= UserAgent.new("Mozilla")
  end

  it "should be <= if products are the same" do
    UserAgent.new("Mozilla").should <= UserAgent.new("Mozilla")
  end

  it "should be > if products are the same and version is greater" do
    UserAgent.new("Mozilla", "5.0").should > UserAgent.new("Mozilla", "4.0")
  end

  it "should not be > if products are the same and version is less" do
    UserAgent.new("Mozilla", "4.0").should_not > UserAgent.new("Mozilla", "5.0")
  end

  it "should be < if products are the same and version is less" do
    UserAgent.new("Mozilla", "4.0").should < UserAgent.new("Mozilla", "5.0")
  end

  it "should not be < if products are the same and version is greater" do
    UserAgent.new("Mozilla", "5.0").should_not < UserAgent.new("Mozilla", "4.0")
  end

  it "should be >= if products are the same and version is greater" do
    UserAgent.new("Mozilla", "5.0").should >= UserAgent.new("Mozilla", "4.0")
  end

  it "should not be >= if products are the same and version is less" do
    UserAgent.new("Mozilla", "4.0").should_not >= UserAgent.new("Mozilla", "5.0")
  end

  it "should be <= if products are the same and version is less" do
    UserAgent.new("Mozilla", "4.0").should <= UserAgent.new("Mozilla", "5.0")
  end

  it "should not be <= if products are the same and version is greater" do
    UserAgent.new("Mozilla", "5.0").should_not <= UserAgent.new("Mozilla", "4.0")
  end

  it "should be >= if products are the same and version is the same" do
    UserAgent.new("Mozilla", "5.0").should >= UserAgent.new("Mozilla", "5.0")
  end

  it "should be <= if products are the same and version is the same" do
    UserAgent.new("Mozilla", "5.0").should <= UserAgent.new("Mozilla", "5.0")
  end
end

describe UserAgent, "::MATCHER" do
  it "should not match a blank line" do
    UserAgent::MATCHER.should_not =~ ""
  end

  it "should match a single product" do
    UserAgent::MATCHER.should =~ "Mozilla"
  end

  it "should match a product and version" do
    UserAgent::MATCHER.should =~ "Mozilla/5.0"
  end

  it "should match a product, version, and comment" do
    UserAgent::MATCHER.should =~ "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)"
  end

  it "should match a product, and comment" do
    UserAgent::MATCHER.should =~ "Mozilla (Macintosh; U; Intel Mac OS X 10_5_3; en-us)"
  end
end

describe UserAgent, ".parse" do
  it "should concatenate user agents when coerced to a string" do
    string = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
    string.to_str.should == "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18"
  end

  it "should parse an empty string" do
    UserAgent.parse("").should be_empty
  end

  it "should parse nil" do
    UserAgent.parse(nil).should be_empty
  end

  it "should parse a single product" do
    useragent = UserAgent.new("Mozilla")
    UserAgent.parse("Mozilla").application.should == useragent
  end

  it "should parse a single product with version" do
    useragent = UserAgent.new("Mozilla", "5.0")
    UserAgent.parse("Mozilla/5.0").application.should == useragent
  end

  it "should parse a single product, version, and comment" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)").application.should == useragent
  end

  it "should parse a single product, version, and comment, with space-padded semicolons" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3 ; en-us; )").application.should == useragent
  end

  it "should parse a single product and comment" do
    useragent = UserAgent.new("Mozilla", nil, ["Macintosh"])
    UserAgent.parse("Mozilla (Macintosh)").application.should == useragent
  end
end

describe UserAgent::Browsers::All, "#<" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be < if user agent does not have a browser" do
    @ie_7.should_not < "Mozilla"
  end

  it "should not be < if user agent does not have the same browser" do
    @ie_7.should_not < @firefox
  end

  it "should be < if version is less than its version" do
    @ie_6.should < @ie_7
  end

  it "should not be < if version is the same as its version" do
    @ie_6.should_not < @ie_6
  end

  it "should not be < if version is greater than its version" do
    @ie_7.should_not < @ie_6
  end
end

describe UserAgent::Browsers::All, "#<=" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be <= if user agent does not have a browser" do
    @ie_7.should_not <= "Mozilla"
  end

  it "should not be <= if user agent does not have the same browser" do
    @ie_7.should_not <= @firefox
  end

  it "should be <= if version is less than its version" do
    @ie_6.should <= @ie_7
  end

  it "should be <= if version is the same as its version" do
    @ie_6.should <= @ie_6
  end

  it "should not be <= if version is greater than its version" do
    @ie_7.should_not <= @ie_6
  end
end

describe UserAgent::Browsers::All, "#==" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be == if user agent does not have a browser" do
    @ie_7.should_not == "Mozilla"
  end

  it "should not be == if user agent does not have the same browser" do
    @ie_7.should_not == @firefox
  end

  it "should not be == if version is less than its version" do
    @ie_6.should_not == @ie_7
  end

  it "should be == if version is the same as its version" do
    @ie_6.should == @ie_6
  end

  it "should not be == if version is greater than its version" do
    @ie_7.should_not == @ie_6
  end
end

describe UserAgent::Browsers::All, "#>" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be > if user agent does not have a browser" do
    @ie_7.should_not > "Mozilla"
  end

  it "should not be > if user agent does not have the same browser" do
    @ie_7.should_not > @firefox
  end

  it "should not be > if version is less than its version" do
    @ie_6.should_not > @ie_7
  end

  it "should not be > if version is the same as its version" do
    @ie_6.should_not > @ie_6
  end

  it "should be > if version is greater than its version" do
    @ie_7.should > @ie_6
  end
end

describe UserAgent::Browsers::All, "#>=" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be >= if user agent does not have a browser" do
    @ie_7.should_not >= "Mozilla"
  end

  it "should not be >= if user agent does not have the same browser" do
    @ie_7.should_not >= @firefox
  end

  it "should not be >= if version is less than its version" do
    @ie_6.should_not >= @ie_7
  end

  it "should be >= if version is the same as its version" do
    @ie_6.should >= @ie_6
  end

  it "should be >= if version is greater than its version" do
    @ie_7.should >= @ie_6
  end
end
