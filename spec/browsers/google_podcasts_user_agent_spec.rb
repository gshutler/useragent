require 'user_agent'

shared_examples_for 'Google Podcasts' do |version, platform, os|
  it "should return 'Google Podcasts' as its browser" do
    expect(useragent.browser).to eq("Google Podcasts")
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
end

describe "UserAgent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) GSA/42.0.183854831 Mobile/13G36 Safari/601.1") }

  it_should_behave_like 'Google Podcasts', '42.0.183854831', 'iPhone', 'iOS 9.3.5'
end

describe "UserAgent: Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPad; CPU OS 9_0_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) GSA/6.0.51363 Mobile/13A452 Safari/600.1.4") }

  it_should_behave_like 'Google Podcasts', '6.0.51363', 'iPad', 'iOS 9.0.2'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 5.0.2; LG-V496 Build/LRX22G; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.97 Safari/537.36 GSA/6.3.36.21.arm") }

  it_should_behave_like 'Google Podcasts', '6.3.36.21.arm', 'Android', 'Android 5.0.2'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 8.1.0; Pixel Build/OPM2.171019.029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/64.0.3282.137 Mobile Safari/537.36 GSA/7.8.26.21.arm64") }

  it_should_behave_like 'Google Podcasts', '7.8.26.21.arm64', 'Android', 'Android 8.1.0'
end

describe "UserAgent: GooglePodcasts/2.0.10 iPad/14.5 hw/iPad6_3" do
  let!(:useragent) { UserAgent.parse("GooglePodcasts/2.0.10 iPad/14.5 hw/iPad6_3") }

  it_should_behave_like 'Google Podcasts', '2.0.10', 'iPad', 'iOS 14.5'
end

describe "UserAgent: GooglePodcasts/2.0.10 iPhone/12.1 hw/iPhone11_2" do
  let!(:useragent) { UserAgent.parse("GooglePodcasts/2.0.10 iPhone/12.1 hw/iPhone11_2") }

  it_should_behave_like 'Google Podcasts', '2.0.10', 'iPhone', 'iOS 12.1'
end

describe "UserAgent: GooglePodcasts/2.0.9 iPod_touch/14.4.1 hw/iPod9_1" do
  let!(:useragent) { UserAgent.parse("GooglePodcasts/2.0.9 iPod_touch/14.4.1 hw/iPod9_1") }

  it_should_behave_like 'Google Podcasts', '2.0.9', 'iPod touch', 'iOS 14.4.1'
end
