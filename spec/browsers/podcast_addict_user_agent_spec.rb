require 'user_agent'

shared_examples 'Podcast Addict' do |version, os, security = :strong|
  it "returns 'Podcast Addict' as its browser" do
    expect(useragent.browser).to eq('Podcast Addict')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eql(version)
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns 'security' as its security" do
    expect(useragent.security).to eq(security)
  end

  it 'is a mobile user agent' do
    expect(useragent.mobile?).to be true
  end
end

describe "UserAgent: Podcast Addict - Dalvik/1.6.0 (Linux; U; Android 4.4.2; LG-D631 Build/KOT49I.D63110b)" do
  let(:useragent) { UserAgent.parse("Podcast Addict - Dalvik/1.6.0 (Linux; U; Android 4.4.2; LG-D631 Build/KOT49I.D63110b)") }

  it_behaves_like 'Podcast Addict', nil, 'Android 4.4.2'

  it "returns 'LG-D631' as its device" do
    expect(useragent.device).to eq('LG-D631')
  end

  it "returns 'KOT49I.D63110b' as its device build" do
    expect(useragent.device_build).to eq('KOT49I.D63110b')
  end
end

describe "UserAgent: Podcast Addict - Dalvik/2.1.0 (Linux; U; Android 5.1; XT1093 Build/LPE23.32-21.3)" do
  let(:useragent) { UserAgent.parse("Podcast Addict - Dalvik/2.1.0 (Linux; U; Android 5.1; XT1093 Build/LPE23.32-21.3)") }

  it_behaves_like 'Podcast Addict', nil, 'Android 5.1'

  it "returns 'XT1093' as its device" do
    expect(useragent.device).to eq('XT1093')
  end

  it "returns 'LPE23.32-21.3' as its device build" do
    expect(useragent.device_build).to eq('LPE23.32-21.3')
  end
end

describe "UserAgent: Podcast Addict - Dalvik/2.1.0 (Linux; U; Android M Build/MPZ79M)" do
  let(:useragent) { UserAgent.parse("Podcast Addict - Dalvik/2.1.0 (Linux; U; Android M Build/MPZ79M)") }

  it_behaves_like 'Podcast Addict', nil, 'Android'

  it "returns 'Android M' as its device" do
    expect(useragent.device).to eq('Android M')
  end

  it "returns 'MPZ79M' as its device build" do
    expect(useragent.device_build).to eq('MPZ79M')
  end
end

describe "UserAgent: Podcast Addict - Mozilla/5.0 (Linux; U; Android 4.2.2; en-ca; ALCATEL ONE TOUCH 6040A Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30" do
  let(:useragent) { UserAgent.parse("Podcast Addict - Mozilla/5.0 (Linux; U; Android 4.2.2; en-ca; ALCATEL ONE TOUCH 6040A Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30") }

  it_behaves_like 'Podcast Addict', nil, 'Android 4.2.2'

  it "returns 'ALCATEL ONE TOUCH 6040A' as its device" do
    expect(useragent.device).to eq('ALCATEL ONE TOUCH 6040A')
  end

  it "returns 'JDQ39' as its device build" do
    expect(useragent.device_build).to eq('JDQ39')
  end
end

describe "Mozilla/5.0 (Linux; Android 10; Lenovo TB-8705F Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/81.0.4044.138 Safari/537.36,PodcastAddict/v5 (+https://podcastaddict.com/; Android podcast app)" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 10; Lenovo TB-8705F Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/81.0.4044.138 Safari/537.36,PodcastAddict/v5 (+https://podcastaddict.com/; Android podcast app)") }

  it_behaves_like 'Podcast Addict', '5', 'Android 10', nil
end

describe "PodcastAddict/v2 - Mozilla/5.0 (Linux; U; Android 4.2.2; bg-bg; 6037Y Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30" do
  let(:useragent) { UserAgent.parse("PodcastAddict/v2 - Mozilla/5.0 (Linux; U; Android 4.2.2; bg-bg; 6037Y Build/JDQ39) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.2 Mobile Safari/534.30") }

  it_behaves_like 'Podcast Addict', '2', 'Android 4.2.2'
end

describe "PodcastAddict/v2 - Dalvik/2.1.0 (Linux; U; Android 10; I4213 Build/53.1.A.2.2)" do
  let(:useragent) { UserAgent.parse("PodcastAddict/v2 - Dalvik/2.1.0 (Linux; U; Android 10; I4213 Build/53.1.A.2.2)") }

  it_behaves_like 'Podcast Addict', '2', 'Android 10'
end
