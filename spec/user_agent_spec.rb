require 'user_agent'
require 'ostruct'

describe UserAgent do
  it "should require a product" do
    expect { UserAgent.new(nil) }.to raise_error(ArgumentError, "expected a value for product")
  end

  it "should split comment to an array if a string is passed in" do
    useragent = UserAgent.new("Mozilla", "5.0", "Macintosh; U; Intel Mac OS X 10_5_3; en-us")
    expect(useragent.comment).to eq(["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
  end

  it "should set version to nil if it is blank" do
    expect(UserAgent.new("Mozilla", "").version).to be_nil
  end

  it "should only output product when coerced to a string" do
    expect(UserAgent.new("Mozilla").to_str).to eq("Mozilla")
  end

  it "should output product and version when coerced to a string" do
    expect(UserAgent.new("Mozilla", "5.0").to_str).to eq("Mozilla/5.0")
  end

  it "should output product, version and comment when coerced to a string" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    expect(useragent.to_str).to eq("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)")
  end

  it "should output product and comment when coerced to a string" do
    useragent = UserAgent.new("Mozilla", nil, ["Macintosh"])
    expect(useragent.to_str).to eq("Mozilla (Macintosh)")
  end

  it "should be eql if both products are the same" do
    expect(UserAgent.new("Mozilla")).to eql(UserAgent.new("Mozilla"))
  end

  it "should not be eql if both products are the same" do
    expect(UserAgent.new("Mozilla")).not_to eql(UserAgent.new("Opera"))
  end

  it "should be eql if both products and versions are the same" do
    expect(UserAgent.new("Mozilla", "5.0")).to eql(UserAgent.new("Mozilla", "5.0"))
  end

  it "should not be eql if both products and versions are not the same" do
    expect(UserAgent.new("Mozilla", "5.0")).not_to eql(UserAgent.new("Mozilla", "4.0"))
  end

  it "should be eql if both products, versions and comments are the same" do
    expect(UserAgent.new("Mozilla", "5.0", ["Macintosh"])).to eql(UserAgent.new("Mozilla", "5.0", ["Macintosh"]))
  end

  it "should not be eql if both products, versions and comments are not the same" do
    expect(UserAgent.new("Mozilla", "5.0", ["Macintosh"])).not_to eql(UserAgent.new("Mozilla", "5.0", ["Windows"]))
  end

  it "should not be eql if both products, versions and comments are not the same" do
    expect(UserAgent.new("Mozilla", "5.0", ["Macintosh"])).not_to eql(UserAgent.new("Mozilla", "4.0", ["Macintosh"]))
  end

  it "should not be equal? if both products are the same" do
    expect(UserAgent.new("Mozilla")).not_to equal(UserAgent.new("Mozilla"))
  end

  it "should be == if products are the same" do
    expect(UserAgent.new("Mozilla")).to eq(UserAgent.new("Mozilla"))
  end

  it "should be == if products and versions are the same" do
    expect(UserAgent.new("Mozilla", "5.0")).to eq(UserAgent.new("Mozilla", "5.0"))
  end

  it "should not be == if products and versions are the different" do
    expect(UserAgent.new("Mozilla", "5.0")).not_to eq(UserAgent.new("Mozilla", "4.0"))
  end

  it "should return false if comparing different products" do
    expect(UserAgent.new("Mozilla")).not_to be <= UserAgent.new("Opera")
  end

  it "should not be > if products are the same" do
    expect(UserAgent.new("Mozilla")).not_to be > UserAgent.new("Mozilla")
  end

  it "should not be < if products are the same" do
    expect(UserAgent.new("Mozilla")).not_to be < UserAgent.new("Mozilla")
  end

  it "should be >= if products are the same" do
    expect(UserAgent.new("Mozilla")).to be >= UserAgent.new("Mozilla")
  end

  it "should be <= if products are the same" do
    expect(UserAgent.new("Mozilla")).to be <= UserAgent.new("Mozilla")
  end

  it "should be > if products are the same and version is greater" do
    expect(UserAgent.new("Mozilla", "5.0")).to be > UserAgent.new("Mozilla", "4.0")
  end

  it "should not be > if products are the same and version is less" do
    expect(UserAgent.new("Mozilla", "4.0")).not_to be > UserAgent.new("Mozilla", "5.0")
  end

  it "should be < if products are the same and version is less" do
    expect(UserAgent.new("Mozilla", "4.0")).to be < UserAgent.new("Mozilla", "5.0")
  end

  it "should not be < if products are the same and version is greater" do
    expect(UserAgent.new("Mozilla", "5.0")).not_to be < UserAgent.new("Mozilla", "4.0")
  end

  it "should be >= if products are the same and version is greater" do
    expect(UserAgent.new("Mozilla", "5.0")).to be >= UserAgent.new("Mozilla", "4.0")
  end

  it "should not be >= if products are the same and version is less" do
    expect(UserAgent.new("Mozilla", "4.0")).not_to be >= UserAgent.new("Mozilla", "5.0")
  end

  it "should be <= if products are the same and version is less" do
    expect(UserAgent.new("Mozilla", "4.0")).to be <= UserAgent.new("Mozilla", "5.0")
  end

  it "should not be <= if products are the same and version is greater" do
    expect(UserAgent.new("Mozilla", "5.0")).not_to be <= UserAgent.new("Mozilla", "4.0")
  end

  it "should be >= if products are the same and version is the same" do
    expect(UserAgent.new("Mozilla", "5.0")).to be >= UserAgent.new("Mozilla", "5.0")
  end

  it "should be <= if products are the same and version is the same" do
    expect(UserAgent.new("Mozilla", "5.0")).to be <= UserAgent.new("Mozilla", "5.0")
  end
end

describe UserAgent, "::MATCHER" do
  it "should not match a blank line" do
    expect(UserAgent::MATCHER).not_to match("")
  end

  it "should match a single product" do
    expect(UserAgent::MATCHER).to match("Mozilla")
  end

  it "should match a product and version" do
    expect(UserAgent::MATCHER).to match("Mozilla/5.0")
  end

  it "should match a product, version, and comment" do
    expect(UserAgent::MATCHER).to match("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)")
  end

  it "should match a product, and comment" do
    expect(UserAgent::MATCHER).to match("Mozilla (Macintosh; U; Intel Mac OS X 10_5_3; en-us)")
  end
end

describe UserAgent, ".parse" do
  let(:default_user_agent) { UserAgent.parse(UserAgent::DEFAULT_USER_AGENT) }

  it "should concatenate user agents when coerced to a string" do
    string = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
    expect(string.to_str).to eq("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
  end

  it "should parse a single product" do
    useragent = UserAgent.new("Mozilla")
    expect(UserAgent.parse("Mozilla").application).to eq(useragent)
  end

  it "should parse a single product with version" do
    useragent = UserAgent.new("Mozilla", "5.0")
    expect(UserAgent.parse("Mozilla/5.0").application).to eq(useragent)
  end

  it "should parse a single product with an empty comment" do
    useragent = UserAgent.new("Mozilla", "5.0")
    expect(UserAgent.parse("Mozilla/5.0 ()").application).to eq(useragent)
  end

  it "should parse a single product, version, and comment" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    expect(UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)").application).to eq(useragent)
  end

  it "should parse a single product, version, and comment, with space-padded semicolons" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    expect(UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3 ; en-us; )").application).to eq(useragent)
  end

  it "should parse a user agent string with gzip(gfe) addition correctly" do
    agent = UserAgent.parse("Mozilla/5.0 (Windows NT 5.1; rv:35.0) Gecko/20100101 Firefox/35.0,gzip(gfe)")

    expect(agent.version.to_s).to eq("35.0")
  end

  it "should parse a single product and comment" do
    useragent = UserAgent.new("Mozilla", nil, ["Macintosh"])
    expect(UserAgent.parse("Mozilla (Macintosh)").application).to eq(useragent)
  end

  it "should parse nil as the default agent" do
    expect(UserAgent.parse(nil)).to eq(default_user_agent)
  end

  it "should parse an empty string as the default agent" do
    expect(UserAgent.parse("")).to eq(default_user_agent)
  end

  it "should parse a blank string as the default agent" do
    expect(UserAgent.parse(" ")).to eq(default_user_agent)
  end

  it "should parse a double-quoted user-agent" do
    useragent = UserAgent.new("Mozilla", "5.0", ["X11", "Linux x86_64", "rv:9.0"])
    expect(UserAgent.parse("\"Mozilla/5.0 (X11; Linux x86_64; rv:9.0) Gecko/20100101 Firefox/8.0\"").application).to eq(useragent)
  end

  it "should parse a user-agent with leading double-quote" do
    useragent = UserAgent.new("Mozilla", "5.0", ["X11", "Linux x86_64", "rv:9.0"])
    expect(UserAgent.parse("\"Mozilla/5.0 (X11; Linux x86_64; rv:9.0) Gecko/20100101 Firefox/8.0").application).to eq(useragent)
  end

  it "should parse a single-quoted user-agent" do
    useragent = UserAgent.new("Mozilla", "5.0", nil)
    expect(UserAgent.parse("'Mozilla/5.0'").application).to eq(useragent)
  end

  it "should parse a user-agent with leading single-quote" do
    useragent = UserAgent.new("Mozilla", "5.0", nil)
    expect(UserAgent.parse("'Mozilla/5.0").application).to eq(useragent)
  end
end

describe UserAgent::Browsers::Base, "#<" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be < if user agent does not have a browser" do
    expect(@ie_7).not_to be < "Mozilla"
  end

  it "should not be < if user agent does not have the same browser" do
    expect(@ie_7).not_to be < @firefox
  end

  it "should be < if version is less than its version" do
    expect(@ie_6).to be < @ie_7
  end

  it "should not be < if version is the same as its version" do
    expect(@ie_6).not_to be < @ie_6
  end

  it "should not be < if version is greater than its version" do
    expect(@ie_7).not_to be < @ie_6
  end
end

describe UserAgent::Browsers::Base, "#<=" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be <= if user agent does not have a browser" do
    expect(@ie_7).not_to be <= "Mozilla"
  end

  it "should not be <= if user agent does not have the same browser" do
    expect(@ie_7).not_to be <= @firefox
  end

  it "should be <= if version is less than its version" do
    expect(@ie_6).to be <= @ie_7
  end

  it "should be <= if version is the same as its version" do
    expect(@ie_6).to be <= @ie_6
  end

  it "should not be <= if version is greater than its version" do
    expect(@ie_7).not_to be <= @ie_6
  end
end

describe UserAgent::Browsers::Base, "#==" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be == if user agent does not have a browser" do
    expect(@ie_7).not_to eq("Mozilla")
  end

  it "should not be == if user agent does not have the same browser" do
    expect(@ie_7).not_to eq(@firefox)
  end

  it "should not be == if version is less than its version" do
    expect(@ie_6).not_to eq(@ie_7)
  end

  it "should be == if version is the same as its version" do
    expect(@ie_6).to eq(@ie_6)
  end

  it "should not be == if version is greater than its version" do
    expect(@ie_7).not_to eq(@ie_6)
  end
end

describe UserAgent::Browsers::Base, "#>" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be > if user agent does not have a browser" do
    expect(@ie_7).not_to be > "Mozilla"
  end

  it "should not be > if user agent does not have the same browser" do
    expect(@ie_7).not_to be > @firefox
  end

  it "should not be > if version is less than its version" do
    expect(@ie_6).not_to be > @ie_7
  end

  it "should not be > if version is the same as its version" do
    expect(@ie_6).not_to be > @ie_6
  end

  it "should be > if version is greater than its version" do
    expect(@ie_7).to be > @ie_6
  end
end

describe UserAgent::Browsers::Base, "#>=" do
  before do
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "should not be >= if user agent does not have a browser" do
    expect(@ie_7).not_to be >= "Mozilla"
  end

  it "should not be >= if user agent does not have the same browser" do
    expect(@ie_7).not_to be >= @firefox
  end

  it "should not be >= if version is less than its version" do
    expect(@ie_6).not_to be >= @ie_7
  end

  it "should be >= if version is the same as its version" do
    expect(@ie_6).to be >= @ie_6
  end

  it "should be >= if version is greater than its version" do
    expect(@ie_7).to be >= @ie_6
  end
end

describe UserAgent::Browsers::Base, "#to_h" do
  shared_examples "Browser serializer" do |user_agent_string, expected_hash|
    let(:useragent) do
      UserAgent.parse(user_agent_string)
    end

    let(:actual) do
      useragent.to_h
    end

    expected_hash.each_pair do |key, value|
      it "should serialize :#{key} as '#{value}'" do
        expect(actual[key]).to eq(value)
      end
    end
  end

  it_behaves_like "Browser serializer",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)",
    {
      :browser => "Mozilla",
      :version => [5, 0],
      :platform => "Macintosh",
      :os => "OS X 10.5.3",
      :mobile => false,
      :bot => false,
      :comment => ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"],
    }

  it_behaves_like "Browser serializer",
    "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)",
    {
      :browser => "Mozilla",
      :version => [5, 0],
      :platform => nil,
      :os => "Googlebot/2.1",
      :mobile => false,
      :bot => true,
      :comment => ["compatible", "Googlebot/2.1", "+http://www.google.com/bot.html"],
    }

  it_behaves_like "Browser serializer",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25",
    {
      :browser => "Chrome",
      :version => [28, 0, 1500, 16],
      :platform => "iPhone",
      :os => "iOS 6.1.3",
      :mobile => true,
      :bot => false,
      :comment => ["iPhone", "CPU iPhone OS 6_1_3 like Mac OS X"],
    }
end

describe UserAgent::Version do
  it "should be eql if versions are the same" do
    expect(UserAgent::Version.new("5.0")).to eql(UserAgent::Version.new("5.0"))
  end

  it "should not be eql if versions are the different" do
    expect(UserAgent::Version.new("9.0")).not_to eql(UserAgent::Version.new("5.0"))
  end

  it "should be == if versions are the same" do
    expect(UserAgent::Version.new("5.0")).to eq(UserAgent::Version.new("5.0"))
  end

  it "should be == if versions are the same string" do
    expect(UserAgent::Version.new("5.0")).to eq("5.0")
  end

  it "should not be == if versions are the different" do
    expect(UserAgent::Version.new("9.0")).not_to eq(UserAgent::Version.new("5.0"))
  end

  it "should not be == to nil" do
    expect(UserAgent::Version.new("9.0")).not_to eq(nil)
  end

  it "should not be == to []" do
    expect(UserAgent::Version.new("9.0")).not_to eq([])
  end

  it "should be < if version is less" do
    expect(UserAgent::Version.new("9.0")).to be < UserAgent::Version.new("10.0")
  end

  it "should be < if version is less" do
    expect(UserAgent::Version.new("4")).to be < UserAgent::Version.new("4.1")
  end

  it "should be < if version is less and a string" do
    expect(UserAgent::Version.new("9.0")).to be < "10.0"
  end

  it "should not be < if version is greater" do
    expect(UserAgent::Version.new("9.0")).not_to be > UserAgent::Version.new("10.0")
  end

  it "should be <= if version is less" do
    expect(UserAgent::Version.new("9.0")).to be <= UserAgent::Version.new("10.0")
  end

  it "should not be <= if version is greater" do
    expect(UserAgent::Version.new("9.0")).not_to be >= UserAgent::Version.new("10.0")
  end

  it "should be <= if version is same" do
    expect(UserAgent::Version.new("9.0")).to be <= UserAgent::Version.new("9.0")
  end

  it "should be > if version is greater" do
    expect(UserAgent::Version.new("1.0")).to be > UserAgent::Version.new("0.9")
  end

  it "should be > if version is greater" do
    expect(UserAgent::Version.new("4.1")).to be > UserAgent::Version.new("4")
  end

  it "should not be > if version is less" do
    expect(UserAgent::Version.new("0.0.1")).not_to be > UserAgent::Version.new("10.0")
  end

  it "should be >= if version is greater" do
    expect(UserAgent::Version.new("10.0")).to be >= UserAgent::Version.new("4.0")
  end

  it "should not be >= if version is less" do
    expect(UserAgent::Version.new("0.9")).not_to be >= UserAgent::Version.new("1.0")
  end

  it "should not be > if version is invalid" do
    expect(UserAgent::Version.new("x.x")).not_to be > UserAgent::Version.new("1.0")
  end

  it "should be < if version is invalid" do
    expect(UserAgent::Version.new("x.x")).to be < UserAgent::Version.new("1.0")
  end

  it "should be > when compared with invalid" do
    expect(UserAgent::Version.new("1.0")).to be > UserAgent::Version.new("x.x")
  end

  it "should not be < when compared with invalid" do
    expect(UserAgent::Version.new("1.0")).not_to be < UserAgent::Version.new("x.x")
  end

  it "should not be > if both versions are invalid" do
    expect(UserAgent::Version.new("a.a")).not_to be > UserAgent::Version.new("b.b")
  end

  it "should be < if both versions are invalid" do
    expect(UserAgent::Version.new("a.a")).to be < UserAgent::Version.new("b.b")
  end

  it "should not be > if version is nil" do
    expect(UserAgent::Version.new(nil)).not_to be > UserAgent::Version.new("1.0")
  end

  it "should be < if version is nil" do
    expect(UserAgent::Version.new(nil)).to be < UserAgent::Version.new("1.0")
  end

  it "should not be > when compared with nil" do
    expect(UserAgent::Version.new(nil)).not_to be > UserAgent::Version.new(nil)
  end

  it "should not be < when compared with nil" do
    expect(UserAgent::Version.new(nil)).not_to be < UserAgent::Version.new(nil)
  end

  it "should not be > if both versions are nil" do
    expect(UserAgent::Version.new(nil)).not_to be > UserAgent::Version.new(nil)
  end

  it "should not be < if both versions are nil" do
    expect(UserAgent::Version.new(nil)).not_to be < UserAgent::Version.new(nil)
  end

  it "should be > if version is nil" do
    expect(UserAgent::Version.new("9.0")).to be > nil
  end

  context "comparing with structs" do
    it "should not be < if products are the same and version is greater" do
      expect(UserAgent.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)")).not_to be < OpenStruct.new(:browser => "Internet Explorer", :version => "7.0")
    end
  end
end
