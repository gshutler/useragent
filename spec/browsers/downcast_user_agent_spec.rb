# frozen_string_literal: true

require 'user_agent'

shared_examples_for 'Downcast' do |version, platform, os, type|
  it "returns 'Downcast' as its browser" do
    expect(useragent.browser).to eq('Downcast')
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

  if type == :mobile
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_desktop }
  else
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
  end

  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Downcast/2.10.3 (iPhone; iOS 14.6; Scale/3.00)" do
  let(:useragent) { UserAgent.parse("Downcast/2.10.3 (iPhone; iOS 14.6; Scale/3.00)") }

  it_behaves_like 'Downcast', '2.10.3', 'iPhone', 'iOS 14.6', :mobile
end

describe "UserAgent: Downcast/2.10.1 (iPod touch; iOS 13.6; Scale/2.00)" do
  let(:useragent) { UserAgent.parse("Downcast/2.10.1 (iPod touch; iOS 13.6; Scale/2.00)") }

  it_behaves_like 'Downcast', '2.10.1', 'iPod touch', 'iOS 13.6', :mobile
end

describe "UserAgent: Downcast/2.10.0 (iPad; iOS 14.5.1; Scale/2.00)" do
  let(:useragent) { UserAgent.parse("Downcast/2.10.0 (iPad; iOS 14.5.1; Scale/2.00)") }

  it_behaves_like 'Downcast', '2.10.0', 'iPad', 'iOS 14.5.1', :mobile
end

describe "UserAgent: Downcast/2.10.1 (Mac OS X Version 10.15.7 (Build 19H1030))" do
  let(:useragent) { UserAgent.parse("Downcast/2.10.1 (Mac OS X Version 10.15.7 (Build 19H1030))") }

  it_behaves_like 'Downcast', '2.10.1', 'Macintosh', 'macOS 10.15.7', :desktop
end

describe "UserAgent: Downcast/1224 CFNetwork/673.2.1 Darwin/13.1.0 (x86_64) (MacBookPro11%2C3)" do
  let(:useragent) { UserAgent.parse("Downcast/1224 CFNetwork/673.2.1 Darwin/13.1.0 (x86_64) (MacBookPro11%2C3)") }

  it_behaves_like 'Downcast', '1224', 'Macintosh', 'macOS 10.9.2', :desktop
end

describe "UserAgent: Downcast/7276 CFNetwork/1121.2.2 Darwin/19.3.0" do
  let(:useragent) { UserAgent.parse("Downcast/7276 CFNetwork/1121.2.2 Darwin/19.3.0") }

  it_behaves_like 'Downcast', '7276', 'iOS', 'iOS 13.3.1', :mobile
end
