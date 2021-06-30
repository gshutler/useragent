# frozen_string_literal: true

require 'user_agent'

shared_examples 'Stitcher' do |version, platform, os, type|
  it "returns 'Stitcher' as its browser" do
    expect(useragent.browser).to eq('Stitcher')
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
  elsif type == :desktop
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
  end

  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "UserAgent: Stitcher/iOS BMID/E675DDB007" do
  let!(:useragent) { UserAgent.parse("Stitcher/iOS BMID/E675DDB007") }

  it_behaves_like 'Stitcher', nil, 'iOS', nil, :mobile
end

describe "UserAgent: Stitcher/Android BMID/E675CE27E9" do
  let!(:useragent) { UserAgent.parse("Stitcher/Android BMID/E675CE27E9") }

  it_behaves_like 'Stitcher', nil, 'Android', nil, :mobile
end

describe "UserAgent: Stitcher/17434 CFNetwork/609.1.4 Darwin/13.0.0" do
  let!(:useragent) { UserAgent.parse("Stitcher/17434 CFNetwork/609.1.4 Darwin/13.0.0") }

  it_behaves_like 'Stitcher', '17434', 'iOS', 'iOS 6.0.x', :mobile
end

describe "UserAgent: StitcherX/109 CFNetwork/1128.0.1 Darwin/19.6.0" do
  let!(:useragent) { UserAgent.parse("StitcherX/109 CFNetwork/1128.0.1 Darwin/19.6.0") }

  it_behaves_like 'Stitcher', '109', 'iOS', 'iOS 13.6.x', :mobile
end

describe "UserAgent: stitcherx/52 CFNetwork/1121.2.1 Darwin/19.3.0" do
  let!(:useragent) { UserAgent.parse("stitcherx/52 CFNetwork/1121.2.1 Darwin/19.3.0") }

  it_behaves_like 'Stitcher', '52', 'iOS', 'iOS 13.3.1', :mobile
end

describe "UserAgent: Stitcher Demo/4.8.0 (Linux;Android 11) ExoPlayerLib/2.10.7" do
  let!(:useragent) { UserAgent.parse("Stitcher Demo/4.8.0 (Linux;Android 11) ExoPlayerLib/2.10.7") }

  it_behaves_like 'Stitcher', '4.8.0', 'Android', 'Android 11', :mobile
end

describe "UserAgent: Stitcher X/1.2 (Linux;Android 9) ExoPlayerLib/2.10.7" do
  let!(:useragent) { UserAgent.parse("Stitcher X/1.2 (Linux;Android 9) ExoPlayerLib/2.10.7") }

  it_behaves_like 'Stitcher', '1.2', 'Android', 'Android 9', :mobile
end

describe "UserAgent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) StitcherRadio/1.1.5 Chrome/58.0.3029.110 Molecule/1.1.5 Safari/537.36" do
  let!(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) StitcherRadio/1.1.5 Chrome/58.0.3029.110 Molecule/1.1.5 Safari/537.36") }

  it_behaves_like 'Stitcher', '1.1.5', 'Macintosh', 'OS X 10.13.4', :desktop
end

describe "UserAgent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 10.0; Trident/4.0) Stitcher/iOS" do
  let!(:useragent) { UserAgent.parse("Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 10.0; Trident/4.0) Stitcher/iOS") }

  it_behaves_like 'Stitcher', nil, 'iOS', nil, :mobile
end

describe "UserAgent: Stitcher/iOS,Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/6.0; .NET4.0E; .NET4.0C; InfoPath.2)" do
  let!(:useragent) { UserAgent.parse("Stitcher/iOS,Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/6.0; .NET4.0E; .NET4.0C; InfoPath.2)") }

  it_behaves_like 'Stitcher', nil, 'iOS', nil, :mobile
end

describe "UserAgent: StitcherTV/1 CFNetwork/1121.1.2 Darwin/19.2.0 (x86_64)" do
  let!(:useragent) { UserAgent.parse("StitcherTV/1 CFNetwork/1121.1.2 Darwin/19.2.0 (x86_64)") }

  it_behaves_like 'Stitcher', '1', 'Macintosh', 'macOS 10.15.2', :desktop
end
