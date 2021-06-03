require 'user_agent'

shared_examples_for 'Pandora' do |version, platform, os, type|
  it "should return 'Pandora' as its browser" do
    expect(useragent.browser).to eq('Pandora')
  end

  it "should return '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "should return '#{platform}' as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "should return '#{os}' as its os" do
    expect(useragent.os).to eq(os)
  end

  if type == :mobile
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_desktop }
  elsif type == :desktop
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
  end

  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "Mozilla/5.0 (iPad; CPU OS 10_3_4 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G61 Pandora/1812.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPad; CPU OS 10_3_4 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G61 Pandora/1812.1") }

  it_should_behave_like 'Pandora', '1812.1', 'iPad', 'iOS 10.3.4', :mobile
end

describe "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Pandora/1901.1.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Pandora/1901.1.1") }

  it_should_behave_like 'Pandora', '1901.1.1', 'iPhone', 'iOS 10.3.2', :mobile
end

describe "Mozilla/5.0 (iPod touch; CPU iPhone OS 11_2_5 like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) Mobile/15D60 Pandora/1908.1" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (iPod touch; CPU iPhone OS 11_2_5 like Mac OS X) AppleWebKit/604.5.6 (KHTML, like Gecko) Mobile/15D60 Pandora/1908.1") }

  it_should_behave_like 'Pandora', '1908.1', 'iPod touch', 'iOS 11.2.5', :mobile
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.3" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.3") }

  it_should_behave_like 'Pandora', '15.0.3', 'Macintosh', 'OS X 10.10.5', :desktop
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.2" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Electron/4.2.10 Safari/537.36 PandoraApp/15.0.2") }

  it_should_behave_like 'Pandora', '15.0.2', 'Windows', 'Windows 10', :desktop
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) -0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36 PandoraDesktopApp/1.8.4" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) -0 Chrome/69.0.3497.128 Electron/4.1.4 Safari/537.36 PandoraDesktopApp/1.8.4") }

  it_should_behave_like 'Pandora', '1.8.4', 'Macintosh', 'OS X 10.10.5', :desktop
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.106 Electron/4.0.6 Safari/537.36 PandoraDesktopApp/1.8.2" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.106 Electron/4.0.6 Safari/537.36 PandoraDesktopApp/1.8.2") }

  it_should_behave_like 'Pandora', '1.8.2', 'Windows', 'Windows 10', :desktop
end

describe "Pandora Audio/2102.1 (Linux;Android 9.1) ExoPlayerLib/2.9.6" do
  let!(:useragent) { UserAgent.parse("Pandora Audio/2102.1 (Linux;Android 9.1) ExoPlayerLib/2.9.6") }

  it_should_behave_like 'Pandora', '2102.1', 'Android', 'Android 9.1', :mobile
end

describe "Pandora/1811.1 Android/7.1.1 kelly (ExoPlayerLib1.5.14.1)" do
  let!(:useragent) { UserAgent.parse("Pandora/1811.1 Android/7.1.1 kelly (ExoPlayerLib1.5.14.1)") }

  it_should_behave_like 'Pandora', '1811.1', 'Android', 'Android 7.1.1', :mobile
end

describe "Pandora/2107 CFNetwork/1125.2 Darwin/19.4.0" do
  let!(:useragent) { UserAgent.parse("Pandora/2107 CFNetwork/1125.2 Darwin/19.4.0") }

  it_should_behave_like 'Pandora', '2107', 'iOS', 'iOS 13.4.x', :mobile
end
