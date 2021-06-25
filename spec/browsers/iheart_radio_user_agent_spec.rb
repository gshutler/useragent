# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'iHeartRadio' do |version, platform, os|
  it "returns 'iHeartRadio' as its browser" do
    expect(useragent.browser).to eq('iHeartRadio')
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

describe "UserAgent: iHeartRadio/1 CFNetwork/1098.6 Darwin/19.0.0" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/1 CFNetwork/1098.6 Darwin/19.0.0") }

  it_should_behave_like 'iHeartRadio', '1', 'iOS', 'iOS 13.0'
end

describe "UserAgent: iHeartRadio/2020040104 CFNetwork/1121.2.2 Darwin/19.3.0" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/2020040104 CFNetwork/1121.2.2 Darwin/19.3.0") }

  it_should_behave_like 'iHeartRadio', '2020040104', 'iOS', 'iOS 13.3.1'
end

describe "UserAgent: iHeartRadio/10.2.1 (iPhone; iOS 13.4; iPhone9,3)" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/10.2.1 (iPhone; iOS 13.4; iPhone9,3)") }

  it_should_behave_like 'iHeartRadio', '10.2.1', 'iPhone', 'iOS 13.4'
end

describe "UserAgent: iHeartRadio/10.1.1 (iPad; iOS 14.2; iPad7,11)" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/10.1.1 (iPad; iOS 14.2; iPad7,11)") }

  it_should_behave_like 'iHeartRadio', '10.1.1', 'iPad', 'iOS 14.2'
end

describe "UserAgent: iHeartRadio/10.1.1 (iPod touch; iOS 13.3.1; iPod9,1)" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/10.1.1 (iPod touch; iOS 13.3.1; iPod9,1)") }

  it_should_behave_like 'iHeartRadio', '10.1.1', 'iPod touch', 'iOS 13.3.1'
end

describe "UserAgent: iHeartRadio/1.12.1 (Android Sdk 23)" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/1.12.1 (Android Sdk 23)") }

  it_should_behave_like 'iHeartRadio', '1.12.1', 'Android', 'Android 6.0'
end

describe "UserAgent: iHeartRadio/1.0.0 (Android 10; SM-A505FN Build/QP1A.190711.020)" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/1.0.0 (Android 10; SM-A505FN Build/QP1A.190711.020)") }

  it_should_behave_like 'iHeartRadio', '1.0.0', 'Android', 'Android 10'
end

describe "UserAgent: iHeartRadio/10.2.0 (Android 6.0.1; Nexus 7 Build/MMB30S)" do
  let!(:useragent) { UserAgent.parse("iHeartRadio/10.2.0 (Android 6.0.1; Nexus 7 Build/MMB30S)") }

  it_should_behave_like 'iHeartRadio', '10.2.0', 'Android', 'Android 6.0.1'
end
