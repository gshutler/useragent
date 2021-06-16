require 'user_agent'

shared_examples 'SamsungBrowser' do |version, platform, os|
  it "returns 'SamsungBrowser' as its browser" do
    expect(useragent.browser).to eq('SamsungBrowser')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'Android' as its operating system" do
    expect(useragent.os).to eq('Android')
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-G991B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/11.1 Chrome/75.0.3770.143 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-G991B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/11.1 Chrome/75.0.3770.143 Mobile Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '11.1', 'Android', 'Android'
end