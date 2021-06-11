require 'user_agent'

shared_examples 'OkHttp' do |version, platform, os, type|
  it "returns 'OkHttp' as its browser" do
    expect(useragent.browser).to eq('OkHttp')
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
  else
    it { expect(useragent).not_to be_mobile }
  end

  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: okhttp/3.8.1" do
  let(:useragent) { UserAgent.parse("okhttp/3.8.1") }

  it_behaves_like 'OkHttp', '3.8.1', nil, nil, nil
end

describe "UserAgent: okhttp/3.10.0 BMID/E67925BB27" do
  let!(:useragent) { UserAgent.parse("okhttp/3.10.0 BMID/E67925BB27") }

  it_behaves_like 'OkHttp', '3.10.0', nil, nil, nil
end

describe "UserAgent: okhttp/3.8.1 Dalvik/2.1.0 (Linux; U; Android 7.1.1; vivo X20A Build/NMF26X) baiduboxapp/10.1.0.11 (Baidu; P1 7.1.1)" do
  let!(:useragent) { UserAgent.parse("okhttp/3.8.1 Dalvik/2.1.0 (Linux; U; Android 7.1.1; vivo X20A Build/NMF26X) baiduboxapp/10.1.0.11 (Baidu; P1 7.1.1)") }

  it_behaves_like 'OkHttp', '3.8.1', 'Android', 'Android 7.1.1', :mobile
end

describe "UserAgent: okhttp/2.7.5 nyt-android/6.19.3 ,okhttp/2.7.5 nyt-android/6.19.3" do
  let!(:useragent) { UserAgent.parse("okhttp/2.7.5 nyt-android/6.19.3 ,okhttp/2.7.5 nyt-android/6.19.3") }

  it_behaves_like 'OkHttp', '2.7.5', 'Android', nil, :mobile
end

describe "UserAgent: NRC Audio/1.0.14 (nl.nrc.audio; build:19; Android 11; Sdk:30; Manufacturer:samsung; Model: SM-A515F) OkHttp/4.9.0" do
  let!(:useragent) { UserAgent.parse("NRC Audio/1.0.14 (nl.nrc.audio; build:19; Android 11; Sdk:30; Manufacturer:samsung; Model: SM-A515F) OkHttp/4.9.0") }

  it_behaves_like 'OkHttp', '4.9.0', 'Android', 'Android 11', :mobile
end
