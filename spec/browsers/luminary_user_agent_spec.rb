require 'user_agent'

shared_examples_for 'Luminary' do |version, platform, os|
  it "returns 'Luminary' as its browser" do
    expect(useragent.browser).to eq('Luminary')
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

describe "UserAgent: Luminary/33.0 (Android 9; SM-G950F; samsung dreamlte; en)" do
  let(:useragent) { UserAgent.parse("Luminary/33.0 (Android 9; SM-G950F; samsung dreamlte; en)") }

  it_should_behave_like 'Luminary', '33.0', 'Android', 'Android 9'
end

describe "UserAgent: Luminary/1.0.10 build 1377/Android SDK 28" do
  let(:useragent) { UserAgent.parse("Luminary/1.0.10 build 1377/Android SDK 28") }

  it_should_behave_like 'Luminary', '1.0.10', 'Android', 'Android 9'
end

describe "UserAgent: Luminary/39.0 build 252/iOS 14.6" do
  let(:useragent) { UserAgent.parse("Luminary/39.0 build 252/iOS 14.6") }

  it_should_behave_like 'Luminary', '39.0', 'iOS', 'iOS 14.6'
end

describe "UserAgent: Luminary/252 CFNetwork/1240.0.4 Darwin/20.5.0" do
  let(:useragent) { UserAgent.parse("Luminary/252 CFNetwork/1240.0.4 Darwin/20.5.0") }

  it_should_behave_like 'Luminary', '252', 'iOS', 'iOS 14.6'
end

describe "UserAgent: Luminary/0.0.243 build 3319" do
  let(:useragent) { UserAgent.parse("Luminary/0.0.243 build 3319") }

  it_should_behave_like 'Luminary', '0.0.243', nil, nil
end
