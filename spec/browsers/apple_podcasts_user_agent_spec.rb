require 'user_agent'

shared_examples 'Apple Podcasts with details' do |version, platform, os|
  it "returns 'Apple Podcasts' as its browser" do
    expect(useragent.browser).to eq('Apple Podcasts')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns '#{platform}' as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "returns '#{os}' as its os" do
    expect(useragent.os).to eq(os)
  end

  if platform == 'iOS'
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_desktop }
  else
    it { expect(useragent).not_to be_mobile }
    it { expect(useragent).to be_desktop }
  end
end

describe "%D8%A7%D9%84%D8%A8%D9%88%D8%AF%D9%83%D8%A7%D8%B3%D8%AA/1430.27 CFNetwork/1150 Darwin/20.0.0" do
  let!(:useragent) { UserAgent.parse("%D8%A7%D9%84%D8%A8%D9%88%D8%AF%D9%83%D8%A7%D8%B3%D8%AA/1430.27 CFNetwork/1150 Darwin/20.0.0") }

  it_behaves_like 'Apple Podcasts with details', '1430.27', 'iOS', 'iOS 14.0.x'
end

describe "Podcasty/1400.173.3 CFNetwork/1085.4 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Podcasty/1400.173.3 CFNetwork/1085.4 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1400.173.3', 'Macintosh', 'macOS 10.15'
end

describe "Podcastit/1425.5 CFNetwork/1121.1.1 Darwin/19.2.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Podcastit/1425.5 CFNetwork/1121.1.1 Darwin/19.2.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1425.5', 'Macintosh', 'macOS 10.15.2'
end

describe "Balados/1400.173.3 CFNetwork/1085.4 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Balados/1400.173.3 CFNetwork/1085.4 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1400.173.3', 'Macintosh', 'macOS 10.15'
end

describe "%D7%A4%D7%95%D7%93%D7%A7%D7%90%D7%A1%D7%98%D7%99%D7%9D/1400.195 CFNetwork/1089 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("%D7%A4%D7%95%D7%93%D7%A7%D7%90%D7%A1%D7%98%D7%99%D7%9D/1400.195 CFNetwork/1089 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1400.195', 'Macintosh', 'macOS 10.15'
end

describe "%E0%A4%AA%E0%A5%89%E0%A4%A1%E0%A4%95%E0%A4%BE%E0%A4%B8%E0%A5%8D%E0%A4%9F/1500.2 CFNetwork/1156 Darwin/20.0.0" do
  let!(:useragent) { UserAgent.parse("%E0%A4%AA%E0%A5%89%E0%A4%A1%E0%A4%95%E0%A4%BE%E0%A4%B8%E0%A5%8D%E0%A4%9F/1500.2 CFNetwork/1156 Darwin/20.0.0") }

  it_behaves_like 'Apple Podcasts with details', '1500.2', 'iOS', 'iOS 14.0.x'
end

describe "Podcasti/1400.192 CFNetwork/1088.1 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Podcasti/1400.192 CFNetwork/1088.1 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1400.192', 'Macintosh', 'macOS 10.15'
end

describe "Podcastok/1425.5 CFNetwork/1121.1.2 Darwin/19.2.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Podcastok/1425.5 CFNetwork/1121.1.2 Darwin/19.2.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1425.5', 'Macintosh', 'macOS 10.15.2'
end

describe "%ED%8C%9F%EC%BA%90%EC%8A%A4%ED%8A%B8/1430.39 CFNetwork/1125 Darwin/19.4.0" do
  let!(:useragent) { UserAgent.parse("%ED%8C%9F%EC%BA%90%EC%8A%A4%ED%8A%B8/1430.39 CFNetwork/1125 Darwin/19.4.0") }

  it_behaves_like 'Apple Podcasts with details', '1430.39', 'iOS', 'iOS 13.4.x'
end

describe "Podkaster/1420.34 CFNetwork/1120 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Podkaster/1420.34 CFNetwork/1120 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1420.34', 'Macintosh', 'macOS 10.15'
end

describe "Podcasturi/1400.174 CFNetwork/1085.1 Darwin/19.0.0" do
  let!(:useragent) { UserAgent.parse("Podcasturi/1400.174 CFNetwork/1085.1 Darwin/19.0.0") }

  it_behaves_like 'Apple Podcasts with details', '1400.174', 'iOS', 'iOS 13.0'
end

describe "%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%D1%8B/1500.3 CFNetwork/1156 Darwin/20.0.0" do
  let!(:useragent) { UserAgent.parse("%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%D1%8B/1500.3 CFNetwork/1156 Darwin/20.0.0") }

  it_behaves_like 'Apple Podcasts with details', '1500.3', 'iOS', 'iOS 14.0.x'
end

describe "Podcaster/1400.173.4 CFNetwork/1085.4 Darwin/19.0.0" do
  let!(:useragent) { UserAgent.parse("Podcaster/1400.173.4 CFNetwork/1085.4 Darwin/19.0.0") }

  it_behaves_like 'Apple Podcasts with details', '1400.173.4', 'iOS', 'iOS 13.0'
end

describe "%E0%B8%9E%E0%B9%87%E0%B8%AD%E0%B8%94%E0%B8%84%E0%B8%B2%E0%B8%AA%E0%B8%97%E0%B9%8C/1425.5 CFNetwork/1121.2.2 Darwin/19.3.0" do
  let!(:useragent) { UserAgent.parse("%E0%B8%9E%E0%B9%87%E0%B8%AD%E0%B8%94%E0%B8%84%E0%B8%B2%E0%B8%AA%E0%B8%97%E0%B9%8C/1425.5 CFNetwork/1121.2.2 Darwin/19.3.0") }

  it_behaves_like 'Apple Podcasts with details', '1425.5', 'iOS', 'iOS 13.3.1'
end

describe "Podcast%E2%80%99ler/1420.30 CFNetwork/1120 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("Podcast%E2%80%99ler/1420.30 CFNetwork/1120 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1420.30', 'Macintosh', 'macOS 10.15'
end

describe "%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%D0%B8/1430.33 CFNetwork/1121.4 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("%D0%9F%D0%BE%D0%B4%D0%BA%D0%B0%D1%81%D1%82%D0%B8/1430.33 CFNetwork/1121.4 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1430.33', 'Macintosh', 'macOS 10.15'
end

describe "%E6%92%AD%E5%AE%A2/1410.33 CFNetwork/1108 Darwin/19.0.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("%E6%92%AD%E5%AE%A2/1410.33 CFNetwork/1108 Darwin/19.0.0 (x86_64)") }

  it_behaves_like 'Apple Podcasts with details', '1410.33', 'Macintosh', 'macOS 10.15'
end

describe "Podcasts/0 CFNetwork/1156 Darwin/20.0.0" do
  let!(:useragent) { UserAgent.parse("Podcasts/0 CFNetwork/1156 Darwin/20.0.0") }

  it_behaves_like 'Apple Podcasts with details', '0', 'iOS', 'iOS 14.0.x'
end

describe "Podcasts/1.0.0.218659818 CFNetwork/974.2.1 Darwin/18.0.0" do
  let!(:useragent) { UserAgent.parse("Podcasts/1.0.0.218659818 CFNetwork/974.2.1 Darwin/18.0.0") }

  it_behaves_like 'Apple Podcasts with details', '1.0.0.218659818', 'iOS', 'iOS 12.0.x'
end

describe "Podcast/1 CFNetwork/901.1 Darwin/17.6.0" do
  let!(:useragent) { UserAgent.parse("Podcast/1 CFNetwork/901.1 Darwin/17.6.0") }

  it_behaves_like 'Apple Podcasts with details', '1', 'iOS', 'iOS 11.4'
end

describe "Podcast/22 CFNetwork/978.0.7 Darwin/18.6.0" do
  let!(:useragent) { UserAgent.parse("Podcast/22 CFNetwork/978.0.7 Darwin/18.6.0") }

  it_behaves_like 'Apple Podcasts with details', '22', 'iOS', 'iOS 12.3.x'
end

