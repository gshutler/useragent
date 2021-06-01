require 'user_agent'

shared_examples 'Acast' do |version, platform, os|
  it "returns 'Acast' as its browser" do
    expect(useragent.browser).to eq('Acast')
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

describe "UserAgent: Acast/1.63.0 (Phone; iOS 11.2.6; iPad6,11)" do
  let!(:useragent) { UserAgent.parse("Acast/1.63.0 (Phone; iOS 11.2.6; iPad6,11)") }

  it_behaves_like 'Acast', '1.63.0', 'iPad', 'iOS 11.2.6'
end

describe "UserAgent: Acast/1.63.0 (Phone; iOS 11.2.5; iPhone9,4)" do
  let!(:useragent) { UserAgent.parse("Acast/1.63.0 (Phone; iOS 11.2.5; iPhone9,4)") }

  it_behaves_like 'Acast', '1.63.0', 'iPhone', 'iOS 11.2.5'
end

describe "UserAgent: Acast/1.42.1 (phone; android 10; Google Pixel 3 XL)" do
  let!(:useragent) { UserAgent.parse("Acast/1.42.1 (phone; android 10; Google Pixel 3 XL)") }

  it_behaves_like 'Acast', '1.42.1', 'Android', 'Android 10'
end

describe "UserAgent: Acast/1.26.0 (Linux;Android 9) ExoPlayerLib/2.2.0" do
  let!(:useragent) { UserAgent.parse("Acast/1.26.0 (Linux;Android 9) ExoPlayerLib/2.2.0") }

  it_behaves_like 'Acast', '1.26.0', 'Android', 'Android 9'
end
