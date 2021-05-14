require 'user_agent'

shared_examples 'Spotify' do |version, platform, os, type|
  it "returns 'Spotify' as its browser" do
    expect(useragent.browser).to eq('Spotify')
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

  if type == :mobile
    it { expect(useragent).to be_mobile }
  elsif type == :desktop
    it { expect(useragent).to be_desktop }
  end
end

describe "UserAgent: Spotify/0.1.118.48 Android/29 (Pixel 4 XL)" do
  let!(:useragent) { UserAgent.parse("Spotify/0.1.118.48 Android/29 (Pixel 4 XL)") }

  it_behaves_like 'Spotify', '0.1.118.48', 'Android', 'Android 10', :mobile
end

describe "UserAgent: Spotify/1.10.0 iOS/12.3.1 (Stations iPhone11,2)" do
  let!(:useragent) { UserAgent.parse("Spotify/1.10.0 iOS/12.3.1 (Stations iPhone11,2)") }

  it_behaves_like 'Spotify', '1.10.0', 'iPhone', 'iOS 12.3.1', :mobile
end

describe "UserAgent: Spotify/8.4.62 iOS/12.5.1 (iPod7,1)" do
  let!(:useragent) { UserAgent.parse("Spotify/8.4.62 iOS/12.5.1 (iPod7,1)") }

  it_behaves_like 'Spotify', '8.4.62', 'iPod touch', 'iOS 12.5.1', :mobile
end

describe "UserAgent: Spotify/8.4.75 iOS/14.3 (iPad7,11)" do
  let!(:useragent) { UserAgent.parse("Spotify/8.4.75 iOS/14.3 (iPad7,11)") }

  it_behaves_like 'Spotify', '8.4.75', 'iPad', 'iOS 14.3', :mobile
end

describe "UserAgent: Spotify/107700336 OSX/0 (MacBookAir7,2)" do
  let!(:useragent) { UserAgent.parse("Spotify/107700336 OSX/0 (MacBookAir7,2)") }

  it_behaves_like 'Spotify', '107700336', 'Macintosh', nil, :desktop
end

describe "UserAgent: Spotify/107700338 Linux/0 (PC desktop)" do
  let!(:useragent) { UserAgent.parse("Spotify/107700338 Linux/0 (PC desktop)") }

  it_behaves_like 'Spotify', '107700338', 'Linux', nil, :desktop
end

describe "UserAgent: Spotify/107700338 Win32/0 (PC laptop)" do
  let!(:useragent) { UserAgent.parse("Spotify/107700338 Win32/0 (PC laptop)") }

  it_behaves_like 'Spotify', '107700338', 'Windows', nil, :desktop
end

describe "UserAgent: Spotify-Lite/0.13.30.53 Android/28 (SM-A750GN)" do
  let!(:useragent) { UserAgent.parse("Spotify-Lite/0.13.30.53 Android/28 (SM-A750GN)") }

  it_behaves_like 'Spotify', '0.13.30.53', 'Android', 'Android 9', :mobile
end

describe "UserAgent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.45.621 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.45.621 Safari/537.36") }

  it_behaves_like 'Spotify', '1.1.45.621', 'Macintosh', 'OS X 10.11.0', :desktop
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.31.703 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.31.703 Safari/537.36") }

  it_behaves_like 'Spotify', '1.1.31.703', 'Windows', 'Windows 10', :desktop
end

describe "UserAgent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.10.546 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Spotify/1.1.10.546 Safari/537.36") }

  it_behaves_like 'Spotify', '1.1.10.546', 'X11', 'Linux x86_64', :desktop
end

describe "UserAgent: Spotify/1.0" do
  let!(:useragent) { UserAgent.parse("Spotify/1.0") }

  it_behaves_like 'Spotify', '1.0', nil, nil, nil
end
