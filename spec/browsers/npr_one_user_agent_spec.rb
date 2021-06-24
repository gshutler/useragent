require 'user_agent'

shared_examples_for 'NPR One' do |version, platform, os|
  it "returns 'NPR One' as its browser" do
    expect(useragent.browser).to eq('NPR One')
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

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: NPROneAndroid" do
  let(:useragent) { UserAgent.parse("NPROneAndroid") }

  it_behaves_like 'NPR One', nil, 'Android', nil
end

describe "UserAgent: NPR%20One/316 CFNetwork/1240.0.4 Darwin/20.5.0" do
  let(:useragent) { UserAgent.parse("NPR%20One/316 CFNetwork/1240.0.4 Darwin/20.5.0") }

  it_behaves_like 'NPR One', '316', 'iOS', 'iOS 14.6'
end

describe "UserAgent: Dalvik/2.1.0 (Linux; U; Android 10; GM1917 Build/QKQ1.190716.003) nprone_android/1.9.9.3/OSv:10" do
  let(:useragent) { UserAgent.parse("Dalvik/2.1.0 (Linux; U; Android 10; GM1917 Build/QKQ1.190716.003) nprone_android/1.9.9.3/OSv:10") }

  it_behaves_like 'NPR One', '1.9.9.3', 'Android', 'Android 10'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 10; Chromecast Build/QTS2.200918.033; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36 NPR%20One/1.1.0%20%28593%29" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 10; Chromecast Build/QTS2.200918.033; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/88.0.4324.181 Mobile Safari/537.36 NPR%20One/1.1.0%20%28593%29") }

  it_behaves_like 'NPR One', '1.1.0', 'Android', 'Android 10'
end
