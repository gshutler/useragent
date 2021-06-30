# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'SoundOn' do |version, platform, os|
  it "returns 'SoundOn' as its browser" do
    expect(useragent.browser).to eq('SoundOn')
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

describe "UserAgent: SoundOn/3.7.1 (Linux;Android)" do
  let(:useragent) { UserAgent.parse("SoundOn/3.7.1 (Linux;Android)") }

  it_should_behave_like 'SoundOn', '3.7.1', 'Android', 'Android'
end

describe "UserAgent: SoundOn/1.9.11 (Linux;Android 10) ExoPlayerLib/2.9.4" do
  let(:useragent) { UserAgent.parse("SoundOn/1.9.11 (Linux;Android 10) ExoPlayerLib/2.9.4") }

  it_should_behave_like 'SoundOn', '1.9.11', 'Android', 'Android 10'
end

describe "UserAgent: SoundOn/1.0 (com.amphiware.sound; build:1; iOS 12.3.1) Alamofire/4.8.2" do
  let(:useragent) { UserAgent.parse("SoundOn/1.0 (com.amphiware.sound; build:1; iOS 12.3.1) Alamofire/4.8.2") }

  it_should_behave_like 'SoundOn', '1.0', 'iOS', 'iOS 12.3.1'
end

describe "UserAgent: SoundOn/1.7.0 (com.soundon; build:3; iOS 12.4.2) Alamofire/4.8.2" do
  let(:useragent) { UserAgent.parse("SoundOn/1.7.0 (com.soundon; build:3; iOS 12.4.2) Alamofire/4.8.2") }

  it_should_behave_like 'SoundOn', '1.7.0', 'iOS', 'iOS 12.4.2'
end

describe "UserAgent: SoundOn/2.4.1 (iOS)" do
  let(:useragent) { UserAgent.parse("SoundOn/2.4.1 (iOS)") }

  it_should_behave_like 'SoundOn', '2.4.1', 'iOS', 'iOS'
end

describe "UserAgent: SoundOn/1 CFNetwork/1128.0.1 Darwin/19.6.0" do
  let(:useragent) { UserAgent.parse("SoundOn/1 CFNetwork/1128.0.1 Darwin/19.6.0") }

  it_should_behave_like 'SoundOn', '1', 'iOS', 'iOS 13.6.x'
end

describe "UserAgent: SoundOn/1.8.2" do
  let(:useragent) { UserAgent.parse("SoundOn/1.8.2") }

  it_should_behave_like 'SoundOn', '1.8.2', nil, nil
end
