require 'user_agent'

shared_examples 'Amazon Music' do |version, platform, os, type|
  it "returns 'Amazon Music' as its browser" do
    expect(useragent.browser).to eq('Amazon Music')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns '#{platform}' as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end

  if type == :mobile
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_desktop }
    it { expect(useragent).not_to be_speaker }
    it { expect(useragent).not_to be_bot }
  else
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
    it { expect(useragent).not_to be_speaker }
    it { expect(useragent).not_to be_bot }
  end
end

describe "UserAgent: AmazonMusic/17.7.2 Mozilla/5.0 (Linux; Android 8.1.0; 5059X Build/O11019; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36" do
  let!(:useragent) { UserAgent.parse("AmazonMusic/17.7.2 Mozilla/5.0 (Linux; Android 8.1.0; 5059X Build/O11019; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36") }

  it_behaves_like 'Amazon Music', '17.7.2', 'Android', 'Android 8.1.0', :mobile
end

describe "UserAgent: AmazonMusic/10.0.0 iPad8,9 CFNetwork/1220.1 Darwin/20.3.0" do
  let!(:useragent) { UserAgent.parse("AmazonMusic/10.0.0 iPad8,9 CFNetwork/1220.1 Darwin/20.3.0") }

  it_behaves_like 'Amazon Music', '10.0.0', 'iPad', 'iOS 14.4.x', :mobile
end

describe "UserAgent: AmazonMusic/10.2.0 iPhone11,6 CFNetwork/1237 Darwin/20.4.0" do
  let!(:useragent) { UserAgent.parse("AmazonMusic/10.2.0 iPhone11,6 CFNetwork/1237 Darwin/20.4.0") }

  it_behaves_like 'Amazon Music', '10.2.0', 'iPhone', 'iOS 14.5', :mobile
end

describe "UserAgent: AmazonMusic/1.0 x86_64 CFNetwork/1121.2.1 Darwin/19.6.0" do
  let!(:useragent) { UserAgent.parse("AmazonMusic/1.0 x86_64 CFNetwork/1121.2.1 Darwin/19.6.0") }

  it_behaves_like 'Amazon Music', '1.0', 'Macintosh', 'macOS 10.15.6'
end

describe "UserAgent: AmazonMusic/16.17.1 Dalvik/2.1.0 (Linux; U; Android 7.0; LGL83BL Build/NRD90U)" do
  let!(:useragent) { UserAgent.parse("AmazonMusic/16.17.1 Dalvik/2.1.0 (Linux; U; Android 7.0; LGL83BL Build/NRD90U)") }

  it_behaves_like 'Amazon Music', '16.17.1', 'Android', 'Android 7.0', :mobile
end
