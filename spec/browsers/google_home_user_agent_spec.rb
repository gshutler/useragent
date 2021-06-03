require 'user_agent'

shared_examples_for "Google Home" do |version, platform, os|
  it "should return 'Google Home' as its browser" do
    expect(useragent.browser).to eq("Google Home")
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

  it { expect(useragent).to be_speaker }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 6.0.1; Build/M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.41 Safari/537.36 CrKey/1.29.104695" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 6.0.1; Build/M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.41 Safari/537.36 CrKey/1.29.104695") }

  it_behaves_like 'Google Home', '1.29.104695', 'Android', 'Android 6.0.1'
end

describe "UserAgent: Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36 CrKey/1.34.119222" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36 CrKey/1.34.119222") }

  it_behaves_like 'Google Home', '1.34.119222', 'X11', 'Linux aarch64'
end

describe "UserAgent: Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.71 Safari/537.36 CrKey/1.23.85114" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.71 Safari/537.36 CrKey/1.23.85114") }

  it_behaves_like 'Google Home', '1.23.85114', 'X11', 'Linux armv7l'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 8.0; Build/OPR2.170623.027) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.147 Safari/537.36 CrKey/1.31.115279" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 8.0; Build/OPR2.170623.027) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.147 Safari/537.36 CrKey/1.31.115279") }

  it_behaves_like 'Google Home', '1.31.115279', 'Android', 'Android 8.0'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 7.0; FRD-L04 Build/HUAWEIFRD-L04; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 CrKey" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 7.0; FRD-L04 Build/HUAWEIFRD-L04; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 CrKey") }

  it_behaves_like 'Google Home', nil, 'Android', 'Android 7.0'
end
