# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'iCatcher!' do |version, platform, os|
  it "returns 'iCatcher!' as its browser" do
    expect(useragent.browser).to eq('iCatcher!')
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

describe "UserAgent: iCatcher!/6.7.5 (iPhone; iOS 14.5.1; Scale/2.0)" do
  let(:useragent) { UserAgent.parse("iCatcher!/6.7.5 (iPhone; iOS 14.5.1; Scale/2.0)") }

  it_behaves_like 'iCatcher!', '6.7.5', 'iPhone', 'iOS 14.5.1'
end

describe "UserAgent: iCatcher!/3.0.7 (iPad; iOS 11.0; Scale/2.0)" do
  let(:useragent) { UserAgent.parse("iCatcher!/3.0.7 (iPad; iOS 11.0; Scale/2.0)") }

  it_behaves_like 'iCatcher!', '3.0.7', 'iPad', 'iOS 11.0'
end

describe "UserAgent: iCatcher!/3.5.1 (iPod touch; iOS 11.3; Scale/2.0)" do
  let(:useragent) { UserAgent.parse("iCatcher!/3.5.1 (iPod touch; iOS 11.3; Scale/2.0)") }

  it_behaves_like 'iCatcher!', '3.5.1', 'iPod touch', 'iOS 11.3'
end

describe "UserAgent: iCatcher! 1.8.4 (iPhone; iPhone OS 4.2.1; en_US)" do
  let(:useragent) { UserAgent.parse("iCatcher! 1.8.4 (iPhone; iPhone OS 4.2.1; en_US)") }

  it_behaves_like 'iCatcher!', '1.8.4', 'iPhone', 'iOS 4.2.1'
end

describe "UserAgent: iCatcher! 1.9.8.5 (iPod touch; iPhone OS 6.1.2; en_US)" do
  let(:useragent) { UserAgent.parse("iCatcher! 1.9.8.5 (iPod touch; iPhone OS 6.1.2; en_US)") }

  it_behaves_like 'iCatcher!', '1.9.8.5', 'iPod touch', 'iOS 6.1.2'
end

describe "UserAgent: icatcher/1.10 CFNetwork/758.5.3 Darwin/15.6.0" do
  let(:useragent) { UserAgent.parse("icatcher/1.10 CFNetwork/758.5.3 Darwin/15.6.0") }

  it_behaves_like 'iCatcher!', '1.10', 'iOS', 'iOS 9.3.3'
end

describe "UserAgent: iCatcher! podcast app/2.2.5" do
  let(:useragent) { UserAgent.parse("iCatcher! podcast app/2.2.5") }

  it_behaves_like 'iCatcher!', '2.2.5', 'iOS', nil
end

describe "UserAgent: iCatcher! Podcast Player/2.7.3" do
  let(:useragent) { UserAgent.parse("iCatcher! Podcast Player/2.7.3") }

  it_behaves_like 'iCatcher!', '2.7.3', 'iOS', nil
end
