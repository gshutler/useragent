require 'user_agent'

shared_examples_for "Google Assistant" do
  it "should return 'Google Assistant' as its browser" do
    expect(@useragent.browser).to eq("Google Assistant")
  end
end

describe "UserAgent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1")
  end

  it_should_behave_like "Google Assistant"

  it "should return '42.0.183854831' as its version" do
    expect(@useragent.version).to eq('42.0.183854831')
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq('iPhone')
  end

  it "should return 'iOS 9.3.5' as its os" do
    expect(@useragent.os).to eq('iOS 9.3.5')
  end
end

describe "UserAgent: Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4")
  end

  it_should_behave_like "Google Assistant"

  it "should return '6.0.51363' as its version" do
    expect(@useragent.version).to eq('6.0.51363')
  end

  it "should return 'iPad' as its platform" do
    expect(@useragent.platform).to eq('iPad')
  end

  it "should return 'iOS 9.0.2' as its os" do
    expect(@useragent.os).to eq('iOS 9.0.2')
  end
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm")
  end

  it_should_behave_like "Google Assistant"

  it "should return '6.3.36.21.arm' as its version" do
    expect(@useragent.version).to eq('6.3.36.21.arm')
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "should return 'Android 5.0.2' as its os" do
    expect(@useragent.os).to eq('Android 5.0.2')
  end
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64")
  end

  it_should_behave_like "Google Assistant"

  it "should return '7.8.26.21.arm64' as its version" do
    expect(@useragent.version).to eq('7.8.26.21.arm64')
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "should return 'Android 8.1.0' as its os" do
    expect(@useragent.os).to eq('Android 8.1.0')
  end
end
