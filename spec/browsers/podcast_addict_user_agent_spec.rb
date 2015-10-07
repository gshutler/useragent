require 'user_agent'

shared_examples 'Podcast Addict' do
  it "returns 'Podcast Addict' as its browser" do
    expect(@useragent.browser).to eq('Podcast Addict')
  end

  it 'returns nil as its version' do
    expect(@useragent.version).to be_nil
  end

  it "returns 'Android' as its platform" do
    expect(@useragent.platform).to eq('Android')
  end

  it "returns ':strong' as its security" do
    expect(@useragent.security).to eq(:strong)
  end

  it 'is a mobile user agent' do
    expect(@useragent.mobile?).to be true
  end
end

describe "UserAgent: Podcast Addict - Dalvik/1.6.0 (Linux; U; Android 4.4.2; LG-D631 Build/KOT49I.D63110b)" do
  before do
    @useragent = UserAgent.parse("Podcast Addict - Dalvik/1.6.0 (Linux; U; Android 4.4.2; LG-D631 Build/KOT49I.D63110b)")
  end

  it_behaves_like 'Podcast Addict'

  it "returns 'Android 4.4.2' as its operating system" do
    expect(@useragent.os).to eq('Android 4.4.2')
  end

  it "returns 'LG-D631' as its device" do
    expect(@useragent.device).to eq('LG-D631')
  end

  it "returns 'KOT49I.D63110b' as its device build" do
    expect(@useragent.device_build).to eq('KOT49I.D63110b')
  end

  it 'returns nil as its localization' do
    expect(@useragent.localization).to be_nil
  end
end

describe "UserAgent: Podcast Addict - Dalvik/2.1.0 (Linux; U; Android 5.1; XT1093 Build/LPE23.32-21.3)" do
  before do
    @useragent = UserAgent.parse("Podcast Addict - Dalvik/2.1.0 (Linux; U; Android 5.1; XT1093 Build/LPE23.32-21.3)")
  end

  it_behaves_like 'Podcast Addict'

  it "returns 'Android 5.1' as its operating system" do
    expect(@useragent.os).to eq('Android 5.1')
  end

  it "returns 'XT1093' as its device" do
    expect(@useragent.device).to eq('XT1093')
  end

  it "returns 'LPE23.32-21.3' as its device build" do
    expect(@useragent.device_build).to eq('LPE23.32-21.3')
  end

  it 'returns nil as its localization' do
    expect(@useragent.localization).to be_nil
  end
end

describe "UserAgent: Podcast Addict - Dalvik/2.1.0 (Linux; U; Android M Build/MPZ79M)" do
  before do
    @useragent = UserAgent.parse("Podcast Addict - Dalvik/2.1.0 (Linux; U; Android M Build/MPZ79M)")
  end

  it_behaves_like 'Podcast Addict'

  it "returns 'Android' as its operating system" do
    expect(@useragent.os).to eq('Android')
  end

  it "returns 'Android M' as its device" do
    expect(@useragent.device).to eq('Android M')
  end

  it "returns 'MPZ79M' as its device build" do
    expect(@useragent.device_build).to eq('MPZ79M')
  end

  it 'returns nil as its localization' do
    expect(@useragent.localization).to be_nil
  end
end

describe "UserAgent: Podcast Addict - Mozilla/5.0 (Linux; U; Android 4.2.2; en-ca; ALCATEL ONE TOUCH 6040A Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30" do
  before do
    @useragent = UserAgent.parse("Podcast Addict - Mozilla/5.0 (Linux; U; Android 4.2.2; en-ca; ALCATEL ONE TOUCH 6040A Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30")
  end

  it_behaves_like 'Podcast Addict'

  it "returns 'Android' as its operating system" do
    expect(@useragent.os).to eq('Android 4.2.2')
  end

  it "returns 'ALCATEL ONE TOUCH 6040A' as its device" do
    expect(@useragent.device).to eq('ALCATEL ONE TOUCH 6040A')
  end

  it "returns 'JDQ39' as its device build" do
    expect(@useragent.device_build).to eq('JDQ39')
  end

  it "returns 'en-ca' as its localization" do
    expect(@useragent.localization).to eq('en-ca')
  end
end