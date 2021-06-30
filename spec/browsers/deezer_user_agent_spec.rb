# frozen_string_literal: true

require 'user_agent'

shared_examples 'Deezer' do |version, platform, os, type|
  it "returns 'Deezer' as its browser" do
    expect(useragent.browser).to eq('Deezer')
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

describe "UserAgent: Deezer/6.2.28.73 (Android; 11; Mobile; fr) samsung SM-G973F" do
  let(:useragent) { UserAgent.parse("Deezer/6.2.28.73 (Android; 11; Mobile; fr) samsung SM-G973F") }

  it_behaves_like 'Deezer', '6.2.28.73', 'Android', 'Android 11', :mobile
end

describe "UserAgent: Deezer/6.0.10.201 (Android; 5.1.1; Tablet; nl) samsung SM-T280" do
  let(:useragent) { UserAgent.parse("Deezer/6.0.10.201 (Android; 5.1.1; Tablet; nl) samsung SM-T280") }

  it_behaves_like 'Deezer', '6.0.10.201', 'Android', 'Android 5.1.1', :mobile
end

describe "UserAgent: Deezer/8.39.0.6 CFNetwork/1220.1 Darwin/20.3.0" do
  let(:useragent) { UserAgent.parse("Deezer/8.39.0.6 CFNetwork/1220.1 Darwin/20.3.0") }

  it_behaves_like 'Deezer', '8.39.0.6', 'iOS', 'iOS 14.4.x', :mobile
end

describe "UserAgent: Deezer/4.34.10 (Electron; windows/10.0.19041; Desktop; de)" do
  let(:useragent) { UserAgent.parse("Deezer/4.34.10 (Electron; windows/10.0.19041; Desktop; de)") }

  it_behaves_like 'Deezer', '4.34.10', 'Windows', 'Windows 10.0.19041', :desktop
end

describe "UserAgent: Deezer/4.34.10 (Electron; osx/10.16.0; Desktop; en)" do
  let(:useragent) { UserAgent.parse("Deezer/4.34.10 (Electron; osx/10.16.0; Desktop; en)") }

  it_behaves_like 'Deezer', '4.34.10', 'Macintosh', 'macOS 10.16.0', :desktop
end

describe "UserAgent: Deezer/4.18.50 (Electron; linux/5.11.0-16-generic; Desktop; us)" do
  let(:useragent) { UserAgent.parse("Deezer/4.18.50 (Electron; linux/5.11.0-16-generic; Desktop; us)") }

  it_behaves_like 'Deezer', '4.18.50', 'X11', '5.11.0-16-generic', :desktop
end

describe "UserAgent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.25.0 Chrome/73.0.3683.121 Electron/5.0.10 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.25.0 Chrome/73.0.3683.121 Electron/5.0.10 Safari/537.36") }

  it_behaves_like 'Deezer', '4.25.0', 'Macintosh', 'OS X 10.10.5', :desktop
end

describe "UserAgent: Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.27.0 Chrome/73.0.3683.121 Electron/5.0.10 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.27.0 Chrome/73.0.3683.121 Electron/5.0.10 Safari/537.36") }

  it_behaves_like 'Deezer', '4.27.0', 'Windows', 'Windows 10', :desktop
end

describe "UserAgent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.27.0 Chrome/76.0.3809.146 Electron/6.1.12 Safari/537.36" do
  let(:useragent) { UserAgent.parse("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Deezer/4.27.0 Chrome/76.0.3809.146 Electron/6.1.12 Safari/537.36") }

  it_behaves_like 'Deezer', '4.27.0', 'X11', 'Linux x86_64', :desktop
end
