require 'user_agent'

shared_examples_for 'Podverse' do |version, platform, os|
  it "returns 'Podverse' as its browser" do
    expect(useragent.browser).to eq('Podverse')
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

describe "UserAgent: Podverse/F-Droid Android Mobile App/" do
  let(:useragent) { UserAgent.parse("Podverse/F-Droid Android Mobile App/") }

  it_should_behave_like 'Podverse', nil, 'Android', nil
end

describe "UserAgent: Podverse/Android Mobile App/Mozilla/5.0 (Linux; Android 10; LYA-L29 Build/HUAWEILYA-L29; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/90.0.4430.91 Mobile Safari/537.36" do
  let(:useragent) { UserAgent.parse("Podverse/Android Mobile App/Mozilla/5.0 (Linux; Android 10; LYA-L29 Build/HUAWEILYA-L29; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/90.0.4430.91 Mobile Safari/537.36") }

  it_should_behave_like 'Podverse', nil, 'Android', 'Android 10'
end

describe "UserAgent: Podverse/7 CFNetwork/902.2 Darwin/17.7.0" do
  let(:useragent) { UserAgent.parse("Podverse/7 CFNetwork/902.2 Darwin/17.7.0") }

  it_should_behave_like 'Podverse', '7', 'iOS', 'iOS 11.4.1'
end

describe "UserAgent: Podverse/iOS Mobile App/Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89" do
  let(:useragent) { UserAgent.parse("Podverse/iOS Mobile App/Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89") }

  it_should_behave_like 'Podverse', nil, 'iPhone', 'iOS 10.3.2'
end

describe "UserAgent: Podverse/iOS Mobile App/Mozilla/5.0 (iPad; CPU OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148" do
  let(:useragent) { UserAgent.parse("Podverse/iOS Mobile App/Mozilla/5.0 (iPad; CPU OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148") }

  it_should_behave_like 'Podverse', nil, 'iPad', 'iOS 14.2'
end

describe "UserAgent: Podverse/Feed Parser" do
  let(:useragent) { UserAgent.parse("Podverse/Feed Parser") }

  it_should_behave_like 'Podverse', nil, nil, nil
end
