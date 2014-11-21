require 'user_agent'

shared_examples "AppleCoreMedia" do
  it "should return 'AppleCoreMedia' as its browser" do
    expect(@useragent.browser).to eq("AppleCoreMedia")
  end
end

shared_examples "AppleCoreMedia runs on" do |platform, os|
  it "should return '#{platform}' as its platform" do
    expect(@useragent.platform).to eq(platform)
  end

  it "should return '#{os}' as its OS" do
    expect(@useragent.os).to eq(os)
  end
end

shared_examples "AppleCoreMedia has version number" do |version|
  it "should return '#{version}' as its version" do
    expect(@useragent.version).to eq(version)
  end
end

shared_examples "AppleCoreMedia has localization" do |locale|
  it "should return '#{locale}' as its localization" do
    expect(@useragent.localization).to eq(locale)
  end
end

shared_examples "AppleCoreMedia has strong encryption" do
  it "should return ':strong' as its security" do
    expect(@useragent.security).to eq(:strong)
  end
end

describe "UserAgent: AppleCoreMedia/1.0.0.12B435 (iPhone; U; CPU OS 8_1_1 like Mac OS X; en_us)" do
  before do
    @useragent = UserAgent.parse("AppleCoreMedia/1.0.0.12B435 (iPhone; U; CPU OS 8_1_1 like Mac OS X; en_us)")
  end

  it_behaves_like "AppleCoreMedia"
  it_behaves_like "AppleCoreMedia runs on", "iPhone", "iOS 8.1.1"
  it_behaves_like "AppleCoreMedia has version number", "1.0.0.12B435"
  it_behaves_like "AppleCoreMedia has localization", "en_us"
  it_behaves_like "AppleCoreMedia has strong encryption"
end

describe "UserAgent: AppleCoreMedia/1.0.0.10B400 (iPod; U; CPU OS 6_1_5 like Mac OS X; en_us)" do
  before do
    @useragent = UserAgent.parse("AppleCoreMedia/1.0.0.10B400 (iPod; U; CPU OS 6_1_5 like Mac OS X; en_us)")
  end

  it_behaves_like "AppleCoreMedia"
  it_behaves_like "AppleCoreMedia runs on", "iPod", "iOS 6.1.5"
  it_behaves_like "AppleCoreMedia has version number", "1.0.0.10B400"
  it_behaves_like "AppleCoreMedia has localization", "en_us"
  it_behaves_like "AppleCoreMedia has strong encryption"
end

describe "UserAgent: AppleCoreMedia/1.0.0.11D257 (iPad; U; CPU OS 7_1_2 like Mac OS X; en_gb)" do
  before do
    @useragent = UserAgent.parse("AppleCoreMedia/1.0.0.11D257 (iPad; U; CPU OS 7_1_2 like Mac OS X; en_gb)")
  end

  it_behaves_like "AppleCoreMedia"
  it_behaves_like "AppleCoreMedia runs on", "iPad", "iOS 7.1.2"
  it_behaves_like "AppleCoreMedia has version number", "1.0.0.11D257"
  it_behaves_like "AppleCoreMedia has localization", "en_gb"
  it_behaves_like "AppleCoreMedia has strong encryption"
end

describe "UserAgent: AppleCoreMedia/1.0.0.11D257 (iPhone; U; CPU OS 7_1_2 like Mac OS X; en_us)" do
  before do
    @useragent = UserAgent.parse("AppleCoreMedia/1.0.0.11D257 (iPhone; U; CPU OS 7_1_2 like Mac OS X; en_us)")
  end

  it_behaves_like "AppleCoreMedia"
  it_behaves_like "AppleCoreMedia runs on", "iPhone", "iOS 7.1.2"
  it_behaves_like "AppleCoreMedia has version number", "1.0.0.11D257"
  it_behaves_like "AppleCoreMedia has localization", "en_us"
  it_behaves_like "AppleCoreMedia has strong encryption"
end
