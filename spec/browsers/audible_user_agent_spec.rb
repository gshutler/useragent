require 'user_agent'

shared_examples 'Audible' do |version, platform, os|
  it "returns 'Audible' as its browser" do
    expect(useragent.browser).to eq('Audible')
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
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: com.audible.playersdk.player/3.6.0 (Linux;Android 10) ExoPlayerLib/2.12.1" do
  let(:useragent) { UserAgent.parse("com.audible.playersdk.player/3.6.0 (Linux;Android 10) ExoPlayerLib/2.12.1") }

  it_behaves_like 'Audible', '3.6.0', 'Android', 'Android 10'
end

describe "UserAgent: Audible/666 CFNetwork/1220.1 Darwin/20.3.0" do
  let(:useragent) { UserAgent.parse("Audible/666 CFNetwork/1220.1 Darwin/20.3.0") }

  it_behaves_like 'Audible', '666', 'iOS', 'iOS 14.4.x'
end

describe "UserAgent: Audible, Android, 2.67.2, google, Pixel 3 XL, crosshatch, 11, 1.0, MOBILE" do
  let(:useragent) { UserAgent.parse("Audible, Android, 2.67.2, google, Pixel 3 XL, crosshatch, 11, 1.0, MOBILE") }

  it_behaves_like 'Audible', '2.67.2', 'Android', nil
end
