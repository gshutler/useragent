require 'user_agent'

shared_examples 'Android' do |browser, version, os|
  it "returns '#{browser}' as its browser" do
    expect(useragent.browser).to eq(browser)
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'Android' as its platform" do
    expect(useragent.platform).to eq('Android')
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end

  it { expect(useragent).to be_mobile }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: ExoPlayerWrapper/5.4.9 (Linux;Android 10) ExoPlayerLib/2.11.5" do
  let(:useragent) { UserAgent.parse("ExoPlayerWrapper/5.4.9 (Linux;Android 10) ExoPlayerLib/2.11.5") }

  it_behaves_like 'Android', 'ExoPlayerWrapper', '5.4.9', 'Android 10'
end

describe "UserAgent: Dalvik/2.1.0 (Linux; U; Android 11; SM-G991N Build/RP1A.200720.012)" do
  let(:useragent) { UserAgent.parse("Dalvik/2.1.0 (Linux; U; Android 11; SM-G991N Build/RP1A.200720.012)") }

  it_behaves_like 'Android', 'Dalvik', '2.1.0', 'Android 11'
end

describe "UserAgent: com.audible.playersdk.player/3.6.0 (Linux;Android 10) ExoPlayerLib/2.12.1" do
  let(:useragent) { UserAgent.parse("com.audible.playersdk.player/3.6.0 (Linux;Android 10) ExoPlayerLib/2.12.1") }

  it_behaves_like 'Android', 'com.audible.playersdk.player', '3.6.0', 'Android 10'
end

describe "UserAgent: de.danoeh.antennapod/1.8.1 (Linux;Android 10) ExoPlayerLib/2.10.8" do
  let(:useragent) { UserAgent.parse("de.danoeh.antennapod/1.8.1 (Linux;Android 10) ExoPlayerLib/2.10.8") }

  it_behaves_like 'Android', 'de.danoeh.antennapod', '1.8.1', 'Android 10'
end

describe "UserAgent: radio.de/app-5.4.2.5 (Linux;Android 7.0) ExoPlayerLib/2.13.3" do
  let(:useragent) { UserAgent.parse("radio.de/app-5.4.2.5 (Linux;Android 7.0) ExoPlayerLib/2.13.3") }

  it_behaves_like 'Android', 'radio.de', 'app-5.4.2.5', 'Android 7.0'
end
