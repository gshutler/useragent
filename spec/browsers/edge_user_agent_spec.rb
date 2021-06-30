# frozen_string_literal: true

require 'user_agent'

shared_examples 'Edge browser' do |version, platform, os, type|
  it "should return 'Edge' as its browser" do
    expect(useragent.browser).to eq('Edge')
  end

  it "should return '#{version}' as its version" do
    expect(useragent.version).to eq(version)
  end

  it "should return '#{platform}' as its platform" do
    expect(useragent.platform).to eq(platform)
  end

  it "should return '#{os}' as its os" do
    expect(useragent.os).to eq(os)
  end

  if type == :desktop
    it { expect(useragent).to be_desktop }
    it { expect(useragent).not_to be_mobile }
  elsif type == :mobile
    it { expect(useragent).to be_mobile }
    it { expect(useragent).not_to be_desktop }
  end

  it { expect(useragent).not_to be_speaker }
  it { expect(useragent).not_to be_bot }
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240") }

  it_behaves_like 'Edge browser', '12.10240', 'Windows', 'Windows 10', :desktop
end

describe "Mozilla/5.0 SHC; SHC-Unit-04973; SHC-HTS; SHC-KIOSK; SHC-MAC-0000 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 SHC; SHC-Unit-04973; SHC-HTS; SHC-KIOSK; SHC-MAC-0000 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586") }

  it_behaves_like 'Edge browser', '13.10586', 'Windows', 'Windows 10', :desktop
end

describe "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.48 Safari/537.36 Edg/74.1.96.24") }

  it_behaves_like 'Edge browser', '74.1.96.24', 'Windows', 'Windows 10', :desktop
end

describe "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36 Edg/88.0.705.56" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.96 Safari/537.36 Edg/88.0.705.56") }

  it_behaves_like 'Edge browser', '88.0.705.56', 'Macintosh', 'OS X 10.15.7', :desktop
end

describe "Mozilla/5.0 (Linux; Android 10; Pixel 3 XL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.141 Mobile Safari/537.36 EdgA/45.12.4.5125" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Linux; Android 10; Pixel 3 XL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.141 Mobile Safari/537.36 EdgA/45.12.4.5125") }

  it_behaves_like 'Edge browser', '45.12.4.5125', 'Android', 'Android 10', :mobile
end

describe "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Safari/603.2.4 EdgiOS/41.1.35.1" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Mobile/14F89 Safari/603.2.4 EdgiOS/41.1.35.1") }

  it_behaves_like 'Edge browser', '41.1.35.1', 'iPhone', 'iOS 10.3.2', :mobile
end
