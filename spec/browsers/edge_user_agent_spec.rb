require 'user_agent'

shared_examples_for "Edge browser" do
  it "should return 'Edge' as its browser" do
    expect(@useragent.browser).to eq("Edge")
  end
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240")
  end

  it_should_behave_like "Edge browser"

  it "should return '12.10240' as its version" do
    expect(@useragent.version).to eq("12.10240")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 10' as its os" do
    expect(@useragent.os).to eq("Windows 10")
  end
end

describe "Mozilla/5.0 SHC; SHC-Unit-04973; SHC-HTS; SHC-KIOSK; SHC-MAC-0000 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 SHC; SHC-Unit-04973; SHC-HTS; SHC-KIOSK; SHC-MAC-0000 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586")
  end

  it_should_behave_like "Edge browser"

  it "should return '13.10586' as its version" do
    expect(@useragent.version).to eq("13.10586")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 10' as its os" do
    expect(@useragent.os).to eq("Windows 10")
  end
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24")
  end

  it_should_behave_like "Edge browser"

  it "should return '13.10586' as its version" do
    expect(@useragent.version).to eq("74.1.96.24")
  end

  it "should return 'Windows' as its platform" do
    expect(@useragent.platform).to eq("Windows")
  end

  it "should return 'Windows 10' as its os" do
    expect(@useragent.os).to eq("Windows 10")
  end
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36 Edg/88.0.705.56" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36 Edg/88.0.705.56")
  end

  it_should_behave_like "Edge browser"

  it "should return '88.0.705.56' as its version" do
    expect(@useragent.version).to eq("88.0.705.56")
  end

  it "should return 'Macintosh' as its platform" do
    expect(@useragent.platform).to eq("Macintosh")
  end

  it "should return 'OS X 10.15.7' as its os" do
    expect(@useragent.os).to eq("OS X 10.15.7")
  end
end

describe "Mozilla/5.0 (Linux; Android 10; Pixel 3 XL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.141 Mobile Safari/537.36 EdgA/45.12.4.5125" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (Linux; Android 10; Pixel 3 XL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.141 Mobile Safari/537.36 EdgA/45.12.4.5125")
  end

  it_should_behave_like "Edge browser"

  it "should return '45.12.4.5125' as its version" do
    expect(@useragent.version).to eq("45.12.4.5125")
  end

  it "should return 'Android' as its platform" do
    expect(@useragent.platform).to eq("Android")
  end

  it "should return 'Android 10' as its os" do
    expect(@useragent.os).to eq("Android 10")
  end
end

describe "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Safari/603.2.4 EdgiOS/41.1.35.1" do
  before do
    @useragent = UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Safari/603.2.4 EdgiOS/41.1.35.1")
  end

  it_should_behave_like "Edge browser"

  it "should return '41.1.35.1' as its version" do
    expect(@useragent.version).to eq("41.1.35.1")
  end

  it "should return 'iPhone' as its platform" do
    expect(@useragent.platform).to eq("iPhone")
  end

  it "should return 'iOS 10.3.2' as its os" do
    expect(@useragent.os).to eq("iOS 10.3.2")
  end
end
