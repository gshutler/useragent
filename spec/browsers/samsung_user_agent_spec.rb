require 'user_agent'

shared_examples 'SamsungBrowser' do |version, platform, os|
  it "returns 'SamsungBrowser' as its browser" do
    expect(useragent.browser).to eq('Samsung Internet Browser')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns #{platform} as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "returns #{os} as its operating system" do
    expect(useragent.os).to eq(os)
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-G991B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/11.1 Chrome/75.0.3770.143 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-G991B) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/11.1 Chrome/75.0.3770.143 Mobile Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '11.1', 'Android', 'Android 11'
end

describe "UserAgent: Dalvik/2.1.0 (Linux; U; Android 10; SM-N975U Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/4.0 Chrome/44.0.2403.133 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Dalvik/2.1.0 (Linux; U; Android 10; SM-N975U Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/4.0 Chrome/44.0.2403.133 Mobile Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '4.0', 'Android', 'Android 10'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 10; 9032Z) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/13.2 Chrome/83.0.4103.106 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 10; 9032Z) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/13.2 Chrome/83.0.4103.106 Mobile Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '13.2', 'Android', 'Android 10'
end

describe "UserAgent: Firefox/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I9505 Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.1 Chrome/34.0.1847.76 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Firefox/5.0 (Linux; Android 5.0.1; SAMSUNG GT-I9505 Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.1 Chrome/34.0.1847.76 Mobile Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '2.1', 'Android', 'Android 5.0.1'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 10.0; SAMSUNG SM-G960U Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.2 Chrome/51.0.2704.106 Mobile VR Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 10.0; SAMSUNG SM-G960U Build/QP1A.190711.020) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/5.2 Chrome/51.0.2704.106 Mobile VR Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '5.2', 'Android', 'Android 10.0'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 4.4.4; SAMSUNG SM-G318H/G318HJVS0AQC2 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.0 Chrome/34.0.1847.76 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 4.4.4; SAMSUNG SM-G318H/G318HJVS0AQC2 Build/KTU84P) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/2.0 Chrome/34.0.1847.76 Mobile Safari/537.36") }

  it_behaves_like 'SamsungBrowser', '2.0', 'Android', 'Android 4.4.4'
end
