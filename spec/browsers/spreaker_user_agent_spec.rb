# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'Spreaker' do |version, platform, os|
  it "returns 'Spreaker' as its browser" do
    expect(useragent.browser).to eq('Spreaker')
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

describe "UserAgent: Spreaker for Android 4.17.0 release:2021-05-05 device:phone (samsung SM-G965U; Android 10; en_US)" do
  let(:useragent) { UserAgent.parse("Spreaker for Android 4.17.0 release:2021-05-05 device:phone (samsung SM-G965U; Android 10; en_US)") }

  it_behaves_like 'Spreaker', '4.17.0', 'Android', 'Android 10'
end

describe "UserAgent: Spreaker Android" do
  let(:useragent) { UserAgent.parse("Spreaker Android") }

  it_behaves_like 'Spreaker', nil, 'Android', 'Android'
end

describe "UserAgent: Spreaker 7.26.1 rv:1337 (iPhone10,3; iOS 14.4.2; en_US)" do
  let(:useragent) { UserAgent.parse("Spreaker 7.26.1 rv:1337 (iPhone10,3; iOS 14.4.2; en_US)") }

  it_behaves_like 'Spreaker', '7.26.1', 'iPhone', 'iOS 14.4.2'
end

describe "UserAgent: Spreaker 6.8.0 rv:1168 (iPad2,4; iPhone OS 9.3.5; en_GB) SPKAudioPlayer" do
  let(:useragent) { UserAgent.parse("Spreaker 6.8.0 rv:1168 (iPad2,4; iPhone OS 9.3.5; en_GB) SPKAudioPlayer") }

  it_behaves_like 'Spreaker', '6.8.0', 'iPad', 'iOS 9.3.5'
end

describe "UserAgent: Spreaker 7.9.1 rv:1263 (iPod7,1; iOS 11.0.3; en_US) SPKAudioPlayer" do
  let(:useragent) { UserAgent.parse("Spreaker 7.9.1 rv:1263 (iPod7,1; iOS 11.0.3; en_US) SPKAudioPlayer") }

  it_behaves_like 'Spreaker', '7.9.1', 'iPod touch', 'iOS 11.0.3'
end

describe "UserAgent: Spreaker 7.9.1 rv:1263 (iPod7,1) SPKAudioPlayer" do
  let(:useragent) { UserAgent.parse("Spreaker 7.9.1 rv:1263 (iPod7,1) SPKAudioPlayer") }

  it_behaves_like 'Spreaker', '7.9.1', 'iPod touch', 'iOS'
end

describe "UserAgent: Spreaker File Downloader" do
  let(:useragent) { UserAgent.parse("Spreaker File Downloader") }

  it_behaves_like 'Spreaker', nil, nil, nil
end
