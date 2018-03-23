require "spec_helper"
require "user_agent"
require "ostruct"

describe UserAgent do
  it "warns about deprecation" do
    expect { UserAgent::Browsers.Security }.to output("Security is deprecated. Please use SECURITY instead\n").to_stderr
    expect { UserAgent::Browsers.Security }.to output("").to_stderr
    expect { UserAgent::OperatingSystems.Windows }.to output("Windows is deprecated. Please use WINDOWS instead\n").to_stderr
    expect { UserAgent::OperatingSystems.Windows }.to output("").to_stderr
    chrome = UserAgent::Browsers::Chrome.new
    expect { chrome.ChromeBrowsers }.to output("ChromeBrowsers is deprecated. Please use CHROME_BROWSERS instead\n").to_stderr
    expect { chrome.ChromeBrowsers }.to output("").to_stderr
    gecko = UserAgent::Browsers::Gecko.new
    expect { gecko.GeckoBrowsers }.to output("GeckoBrowsers is deprecated. Please use GECKO_BROWSERS instead\n").to_stderr
    expect { gecko.GeckoBrowsers }.to output("").to_stderr
    webkit = UserAgent::Browsers::Webkit.new
    expect { webkit.BuildVersions }.to output("BuildVersions is deprecated. Please use BUILD_VERSIONS instead\n").to_stderr
    expect { webkit.BuildVersions }.to output("").to_stderr
    wmf = UserAgent::Browsers::WindowsMediaPlayer.new
    expect { wmf.has_wmfsdk?("") }.to output("has_wmfsdk? is deprecated. Please use wmfsdk? instead\n").to_stderr
    expect { wmf.has_wmfsdk?("") }.to output("").to_stderr
  end

  it "requires a product" do
    expect { described_class.new(nil) }.to raise_error(ArgumentError, "expected a value for product")
  end

  it "splits comment to an array if a string is passed in" do
    useragent = described_class.new("Mozilla", "5.0", "Macintosh; U; Intel Mac OS X 10_5_3; en-us")
    expect(useragent.comment).to eq(["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
  end

  it "sets version to nil if it is blank" do
    expect(described_class.new("Mozilla", "").version).to be_nil
  end

  it "onlies output product when coerced to a string" do
    expect(described_class.new("Mozilla").to_str).to eq("Mozilla")
  end

  it "outputs product and version when coerced to a string" do
    expect(described_class.new("Mozilla", "5.0").to_str).to eq("Mozilla/5.0")
  end

  it "outputs product, version and comment when coerced to a string" do
    useragent = described_class.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    expect(useragent.to_str).to eq("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)")
  end

  it "outputs product and comment when coerced to a string" do
    useragent = described_class.new("Mozilla", nil, ["Macintosh"])
    expect(useragent.to_str).to eq("Mozilla (Macintosh)")
  end

  it "is eql if both products are the same" do
    expect(described_class.new("Mozilla")).to eql(described_class.new("Mozilla"))
  end

  it "is not eql if both products are the same" do
    expect(described_class.new("Mozilla")).not_to eql(described_class.new("Opera"))
  end

  it "is eql if both products and versions are the same" do
    expect(described_class.new("Mozilla", "5.0")).to eql(described_class.new("Mozilla", "5.0"))
  end

  it "is not eql if both products and versions are not the same" do
    expect(described_class.new("Mozilla", "5.0")).not_to eql(described_class.new("Mozilla", "4.0"))
  end

  it "is eql if both products, versions and comments are the same" do
    expect(described_class.new("Mozilla", "5.0", ["Macintosh"])).to eql(described_class.new("Mozilla", "5.0", ["Macintosh"]))
  end

  it "is not eql if both products, versions and comments are not the same" do
    expect(described_class.new("Mozilla", "5.0", ["Macintosh"])).not_to eql(described_class.new("Mozilla", "5.0", ["Windows"]))
  end

  it "is not eql if both products, versions and comments are not the same" do
    expect(described_class.new("Mozilla", "5.0", ["Macintosh"])).not_to eql(described_class.new("Mozilla", "4.0", ["Macintosh"]))
  end

  it "is not equal? if both products are the same" do
    expect(described_class.new("Mozilla")).not_to equal(described_class.new("Mozilla"))
  end

  it "is == if products are the same" do
    expect(described_class.new("Mozilla")).to eq(described_class.new("Mozilla"))
  end

  it "is == if products and versions are the same" do
    expect(described_class.new("Mozilla", "5.0")).to eq(described_class.new("Mozilla", "5.0"))
  end

  it "is not == if products and versions are the different" do
    expect(described_class.new("Mozilla", "5.0")).not_to eq(described_class.new("Mozilla", "4.0"))
  end

  it "returns false if comparing different products" do
    expect(described_class.new("Mozilla")).not_to be <= described_class.new("Opera")
  end

  it "is not > if products are the same" do
    expect(described_class.new("Mozilla")).not_to be > described_class.new("Mozilla")
  end

  it "is not < if products are the same" do
    expect(described_class.new("Mozilla")).not_to be < described_class.new("Mozilla")
  end

  it "is >= if products are the same" do
    expect(described_class.new("Mozilla")).to be >= described_class.new("Mozilla")
  end

  it "is <= if products are the same" do
    expect(described_class.new("Mozilla")).to be <= described_class.new("Mozilla")
  end

  it "is > if products are the same and version is greater" do
    expect(described_class.new("Mozilla", "5.0")).to be > described_class.new("Mozilla", "4.0")
  end

  it "is not > if products are the same and version is less" do
    expect(described_class.new("Mozilla", "4.0")).not_to be > described_class.new("Mozilla", "5.0")
  end

  it "is < if products are the same and version is less" do
    expect(described_class.new("Mozilla", "4.0")).to be < described_class.new("Mozilla", "5.0")
  end

  it "is not < if products are the same and version is greater" do
    expect(described_class.new("Mozilla", "5.0")).not_to be < described_class.new("Mozilla", "4.0")
  end

  it "is >= if products are the same and version is greater" do
    expect(described_class.new("Mozilla", "5.0")).to be >= described_class.new("Mozilla", "4.0")
  end

  it "is not >= if products are the same and version is less" do
    expect(described_class.new("Mozilla", "4.0")).not_to be >= described_class.new("Mozilla", "5.0")
  end

  it "is <= if products are the same and version is less" do
    expect(described_class.new("Mozilla", "4.0")).to be <= described_class.new("Mozilla", "5.0")
  end

  it "is not <= if products are the same and version is greater" do
    expect(described_class.new("Mozilla", "5.0")).not_to be <= described_class.new("Mozilla", "4.0")
  end

  it "is >= if products are the same and version is the same" do
    expect(described_class.new("Mozilla", "5.0")).to be >= described_class.new("Mozilla", "5.0")
  end

  it "is <= if products are the same and version is the same" do
    expect(described_class.new("Mozilla", "5.0")).to be <= described_class.new("Mozilla", "5.0")
  end
end

describe UserAgent, "::MATCHER" do
  it "does not match a blank line" do
    expect(UserAgent::MATCHER).not_to match("")
  end

  it "matches a single product" do
    expect(UserAgent::MATCHER).to match("Mozilla")
  end

  it "matches a product and version" do
    expect(UserAgent::MATCHER).to match("Mozilla/5.0")
  end

  it "matches a product, version, and comment" do
    expect(UserAgent::MATCHER).to match("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)")
  end

  it "matches a product, and comment" do
    expect(UserAgent::MATCHER).to match("Mozilla (Macintosh; U; Intel Mac OS X 10_5_3; en-us)")
  end
end

describe UserAgent, ".parse" do
  let(:default_user_agent) { UserAgent.parse(UserAgent::DEFAULT_USER_AGENT) }

  it "concatenates user agents when coerced to a string" do
    string = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
    expect(string.to_str).to eq("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
  end

  it "parses a single product" do
    useragent = UserAgent.new("Mozilla")
    expect(UserAgent.parse("Mozilla").application).to eq(useragent)
  end

  it "parses a single product with version" do
    useragent = UserAgent.new("Mozilla", "5.0")
    expect(UserAgent.parse("Mozilla/5.0").application).to eq(useragent)
  end

  it "parses a single product with an empty comment" do
    useragent = UserAgent.new("Mozilla", "5.0")
    expect(UserAgent.parse("Mozilla/5.0 ()").application).to eq(useragent)
  end

  it "parses a single product, version, and comment" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    expect(UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us)").application).to eq(useragent)
  end

  it "parses a single product, version, and comment, with space-padded semicolons" do
    useragent = UserAgent.new("Mozilla", "5.0", ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"])
    expect(UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3 ; en-us; )").application).to eq(useragent)
  end

  it "parses a user agent string with gzip(gfe) addition correctly" do
    agent = UserAgent.parse("Mozilla/5.0 (Windows NT 5.1; rv:35.0) Gecko/20100101 Firefox/35.0,gzip(gfe)")

    expect(agent.version.to_s).to eq("35.0")
  end

  it "parses a single product and comment" do
    useragent = UserAgent.new("Mozilla", nil, ["Macintosh"])
    expect(UserAgent.parse("Mozilla (Macintosh)").application).to eq(useragent)
  end

  it "parses nil as the default agent" do
    expect(UserAgent.parse(nil)).to eq(default_user_agent)
  end

  it "parses an empty string as the default agent" do
    expect(UserAgent.parse("")).to eq(default_user_agent)
  end

  it "parses a blank string as the default agent" do
    expect(UserAgent.parse(" ")).to eq(default_user_agent)
  end

  it "parses a double-quoted user-agent" do
    useragent = UserAgent.new("Mozilla", "5.0", ["X11", "Linux x86_64", "rv:9.0"])
    expect(UserAgent.parse('"Mozilla/5.0 (X11; Linux x86_64; rv:9.0) Gecko/20100101 Firefox/8.0"').application).to eq(useragent)
  end

  it "parses a user-agent with leading double-quote" do
    useragent = UserAgent.new("Mozilla", "5.0", ["X11", "Linux x86_64", "rv:9.0"])
    expect(UserAgent.parse('"Mozilla/5.0 (X11; Linux x86_64; rv:9.0) Gecko/20100101 Firefox/8.0').application).to eq(useragent)
  end

  it "parses a single-quoted user-agent" do
    useragent = UserAgent.new("Mozilla", "5.0", nil)
    expect(UserAgent.parse("'Mozilla/5.0'").application).to eq(useragent)
  end

  it "parses a user-agent with leading single-quote" do
    useragent = UserAgent.new("Mozilla", "5.0", nil)
    expect(UserAgent.parse("'Mozilla/5.0").application).to eq(useragent)
  end
end

describe UserAgent::Browsers::Base, "#<" do
  before do
    @ie7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "is not < if user agent does not have a browser" do
    expect(@ie7).not_to be < "Mozilla"
  end

  it "is not < if user agent does not have the same browser" do
    expect(@ie7).not_to be < @firefox
  end

  it "is < if version is less than its version" do
    expect(@ie6).to be < @ie7
  end

  it "is not < if version is the same as its version" do
    expect(@ie6).not_to be < @ie6
  end

  it "is not < if version is greater than its version" do
    expect(@ie7).not_to be < @ie6
  end
end

describe UserAgent::Browsers::Base, "#<=" do
  before do
    @ie7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "is not <= if user agent does not have a browser" do
    expect(@ie7).not_to be <= "Mozilla"
  end

  it "is not <= if user agent does not have the same browser" do
    expect(@ie7).not_to be <= @firefox
  end

  it "is <= if version is less than its version" do
    expect(@ie6).to be <= @ie7
  end

  it "is <= if version is the same as its version" do
    expect(@ie6).to be <= @ie6
  end

  it "is not <= if version is greater than its version" do
    expect(@ie7).not_to be <= @ie6
  end
end

describe UserAgent::Browsers::Base, "#==" do
  before do
    @ie7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "is not == if user agent does not have a browser" do
    expect(@ie7).not_to eq("Mozilla")
  end

  it "is not == if user agent does not have the same browser" do
    expect(@ie7).not_to eq(@firefox)
  end

  it "is not == if version is less than its version" do
    expect(@ie6).not_to eq(@ie7)
  end

  it "is == if version is the same as its version" do
    expect(@ie6).to eq(@ie6)
  end

  it "is not == if version is greater than its version" do
    expect(@ie7).not_to eq(@ie6)
  end
end

describe UserAgent::Browsers::Base, "#>" do
  before do
    @ie7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "is not > if user agent does not have a browser" do
    expect(@ie7).not_to be > "Mozilla"
  end

  it "is not > if user agent does not have the same browser" do
    expect(@ie7).not_to be > @firefox
  end

  it "is not > if version is less than its version" do
    expect(@ie6).not_to be > @ie7
  end

  it "is not > if version is the same as its version" do
    expect(@ie6).not_to be > @ie6
  end

  it "is > if version is greater than its version" do
    expect(@ie7).to be > @ie6
  end
end

describe UserAgent::Browsers::Base, "#>=" do
  before do
    @ie7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  it "is not >= if user agent does not have a browser" do
    expect(@ie7).not_to be >= "Mozilla"
  end

  it "is not >= if user agent does not have the same browser" do
    expect(@ie7).not_to be >= @firefox
  end

  it "is not >= if version is less than its version" do
    expect(@ie6).not_to be >= @ie7
  end

  it "is >= if version is the same as its version" do
    expect(@ie6).to be >= @ie6
  end

  it "is >= if version is greater than its version" do
    expect(@ie7).to be >= @ie6
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
                  :browser => "Mozilla",
                  :version => [5, 0],
                  :platform => "Macintosh",
                  :os => "OS X 10.5.3",
                  :mobile => false,
                  :bot => false,
                  :comment => ["Macintosh", "U", "Intel Mac OS X 10_5_3", "en-us"]

  it_behaves_like "Browser serializer",
                  "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)",
                  :browser => "Mozilla",
                  :version => [5, 0],
                  :platform => nil,
                  :os => "Googlebot/2.1",
                  :mobile => false,
                  :bot => true,
                  :comment => ["compatible", "Googlebot/2.1", "+http://www.google.com/bot.html"]

  it_behaves_like "Browser serializer",
                  "Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) CriOS/28.0.1500.16 Mobile/10B329 Safari/8536.25",
                  :browser => "Chrome",
                  :version => [28, 0, 1500, 16],
                  :platform => "iPhone",
                  :os => "iOS 6.1.3",
                  :mobile => true,
                  :bot => false,
                  :comment => ["iPhone", "CPU iPhone OS 6_1_3 like Mac OS X"]
end

describe UserAgent::Version do
  it "is eql if versions are the same" do
    expect(described_class.new("5.0")).to eql(described_class.new("5.0"))
  end

  it "is not eql if versions are the different" do
    expect(described_class.new("9.0")).not_to eql(described_class.new("5.0"))
  end

  it "is == if versions are the same" do
    expect(described_class.new("5.0")).to eq(described_class.new("5.0"))
  end

  it "is == if versions are the same string" do
    expect(described_class.new("5.0")).to eq("5.0")
  end

  it "is not == if versions are the different" do
    expect(described_class.new("9.0")).not_to eq(described_class.new("5.0"))
  end

  it "is not == to nil" do
    expect(described_class.new("9.0")).not_to eq(nil)
  end

  it "is not == to []" do
    expect(described_class.new("9.0")).not_to eq([])
  end

  it "is < if version is less" do
    expect(described_class.new("9.0")).to be < described_class.new("10.0")
  end

  it "is < if version is less" do
    expect(described_class.new("4")).to be < described_class.new("4.1")
  end

  it "is < if version is less and a string" do
    expect(described_class.new("9.0")).to be < "10.0"
  end

  it "is not < if version is greater" do
    expect(described_class.new("9.0")).not_to be > described_class.new("10.0")
  end

  it "is <= if version is less" do
    expect(described_class.new("9.0")).to be <= described_class.new("10.0")
  end

  it "is not <= if version is greater" do
    expect(described_class.new("9.0")).not_to be >= described_class.new("10.0")
  end

  it "is <= if version is same" do
    expect(described_class.new("9.0")).to be <= described_class.new("9.0")
  end

  it "is > if version is greater" do
    expect(described_class.new("1.0")).to be > described_class.new("0.9")
  end

  it "is > if version is greater" do
    expect(described_class.new("4.1")).to be > described_class.new("4")
  end

  it "is not > if version is less" do
    expect(described_class.new("0.0.1")).not_to be > described_class.new("10.0")
  end

  it "is >= if version is greater" do
    expect(described_class.new("10.0")).to be >= described_class.new("4.0")
  end

  it "is not >= if version is less" do
    expect(described_class.new("0.9")).not_to be >= described_class.new("1.0")
  end

  it "is not > if version is invalid" do
    expect(described_class.new("x.x")).not_to be > described_class.new("1.0")
  end

  it "is < if version is invalid" do
    expect(described_class.new("x.x")).to be < described_class.new("1.0")
  end

  it "is > when compared with invalid" do
    expect(described_class.new("1.0")).to be > described_class.new("x.x")
  end

  it "is not < when compared with invalid" do
    expect(described_class.new("1.0")).not_to be < described_class.new("x.x")
  end

  it "is not > if both versions are invalid" do
    expect(described_class.new("a.a")).not_to be > described_class.new("b.b")
  end

  it "is < if both versions are invalid" do
    expect(described_class.new("a.a")).to be < described_class.new("b.b")
  end

  it "is not > if version is nil" do
    expect(described_class.new(nil)).not_to be > described_class.new("1.0")
  end

  it "is < if version is nil" do
    expect(described_class.new(nil)).to be < described_class.new("1.0")
  end

  it "is not > when compared with nil" do
    expect(described_class.new(nil)).not_to be > described_class.new(nil)
  end

  it "is not < when compared with nil" do
    expect(described_class.new(nil)).not_to be < described_class.new(nil)
  end

  it "is not > if both versions are nil" do
    expect(described_class.new(nil)).not_to be > described_class.new(nil)
  end

  it "is not < if both versions are nil" do
    expect(described_class.new(nil)).not_to be < described_class.new(nil)
  end

  it "is > if version is nil" do
    expect(described_class.new("9.0")).to be > nil
  end

  context "comparing with structs" do
    it "is not < if products are the same and version is greater" do
      expect(UserAgent.parse("Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; WOW64; Trident/6.0)")).not_to be < OpenStruct.new(:browser => "Internet Explorer", :version => "7.0")
    end
  end
end
