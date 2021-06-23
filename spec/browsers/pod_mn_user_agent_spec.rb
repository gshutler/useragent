require 'user_agent'

shared_examples_for 'PodMN' do |version, platform, os|
  it "returns 'PodMN' as its browser" do
    expect(useragent.browser).to eq('PodMN')
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

describe "UserAgent: PodMN/Android 1.3.1 (Android 11; SM-G970U Build/RP1A.200720.012)" do
  let(:useragent) { UserAgent.parse("PodMN/Android 1.3.1 (Android 11; SM-G970U Build/RP1A.200720.012)") }

  it_should_behave_like 'PodMN', '1.3.1', 'Android', 'Android 11'
end

describe "UserAgent: PodMN/1.2.0 (Linux;Android 9) ExoPlayerLib/2.9.6" do
  let(:useragent) { UserAgent.parse("PodMN/1.2.0 (Linux;Android 9) ExoPlayerLib/2.9.6") }

  it_should_behave_like 'PodMN', '1.2.0', 'Android', 'Android 9'
end

describe "UserAgent: PodMN/iOS 1.1.8 (iPhone 8/14.6)" do
  let(:useragent) { UserAgent.parse("PodMN/iOS 1.1.8 (iPhone 8/14.6)") }

  it_should_behave_like 'PodMN', '1.1.8', 'iPhone', 'iOS 14.6'
end

describe 'UserAgent: PodMN/iOS 1.1.8 (iPad Pro 9.7"/14.4.2)' do
  let(:useragent) { UserAgent.parse('PodMN/iOS 1.1.8 (iPad Pro 9.7"/14.4.2)') }

  it_should_behave_like 'PodMN', '1.1.8', 'iPad', 'iOS 14.4.2'
end

describe "UserAgent: PodMN/1 CFNetwork/1121.2.2 Darwin/19.3.0" do
  let(:useragent) { UserAgent.parse("PodMN/1 CFNetwork/1121.2.2 Darwin/19.3.0") }

  it_should_behave_like 'PodMN', '1', 'iOS', 'iOS 13.3.1'
end
