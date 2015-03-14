require 'user_agent'

shared_examples "iTunes" do
  it "should return 'iTunes' as its browser" do
    expect(@useragent.browser).to eq("iTunes")
  end

  it "should return nil as its security" do
    expect(@useragent.security).to be_nil
  end
end

shared_examples "iTunes runs on" do |platform, os|
  it "should return '#{platform}' as its platform" do
    expect(@useragent.platform).to eq(platform)
  end

  it "should return '#{os}' as its OS" do
    expect(@useragent.os).to eq(os)
  end
end

shared_examples "iTunes has version number" do |version|
  it "should return '#{version}' as its version" do
    expect(@useragent.version).to eq(version)
  end
end

shared_examples "iTunes has WebKit build number" do |version|
  it "should return '#{version}' as its WebKit build number" do
    expect(@useragent.build).to eq(version)
  end
end

describe "UserAgent: iTunes/10.6.1 (Macintosh; Intel Mac OS X 10.7.3) AppleWebKit/534.53.11" do
  before do
    @useragent = UserAgent.parse("iTunes/10.6.1 (Macintosh; Intel Mac OS X 10.7.3) AppleWebKit/534.53.11")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes runs on", "Macintosh", "OS X 10.7.3"
  it_behaves_like "iTunes has version number", "10.6.1"
  it_behaves_like "iTunes has WebKit build number", "534.53.11"
end

describe "UserAgent: iTunes/12.0.1 (Macintosh; OS X 10.10) AppleWebKit/0600.1.25" do
  before do
    @useragent = UserAgent.parse("iTunes/12.0.1 (Macintosh; OS X 10.10) AppleWebKit/0600.1.25")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes runs on", "Macintosh", "OS X 10.10"
  it_behaves_like "iTunes has version number", "12.0.1"
  it_behaves_like "iTunes has WebKit build number", "0600.1.25"

  # this really only needs tested once since we're fixing the parse error for Windows only
  it "should return 'OS X 10.10' as its full OS" do
    expect(@useragent.full_os).to eq("OS X 10.10")
  end
end

describe "UserAgent: iTunes/11.1.5 (Windows; Microsoft Windows 7 x64 Business Edition Service Pack 1 (Build 7601)) AppleWebKit/537.60.15" do
  before do
    @useragent = UserAgent.parse("iTunes/11.1.5 (Windows; Microsoft Windows 7 x64 Business Edition Service Pack 1 (Build 7601)) AppleWebKit/537.60.15")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes runs on", "Windows", "Windows 7"
  it_behaves_like "iTunes has version number", "11.1.5"
  it_behaves_like "iTunes has WebKit build number", "537.60.15"

  it "should return 'Microsoft Windows 7 x64 Business Edition Service Pack 1 (Build 7601)' as its full OS" do
    expect(@useragent.full_os).to eq("Microsoft Windows 7 x64 Business Edition Service Pack 1 (Build 7601)")
  end
end

describe "UserAgent: iTunes/12.0.1 (Windows; Microsoft Windows 8 x64 Home Premium Edition (Build 9200)) AppleWebKit/7600.1017.0.24" do
  before do
    @useragent = UserAgent.parse("iTunes/12.0.1 (Windows; Microsoft Windows 8 x64 Home Premium Edition (Build 9200)) AppleWebKit/7600.1017.0.24")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes runs on", "Windows", "Windows 8"
  it_behaves_like "iTunes has version number", "12.0.1"
  it_behaves_like "iTunes has WebKit build number", "7600.1017.0.24"

  it "should return 'Microsoft Windows 8 x64 Home Premium Edition (Build 9200)' as its full OS" do
    expect(@useragent.full_os).to eq("Microsoft Windows 8 x64 Home Premium Edition (Build 9200)")
  end
end

describe "UserAgent: iTunes/12.0.1 (Macintosh; OS X 10.10.1) AppleWebKit/0600.1.25" do
  before do
    @useragent = UserAgent.parse("iTunes/12.0.1 (Macintosh; OS X 10.10.1) AppleWebKit/0600.1.25")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes runs on", "Macintosh", "OS X 10.10.1"
  it_behaves_like "iTunes has version number", "12.0.1"
  it_behaves_like "iTunes has WebKit build number", "0600.1.25"
end

describe "UserAgent: iTunes/9.1.1" do
  before do
    @useragent = UserAgent.parse("iTunes/9.1.1")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes has version number", "9.1.1"

  it "should return nil for WebKit build number" do
    expect(@useragent.build).to be_nil
  end

  it "should return nil for the OS" do
    expect(@useragent.os).to be_nil
  end

  it "should return nil for the platform" do
    expect(@useragent.platform).to be_nil
  end
end

describe "UserAgent: iTunes/10.7 Downcast/2.8.26.1005" do
  before do
    @useragent = UserAgent.parse("iTunes/10.7 Downcast/2.8.26.1005")
  end

  it_behaves_like "iTunes"
  it_behaves_like "iTunes has version number", "10.7"

  it "should return nil for WebKit build number" do
    expect(@useragent.build).to be_nil
  end

  it "should return nil for the OS" do
    expect(@useragent.os).to be_nil
  end

  it "should return nil for the platform" do
    expect(@useragent.platform).to be_nil
  end
end
