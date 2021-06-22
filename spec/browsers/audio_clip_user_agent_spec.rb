require 'user_agent'

shared_examples_for 'AudioClip' do |version, platform, os|
  it "returns 'AudioClip' as its browser" do
    expect(useragent.browser).to eq('AudioClip')
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

describe "UserAgent: AudioClip/125 CFNetwork/1240.0.4 Darwin/20.5.0" do
  let(:useragent) { UserAgent.parse("AudioClip/125 CFNetwork/1240.0.4 Darwin/20.5.0") }

  it_should_behave_like 'AudioClip', '125', 'iOS', 'iOS 14.6'
end

describe "UserAgent: AudioClip/iOS/2.21.1 (iOS 14.6; iPhone)" do
  let(:useragent) { UserAgent.parse("AudioClip/iOS/2.21.1 (iOS 14.6; iPhone)") }

  it_should_behave_like 'AudioClip', '2.21.1', 'iPhone', 'iOS 14.6'
end

describe "UserAgent: AudioClip/iOS/2.20.0 (iOS 14.4.2; iPad)" do
  let(:useragent) { UserAgent.parse("AudioClip/iOS/2.20.0 (iOS 14.4.2; iPad)") }

  it_should_behave_like 'AudioClip', '2.20.0', 'iPad', 'iOS 14.4.2'
end

describe "UserAgent: AudioClip/iOS/2.15.1 (iOS 12.4.8; iPod touch)" do
  let(:useragent) { UserAgent.parse("AudioClip/iOS/2.15.1 (iOS 12.4.8; iPod touch)") }

  it_should_behave_like 'AudioClip', '2.15.1', 'iPod touch', 'iOS 12.4.8'
end
