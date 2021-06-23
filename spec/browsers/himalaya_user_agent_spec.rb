require 'user_agent'

shared_examples_for 'Himalaya' do |version, platform, os|
  it "returns 'Himalaya' as its browser" do
    expect(useragent.browser).to eq('Himalaya')
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

describe "UserAgent: Himalaya/2.4.82 Android/29 (EVR-L29)" do
  let(:useragent) { UserAgent.parse("Himalaya/2.4.82 Android/29 (EVR-L29)") }

  it_should_behave_like 'Himalaya', '2.4.82', 'Android', 'Android 10'
end

describe "UserAgent: Mozilla/5.0 (Linux; Android 10; SM-A115M Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/90.0.4430.82 Mobile Safari/537.36 Himalaya/2.4.70" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 10; SM-A115M Build/QP1A.190711.020; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/90.0.4430.82 Mobile Safari/537.36 Himalaya/2.4.70") }

  it_should_behave_like 'Himalaya', '2.4.70', 'Android', 'Android 10'
end

describe "UserAgent: Himalaya/1 CFNetwork/1236 Darwin/20.4.0" do
  let(:useragent) { UserAgent.parse("Himalaya/1 CFNetwork/1236 Darwin/20.4.0") }

  it_should_behave_like 'Himalaya', '1', 'iOS', 'iOS 14.5'
end

describe "UserAgent: Himalaya/2.4.80 (iPhone; iOS 14.4.2; Scale/2.00; CFNetwork; iPhone10,1)" do
  let(:useragent) { UserAgent.parse("Himalaya/2.4.80 (iPhone; iOS 14.4.2; Scale/2.00; CFNetwork; iPhone10,1)") }

  it_should_behave_like 'Himalaya', '2.4.80', 'iPhone', 'iOS 14.4.2'
end

describe "UserAgent: Himalaya/2.2.10 (iPad; iOS 12.0.1; Scale/2.00; CFNetwork; iPad6,11)" do
  let(:useragent) { UserAgent.parse("Himalaya/2.2.10 (iPad; iOS 12.0.1; Scale/2.00; CFNetwork; iPad6,11)") }

  it_should_behave_like 'Himalaya', '2.2.10', 'iPad', 'iOS 12.0.1'
end

describe "UserAgent: Himalaya/2.2.15 (iPod touch; iOS 11.4; Scale/2.00; CFNetwork; iPod7,1)" do
  let(:useragent) { UserAgent.parse("Himalaya/2.2.15 (iPod touch; iOS 11.4; Scale/2.00; CFNetwork; iPod7,1)") }

  it_should_behave_like 'Himalaya', '2.2.15', 'iPod touch', 'iOS 11.4'
end
