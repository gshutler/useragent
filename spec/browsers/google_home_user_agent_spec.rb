require 'user_agent'

shared_examples_for "Google Home" do
  it "should return 'Google Home' as its browser" do
    expect(useragent.browser).to eq("Google Home")
  end

  it 'returns as a speaker' do
    expect(useragent).to be_speaker
  end
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 6.0.1; Build/M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.41 Safari/537.36 CrKey/1.29.104695" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 6.0.1; Build/M-MMB29M-rzs-us-sf-bld2-19HP-08.02.AM) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.41 Safari/537.36 CrKey/1.29.104695") }

  it_should_behave_like "Google Home"

  it "should return '1.29.104695' as its version" do
    expect(useragent.version).to eq('1.29.104695')
  end

  it "should return 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "should return 'Android 6.0.1' as its os" do
    expect(useragent.os).to eq('Android 6.0.1')
  end
end

describe "UserAgent: Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36 CrKey/1.34.119222" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux aarch64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3398.0 Safari/537.36 CrKey/1.34.119222") }

  it_should_behave_like "Google Home"

  it "should return '1.34.119222' as its version" do
    expect(useragent.version).to eq('1.34.119222')
  end

  it "should return 'X11' as its platform" do
    expect(useragent.platform).to eq('X11')
  end

  it "should return 'Linux aarch64' as its os" do
    expect(useragent.os).to eq('Linux aarch64')
  end
end

describe "UserAgent: Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.71 Safari/537.36 CrKey/1.23.85114" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux armv7l) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.71 Safari/537.36 CrKey/1.23.85114") }

  it_should_behave_like "Google Home"

  it "should return '1.23.85114' as its version" do
    expect(useragent.version).to eq('1.23.85114')
  end

  it "should return 'X11' as its platform" do
    expect(useragent.platform).to eq('X11')
  end

  it "should return 'Linux armv7l' as its os" do
    expect(useragent.os).to eq('Linux armv7l')
  end
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 8.0; Build/OPR2.170623.027) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.147 Safari/537.36 CrKey/1.31.115279" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 8.0; Build/OPR2.170623.027) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.147 Safari/537.36 CrKey/1.31.115279") }

  it_should_behave_like "Google Home"

  it "should return '1.31.115279' as its version" do
    expect(useragent.version).to eq('1.31.115279')
  end

  it "should return 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "should return 'Android 8.0' as its os" do
    expect(useragent.os).to eq('Android 8.0')
  end
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 7.0; FRD-L04 Build/HUAWEIFRD-L04; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 CrKey" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 7.0; FRD-L04 Build/HUAWEIFRD-L04; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 CrKey") }

  it_should_behave_like "Google Home"

  it "should return nil as its version" do
    expect(useragent.version).to be_nil
  end

  it "should return 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "should return 'Android 7.0' as its os" do
    expect(useragent.os).to eq('Android 7.0')
  end
end
