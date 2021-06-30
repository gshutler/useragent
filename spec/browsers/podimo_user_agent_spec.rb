# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'Podimo' do |version, platform, os|
  it "returns 'Podimo' as its browser" do
    expect(useragent.browser).to eq('Podimo')
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

describe "UserAgent: Podimo/1.39.4 build 290/Android 30" do
  let(:useragent) { UserAgent.parse("Podimo/1.39.4 build 290/Android 30") }

  it_should_behave_like 'Podimo', '1.39.4', 'Android', 'Android 11'
end

describe "UserAgent: Podimo/1.39.4 build 316/iOS 14.6" do
  let(:useragent) { UserAgent.parse("Podimo/1.39.4 build 316/iOS 14.6") }

  it_should_behave_like 'Podimo', '1.39.4', 'iOS', 'iOS 14.6'
end

describe "UserAgent: Podimo/49 CFNetwork/978.0.7 Darwin/18.7.0" do
  let(:useragent) { UserAgent.parse("Podimo/49 CFNetwork/978.0.7 Darwin/18.7.0") }

  it_should_behave_like 'Podimo', '49', 'iOS', 'iOS 12.4.x'
end
