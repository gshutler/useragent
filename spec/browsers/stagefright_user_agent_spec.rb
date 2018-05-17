require 'user_agent'

shared_examples 'Stagefright' do
  it "returns 'Stagefright' as its browser" do
    expect(@useragent.browser).to eq('Stagefright')
  end
end

describe "UserAgent: stagefright/1.2 (Linux;Android 5.0.1)" do
  before do
    @useragent = UserAgent.parse("stagefright/1.2 (Linux;Android 5.0.1)")
  end

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(@useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.0.1' as its operating system" do
    expect(@useragent.os).to eq('Android 5.0.1')
  end
end

describe "UserAgent: SonyD5803 Build/23.0.1.A.5.77 stagefright/1.2 (Linux;Android 4.4.4)" do
  before do
    @useragent = UserAgent.parse("SonyD5803 Build/23.0.1.A.5.77 stagefright/1.2 (Linux;Android 4.4.4)")
  end

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(@useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "returns 'Android 4.4.4' as its operating system" do
    expect(@useragent.os).to eq('Android 4.4.4')
  end
end

describe "UserAgent: Samsung SAMSUNG-SGH-I747 stagefright/1.2 (Linux;Android 4.4.2)" do
  before do
    @useragent = UserAgent.parse("Samsung SAMSUNG-SGH-I747 stagefright/1.2 (Linux;Android 4.4.2)")
  end

  it_behaves_like 'Stagefright'

  it "returns '1.2' as its version" do
    expect(@useragent.version).to eq('1.2')
  end

  it "returns 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "returns 'Android 4.4.2' as its operating system" do
    expect(@useragent.os).to eq('Android 4.4.2')
  end
end

describe "UserAgent: Samsung SM-G900T stagefright/Beyonce/1.1.9 (Linux;Android 5.1.1)" do
  before do
    @useragent = UserAgent.parse("Samsung SM-G900T stagefright/Beyonce/1.1.9 (Linux;Android 5.1.1)")
  end

  it_behaves_like 'Stagefright'

  it "returns 'Beyonce/1.1.9' as its version" do
    expect(@useragent.version).to eq('Beyonce/1.1.9')
  end

  it "returns 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "returns 'Android 5.1.1' as its operating system" do
    expect(@useragent.os).to eq('Android 5.1.1')
  end
end
