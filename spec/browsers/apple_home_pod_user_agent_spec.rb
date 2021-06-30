# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'HomePod' do |version, os|
  it "returns 'HomePod' as its browser" do
    expect(useragent.browser).to eq('HomePod')
  end

  it "returns '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "returns 'HomePod' as its platform" do
    expect(useragent.platform).to eq('HomePod')
  end

  it "returns '#{os}' as its operating system" do
    expect(useragent.os).to eq(os)
  end

  it { expect(useragent).to be_speaker }
  it { expect(useragent).not_to be_desktop }
  it { expect(useragent).not_to be_mobile }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: AppleCoreMedia/1.0.0.16A5288c (HomePod; U; CPU OS 12_0 like Mac OS X; en_us)" do
  let!(:useragent) { UserAgent.parse("AppleCoreMedia/1.0.0.16A5288c (HomePod; U; CPU OS 12_0 like Mac OS X; en_us)") }

  it_should_behave_like 'HomePod', '1.0.0.16A5288c', 'iOS 12.0'
end

describe "UserAgent: AppleCoreMedia/1.0.0.18L203 (HomePod; U; CPU OS 14_5 like Mac OS X; fr_fr)" do
  let!(:useragent) { UserAgent.parse("AppleCoreMedia/1.0.0.18L203 (HomePod; U; CPU OS 14_5 like Mac OS X; fr_fr)") }

  it_should_behave_like 'HomePod', '1.0.0.18L203', 'HomePod Software 14.5'
end
