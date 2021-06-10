require 'user_agent'

shared_examples 'Wondery' do |version, platform, os|
  it "returns 'Wondery' as its browser" do
    expect(useragent.browser).to eq('Wondery')
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

describe "UserAgent: wondery/android/v1.8.2/2314" do
  let(:useragent) { UserAgent.parse("wondery/android/v1.8.2/2314") }

  it_behaves_like 'Wondery', '1.8.2', 'Android', nil
end

describe "UserAgent: Wondery/1660 CFNetwork/1183 Darwin/20.0.0" do
  let(:useragent) { UserAgent.parse("Wondery/1660 CFNetwork/1183 Darwin/20.0.0") }

  it_behaves_like 'Wondery', '1660', 'iOS', 'iOS 14.0.x'
end

describe "UserAgent: wondery/ios/v1.8.2/48" do
  let(:useragent) { UserAgent.parse("wondery/ios/v1.8.2/48") }

  it_behaves_like 'Wondery', '1.8.2', 'iOS', nil
end

describe "UserAgent: wondery/ios/v1.4.2/1 ,AppleCoreMedia/1.0.0.17G64 (iPhone; U; CPU OS 13_6 like Mac OS X; en_us)" do
  let(:useragent) { UserAgent.parse("wondery/ios/v1.4.2/1 ,AppleCoreMedia/1.0.0.17G64 (iPhone; U; CPU OS 13_6 like Mac OS X; en_us)") }

  it_behaves_like 'Wondery', '1.4.2', 'iPhone', 'iOS 13.6'
end
