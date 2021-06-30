# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'Breaker' do |version, platform, os|
  it "returns 'Breaker' as its browser" do
    expect(useragent.browser).to eq('Breaker')
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

describe "UserAgent: Breaker/Android/1.0.0.RC-GP-Free(72) (72)" do
  let(:useragent) { UserAgent.parse("Breaker/Android/1.0.0.RC-GP-Free(72) (72)") }

  it_should_behave_like 'Breaker', '1.0.0.RC-GP-Free(72)', 'Android', 'Android'
end

describe "UserAgent: Breaker/Android (https://breaker.audio)" do
  let(:useragent) { UserAgent.parse("Breaker/Android (https://breaker.audio)") }

  it_should_behave_like 'Breaker', nil, 'Android', 'Android'
end

describe "UserAgent: Breaker/0.8.0 (1059)" do
  let(:useragent) { UserAgent.parse("Breaker/0.8.0 (1059)") }

  it_should_behave_like 'Breaker', '0.8.0', nil, nil
end

describe "UserAgent: Breaker/iOS (https://breaker.audio)" do
  let(:useragent) { UserAgent.parse("Breaker/iOS (https://breaker.audio)") }

  it_should_behave_like 'Breaker', nil, 'iOS', 'iOS'
end

describe "UserAgent: Breaker/515 CFNetwork/893.10 Darwin/17.3.0" do
  let(:useragent) { UserAgent.parse("Breaker/515 CFNetwork/893.10 Darwin/17.3.0") }

  it_should_behave_like 'Breaker', '515', 'iOS', 'iOS 11.2'
end

describe "UserAgent: Breaker/0.2.8 (com.Breaker.Breaker; build:0.2.8; iOS 9.3.2) Alamofire/4.0.0" do
  let(:useragent) { UserAgent.parse("Breaker/0.2.8 (com.Breaker.Breaker; build:0.2.8; iOS 9.3.2) Alamofire/4.0.0") }

  it_should_behave_like 'Breaker', '0.2.8', 'iOS', 'iOS 9.3.2'
end

describe "UserAgent: Breaker/com.Breaker.Breaker (0.2.2; iOS 9.3.2)" do
  let(:useragent) { UserAgent.parse("Breaker/com.Breaker.Breaker (0.2.2; iOS 9.3.2)") }

  it_should_behave_like 'Breaker', nil, 'iOS', 'iOS 9.3.2'
end

describe "UserAgent: Breaker/iOS/0.8.1 (1076)" do
  let(:useragent) { UserAgent.parse("Breaker/iOS/0.8.1 (1076)") }

  it_should_behave_like 'Breaker', '0.8.1', 'iOS', 'iOS'
end
